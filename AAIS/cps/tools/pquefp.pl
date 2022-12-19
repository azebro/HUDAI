/* ***********************************************************************

This file is one of the files in the PATT (Parsing and Translation Tool),
which is part of the FAROAS conflict prediction system. It uses predicates
defined in other PATT files: hence all other PATT files must have been 
compiled beforehand in order to ensure correct operation of the predicates
in this file.

Filename: 	pquefp.pl			Author: Chris Taylor
========					======

Description 	
===========

Contains predicates for attempting to read an input file consisting of 
'input query clauses' of the form

query(Ax_no, Comment, TF_string).

and to produce an output file of corresponding 'output query clauses' of 
the form

query(Ax_no, Comment, Parsed_TF_expr, TF_string, Query_term).

Here, Ax_no and Comment are Prolog atoms; TF_string is an ASCII string
(list of ASCII characters) in 'Theoretical Form' (TF); Parsed_TF_expr 
is the result of parsing TF_string using the grammar for TF (see file 
'grammar.pl'), and Query_term is the translation of TF_string into an 
executable Prolog query term. For example, the clause 

query('Ax 1', 'Test 1 Result expected -  Yes', "10 N = 10 N ").

in the input file would lead to the corresponding clause

query('Ax 1', 'Test 1 Result expected -  Yes',
      same_lat(lat_N(10),lat_N(10)),
      "10 N = 10 N ",
      same_lat(lat_N(10),lat_N(10))).

in the output file.

The resulting output file is in a form suitable to act as an input file
for the 'test harness' program (see file 'tstharn.pl').
----------------------------------------------------------------------- */


/* ***********************************************************************
+,+,-   ***** N.B. must update comment
(Top-level predicate.)
Attempt to generate a Prolog program from the list of files
TF_clause_files, returning a list of evaluable functions Evaluable_fn_list, 
and a flag Error_flag1. 
If generation of CP prototype was unsuccessful (Error_flag1 = errors_found),
set Error_flag2 to Error_flag1 and take no further action; otherwise, 
attempt to read the query clauses in TF_query_file and to rewrite them in 
modified form to EF_output_chan, returning a value for Error_flag2 to indicate 
the outcome of this process. TF_query_file and EF_output_chan are as described 
in the header of this program file.

N.B. Evaluable_fn_list - which is produced during the generation of the
CP prototype from the CP specification - is required for the correct
translation of TF_strings into Prolog queries. It is a list of the form 
[(Fname1,Arity1),(Fname2,Arity2),..., ], where Fname1, Fname2, ..., are
TF function names, and Arity1, Arity2, ..., etc. are the corresponding
arities (i.e. no. of arguments required). 
----------------------------------------------------------------------- */
% Now +,+,+,-,-,-

translate_to_efp_queries(TF_query_file, TF_clause_files, Output_mode,
			 EF_output_chan, EF_clause_file, Error_flag2):-
	name(TF_query_file, Chars),
	output_efpq_chan_name(Output_mode, Chars, EF_output_chan),
	translate_to_efp_clauses(TF_clause_files, file_out,
				 EF_clause_file, Error_flag1, 
				 Evaluable_fn_list, Eqsort_list), !,
	(Error_flag1 = errors_found, !,
	 Error_flag2 = errors_found
	 ;
	 see_seen_see(TF_query_file),   % open TF_query_file for reading
	 tell_told_tell(EF_output_chan), % open EF_output_chan for writing
	 read_wffs_and_gen_queries(Evaluable_fn_list, Eqsort_list,
				   Error_flag1, Error_flag2),
	 seen,		    % close TF_query_file
	 told), !.	    % close EF_output_chan

/* Examples:
?- translate_to_efp_queries('lat_data', ['spec','fis'], user, _, _, F).
?- translate_to_efp_queries('lat_data', ['spec','fis'], file_out, _, _, F).
*/

output_efpq_chan_name(user, _, user):- !.
output_efpq_chan_name(file_out, Root_chars, Output_file):-
	add_suffix(Root_chars, ".efpq", Output_file), !.


/* ***********************************************************************
read_wffs_and_gen_queries(+Evaluable_fn_list, +Eqsort_list, 
			  +Error_flag_in, -Error_flag_out).

----------------------------------------------------------------------- */

read_wffs_and_gen_queries(Evaluable_fn_list, Eqsort_list,
			  Error_flag_in, Error_flag_out):-
	read(Query_clause),
	(Query_clause = end_of_file,
	 Error_flag_out = Error_flag_in
	 ;
	 try_to_gen_query_for(Query_clause, Evaluable_fn_list,
			      Eqsort_list, Error_flag_in, Error_flag),
	 read_wffs_and_gen_queries(Evaluable_fn_list, Eqsort_list,
				   Error_flag, Error_flag_out)), !.


/* ***********************************************************************
try_to_gen_query_for(+Query_clause, +Evaluable_fn_list, +Eqsort_list,
		     +Error_flag_in, -Error_flag_out).

----------------------------------------------------------------------- */

try_to_gen_query_for(query(Ax_no, Comment, TF_string), Evaluable_fn_list, 
		     Eqsort_list, Error_flag_in, Error_flag_in):-
	parse_wff(TF_string, Parsed_TF_expr), % fails with error message if 
					      % can't parse
	insert_univ_quantifiers_for_free_tf_vars(Free_vars, Parsed_TF_expr,
						 Parsed_TF_expr1),
	query_for(Parsed_TF_expr1, Evaluable_fn_list, 
		  Eqsort_list, Query_term), % fails if can't convert
	write_query_info(Ax_no, Comment, Parsed_TF_expr1, 
			 TF_string, Query_term), !.

try_to_gen_query_for(query(Ax_no, Comment, TF_string), _, _, _, errors_found):-
	nl,
	write('Failed to convert into query:'),
	nl,
	write_string(TF_string),	
	nl,
	nl,
	nl,
	nl, !.


/* ***********************************************************************
write_query_info(+Ax_no, +Comment, +Parsed_TF_expr, 
		 +TF_string, +Query_term).

----------------------------------------------------------------------- */

write_query_info(Ax_no, Comment, Parsed_TF_expr, TF_string, Query_term):-
	write('query('), 
	writeq(Ax_no),
	write(', '),
	writeq(Comment),  % (Comment about this query)
	write(','),
	nl,
	tab(6),
	writeq(Parsed_TF_expr),	% parsed form of TF - needed by
	write(','),		% test harness program to generate
	nl,			% 'validation form' of query.
	tab(6),
	write('"'),
	write_string(TF_string),	% initial TF form of query (as a
	write('",'),		% string of ASCII characters)
	nl,
	tab(6),
	write(Query_term),	% Prolog form of query
	write(').'),
	nl,
	nl, !.


/* ***********************************************************************
query_for(+Parsed_TF_expr, +Evaluable_fn_list, +Eqsort_list, -Query_term).


----------------------------------------------------------------------- */

query_for(Parsed_TF_expr, Evaluable_fn_list, Eqsort_list, Query_term):-
	tr1(Parsed_TF_expr, Evaluable_fn_list, Eqsort_list, Proto_query),
	tr2(Proto_query, Evaluable_fn_list, Query_term), !.
	

/* ***********************************************************************
tr1(+Parsed_TF_expr, +Evaluable_fn_list, +Eqsort_list, -Proto_query_term).

Performs 1st stage of translation process.
----------------------------------------------------------------------- */	

tr1((Wff1 & Wff2), Evaluable_fn_list, Eqsort_list, (Tr_Wff1,Tr_Wff2)):- !,
	tr1(Wff1, Evaluable_fn_list, Eqsort_list, Tr_Wff1),
	tr1(Wff2, Evaluable_fn_list, Eqsort_list, Tr_Wff2), !.

tr1((Wff1 or Wff2), Evaluable_fn_list, Eqsort_list, (Tr_Wff1;Tr_Wff2)):- !,
	tr1(Wff1, Evaluable_fn_list, Eqsort_list, Tr_Wff1),
	tr1(Wff2, Evaluable_fn_list, Eqsort_list, Tr_Wff2), !.

tr1(not(exists(_,Wff)), Evaluable_fn_list, Eqsort_list, \+(Tr_Wff)):- !,
	tr1(Wff, Evaluable_fn_list, Eqsort_list, Tr_Wff), !.

% next clause applies to other negations
tr1(not(Wff), Evaluable_fn_list, Eqsort_list, not(Tr_Wff)):- !,
	tr1(Wff, Evaluable_fn_list, Eqsort_list, Tr_Wff), !.

tr1(exists(_,Wff), Evaluable_fn_list, Eqsort_list, Tr_Wff):- !,
	tr1(Wff, Evaluable_fn_list, Eqsort_list, Tr_Wff), !.

tr1(Wff, Evaluable_fn_list, Eqsort_list, Wff1):-
	fn_defn_eqn(Wff, Fn_term, Expr), 
	functor(Fn_term, Fname, Arity),
	member((Fname,Arity), Evaluable_fn_list), 
	create_expr_with_extra_arg(Fn_term, Expr, Wff1), !.

% next clause applies to any other equalities for which equality predicate
% is defined.
tr1(=(Sort,Term1,Term2), Evaluable_fn_list, Eqsort_list, Wff1):-
	member(Sort, Eqsort_list), !,
	name(Sort, Chars),
	append("same_", Chars, Eq_pred_chars),
	name(Eq_pred, Eq_pred_chars),
	Wff1 =.. [Eq_pred, Term1, Term2], !.

% next clause applies to any other equalities for which equality predicate
% is undefined.
tr1(=(Sort,Term1,Term2), Evaluable_fn_list, Eqsort_list, (Term1=Term2)):- !.
%	\+(member(Sort, Eqsort_list)), 

tr1(Wff, Evaluable_fn_list, Eqsort_list, Wff):-
%	any other atomic wff
	atomic_wff(Wff), !.


/* ***********************************************************************
tr2(+Proto_query_term, +Evaluable_fn_list, -Query_term1).

Performs 2nd stage of translation process.
----------------------------------------------------------------------- */

tr2(Proto_query_term, Evaluable_fn_list, Query_term1):-
	evaluable_fn_terms_in(Proto_query_term, Evaluable_fn_list, Terms),
	tf_vars_in(Proto_query_term, Used_vars),
	insert_new_subgoals_for(Terms, Used_vars, [], [], 
				Proto_query_term, Query_term), 
	replace_numeral_prefixed_atoms_in(Query_term, Query_term1), !.

