/* ***********************************************************************

This file is one of the files in the PATT (Parsing and Translation Tool),
which is part of the FAROAS conflict prediction system. It uses predicates
defined in other PATT files: hence all other PATT files must have been 
compiled beforehand in order to ensure correct operation of the predicates
in this file. THIS IS A SICSTUS PROLOG VERSION.

Filename: 	efp.pl			Author: Chris Taylor
========			 	======

Description 	
===========

This file contains predicates for translating axioms in 'Theoretical Form'
(TF) into an 'Execution Form' of Prolog clauses (EFP clauses).

*/
/* ************************************************************************
+,+,-,-,-,-
------------------------------------------------------------------------ */

translate_to_efp_clauses([Input_file|Input_files], Output_mode, Output_chan, 
			 Error_flag_out, Fn_list, Eqsort_list):-		
	concatenated_name_chars([Input_file|Input_files], Rootchars),
	output_efpc_chan_name(Output_mode, Rootchars, Output_chan),
	add_suffix(Rootchars, ".work", Work_file),
	see_seen_see(Input_file),  % open 1st Input_file for reading axioms
	tell_told_tell(Work_file), % open Work_file for 1st stage output
	bagof((Fname,Arity), evaluable_primitive_fn(Fname,Arity), Fn_list_in),
	read(String),	 % 'read ahead' 1st string
	read_axs_and_gen_proto_clauses(String, Input_files, no_errors_found, 
				       Fn_list_in, 
				       [],		% initial eq. sort list
				       Error_flag,	% indicates outcome
				       Fn_list,
				       Eqsort_list),
	seen,		% close last of Input_files for reading
	told,		% close Work_file for writing
	see_seen_see(Work_file),	% open Work_file for reading
	tell_told_tell(Output_chan),	% open Output_chan for writing
	try_to_transform_proto_clauses(Error_flag, Error_flag_out,
				       Fn_list, Eqsort_list), 
	seen,		% close Work_file
	told, !.	% close Output_chan	

output_efpc_chan_name(user, _, user):- !.
output_efpc_chan_name(file_out, Rootchars, Output_file):-
	add_suffix(Rootchars, ".efpc", Output_file), !.

/* TLMc Jun 96 - mod to allow config file name: */
output_efpc_chan_name(X,_,X) :- !.

 
tf2ef(O,F,A,B) :- translate_to_efp_clauses(['patt_in.msl'],file_out, O, F, A, B).
/* Examples:
?- translate_to_efp_clauses(['spec','fis'], user, O, F, _, _).  */


/* ************************************************************************
+,-
------------------------------------------------------------------------ */

concatenated_name_chars([Atom], Chars):- !,
	name(Atom, Chars), !.
concatenated_name_chars([Atom1, Atom2|Atoms], Chars3):-
	name(Atom1, Chars1),
	concatenated_name_chars([Atom2|Atoms], Chars2),
	append(Chars1, [35|Chars2], Chars3), !. % 35 is ASCII for '#'
	

/* ************************************************************************
+,+,-
------------------------------------------------------------------------ */

add_suffix(Root_chars, Suffix_chars, New_atom):-
	append(Root_chars, Suffix_chars, Chars),
	name(New_atom, Chars), !.


/* ***********************************************************************
+,+,+,+,-,-,-

----------------------------------------------------------------------- */

read_axs_and_gen_proto_clauses(end_of_file, [],
			       Error_flag_in, Fn_list_in, Eqsort_list_in,
			       Error_flag_in, Fn_list_in, 
			       Eqsort_list_in):- !.
		
read_axs_and_gen_proto_clauses(end_of_file, [Next_input_file|Input_files],
			       Error_flag_in, Fn_list_in, Eqsort_list_in,
			       Error_flag_out, Fn_list_out, 
			       Eqsort_list_out):- !,
	seen,	% close current input file for reading
	see_seen_see(Next_input_file), % open next file for reading
	read(String),	% 'read ahead' first string
	read_axs_and_gen_proto_clauses(String, Input_files, 
			       Error_flag_in, Fn_list_in, Eqsort_list_in,
			       Error_flag_out, Fn_list_out, 
			       Eqsort_list_out), !.

read_axs_and_gen_proto_clauses(Axiom_string, Input_files, 
			       Error_flag_in, Fn_list_in,
			       Eqsort_list_in,
			       Error_flag_out, Fn_list_out,
			       Eqsort_list_out):-
%	not__(Axiom_string = end_of_file),
	try_to_gen_proto_clauses(Axiom_string, Error_flag_in, Fn_list_in, 
				 Eqsort_list_in, Error_flag, Fn_list,
				 Eqsort_list),
	read(Next_string),
	read_axs_and_gen_proto_clauses(Next_string, Input_files, 
				       Error_flag, Fn_list,
				       Eqsort_list, Error_flag_out,
				       Fn_list_out, Eqsort_list_out), !.


/* ***********************************************************************
see_seen_see(+File).

Open File for reading, close it, and open it again for reading. The use
of this procedure ensures that reading from File will always begin from
the start of the file. (If 'see(File)' is used and execution of the 
program is aborted and then restarted before 'seen' is called, reading
from File will recommence from the point where it was when execution was
aborted.)
----------------------------------------------------------------------- */

see_seen_see(File):-
	see(File),
	seen,
	see(File), !.


/* ***********************************************************************
tell_told_tell(+File).

Open File for writing, close it, and open it again for writing. The use
of this procedure ensures that writing to File will always begin from
the start of the file. (If 'tell(File)' is used and execution of the 
program is aborted and then restarted before 'told' is called, writing 
to File will recommence from the point where it was when execution was
aborted.)
----------------------------------------------------------------------- */

tell_told_tell(File):-
	tell(File),
	told,
	tell(File), !.


/* ***********************************************************************


----------------------------------------------------------------------- */

% evaluable_primitive_fn(the_first_recognised_4D_pt_for_oceanic_cpr_of,1).
evaluable_primitive_fn(the_last_recognised_4D_pt_for_oceanic_cpr_of,1).
evaluable_primitive_fn(the_Type_of,1).
evaluable_primitive_fn(the_Aircraft_on_profile,1).
evaluable_primitive_fn(time_of_current_conflict_probe,0).


/* ***********************************************************************
+,+,+,+,-,-,-

2nd clause is invoked if parsing fails or translation into 'Proto_clauses'
fails.
----------------------------------------------------------------------- */

try_to_gen_proto_clauses(String, 
			 Error_flag_in, Fn_list_in, Eqsort_list_in,
			 Error_flag_in, Fn_list_out, Eqsort_list_out):-
	parse_wff(String, W), % fails with err.message if can't
	proto_clauses_of(W, Proto_clauses), % fails if can't convert W
	update_fn_list_and_eqsort_list(Proto_clauses,
			 	       Fn_list_in, Eqsort_list_in,
			               Fn_list_out, Eqsort_list_out),
	write_clause_term_list(Proto_clauses, writeq), !.
try_to_gen_proto_clauses(String,  
			 Error_flag_in, Fn_list_in, Eqsort_list_in,
			 error_found, Fn_list_in, Eqsort_list_in):-
	nl,
	write('Could not transform to proto-clause : '),
	nl,
	write_string(String),	
	nl.


/* ***********************************************************************
proto_clauses_of(+Wff, -Proto_clauses).

Proto-clauses are the 1st-stage prototype clause terms corresponding 
to Wff.
----------------------------------------------------------------------- */

proto_clauses_of(Wff, Clauses):- 
	stack_proto_clauses_of(Wff, [], Clauses), !.
                
/* Examples:
?- proto_clauses_of().  
*/

/* **********************************************************************
stack_proto_clauses_of(+Wff, +Proto_clause_stack_in,
                       -Proto_clause_stack_out).

Proto_clause_stack_out is the result of stacking the proto-clauses of Wff 
onto the front of the list Proto_clause_stack_in.

Note that translation rules are only provided for a limited range of 
syntactic forms. Consequently this predicate will fail for some top-level 
forms, e.g. for wffs which are disjunctive at the top-level. This is as it 
should be, since full-first-order logic has greater expressive power than 
Horn Clause logic.
---------------------------------------------------------------------- */

stack_proto_clauses_of(all(_, Wff), Proto_clause_stack_in, 
                       Proto_clause_stack_out):- !,
	stack_proto_clauses_of(Wff, Proto_clause_stack_in, 
 			       Proto_clause_stack_out), !.
		
stack_proto_clauses_of(Wff1 & Wff2, Proto_clause_stack_in,
		       Proto_clause_stack_out):- !,
        stack_proto_clauses_of(Wff2, Proto_clause_stack_in, 
			       Proto_clause_stack),
        stack_proto_clauses_of(Wff1, Proto_clause_stack,
			       Proto_clause_stack_out), !.

stack_proto_clauses_of(Wff1 => (Wff2 & Wff3), Proto_clause_stack_in,
		       Proto_clause_stack_out):- !,
        stack_proto_clauses_of(Wff1 => Wff3, Proto_clause_stack_in,
			       Proto_clause_stack),
        stack_proto_clauses_of(Wff1 => Wff2, Proto_clause_stack,
			       Proto_clause_stack_out), !.

stack_proto_clauses_of(Wff1 => (Wff2 => Wff3), Proto_clause_stack_in,
		       Proto_clause_stack_out):- !,
        stack_proto_clauses_of((Wff1 & Wff2) => Wff3,
			       Proto_clause_stack_in,
			       Proto_clause_stack_out), !.

/* In next clause, assume wff is intended as a conditional defn. of 
Atom, even if Wff2 is also atomic */
%% modified MMW 19/3/96 to insert cuts after every clause
%%beg of modification
stack_proto_clauses_of(Wff1 => (Atom <=> Wff2), Proto_clause_stack_in,
                       [(Atom:-Subgoals)|Proto_clause_stack_in]):-
        atomic_wff(Atom), !,
        proto_subgoals_of((Wff1 & Wff2) & !, Subgoals), !.

%% stack_proto_clauses_of(Wff1 => (Atom <=> Wff2), Proto_clause_stack_in,
%% 		       [(Atom:-Subgoals)|Proto_clause_stack_in]):- 
  %%       atomic_wff(Atom), !,
    %%     proto_subgoals_of(Wff1 & Wff2, Subgoals), !.


/* In next clause, assume wff is intended as an unconditional defn. of 
Atom, even if Wff is also atomic */
stack_proto_clauses_of(Atom <=> Wff, Proto_clause_stack_in,
                       [(Atom:-Subgoals)|Proto_clause_stack_in]):-
        atomic_wff(Atom), !,
        proto_subgoals_of(Wff & !, Subgoals), !.

%% stack_proto_clauses_of(Atom <=> Wff, Proto_clause_stack_in,
%% 		       [(Atom:-Subgoals)|Proto_clause_stack_in]):-
  %%       atomic_wff(Atom), !,
    %%     proto_subgoals_of(Wff, Subgoals), !.

stack_proto_clauses_of(Wff => Atom, Proto_clause_stack_in,
                       [(Atom:-Subgoals)|Proto_clause_stack_in]):-
        atomic_wff(Atom), !,
        proto_subgoals_of(Wff & !, Subgoals), !.

%%stack_proto_clauses_of(Wff => Atom, Proto_clause_stack_in,
%%		       [(Atom:-Subgoals)|Proto_clause_stack_in]):-
 %%       atomic_wff(Atom), !,
  %%      proto_subgoals_of(Wff, Subgoals), !.
                
%% end of modification
stack_proto_clauses_of(Atom, Proto_clause_stack_in,
		       [Atom|Proto_clause_stack_in]):- 
	atomic_wff(Atom), !.


/* ************************************************************************
atomic_wff(+Expr).

The expression Expr is an atomic wff.
------------------------------------------------------------------------ */

atomic_wff(Expr):-
	nonvar(Expr),
	functor(Expr, F, _),
	not__(member(F,[all,exists,&,or,not,not__,=>,<=>,'\+'])), 
%%        not__(member(F,[all,exists,&,or,not,not__,ground_not__,=>,<=>,'\+']))
           !.


/* ***********************************************************************
proto_subgoals_of(+Wff, -Proto_subgoals).

Proto_subgoals are the 1st stage prototype subgoals corresponding to Wff.
Add ! at end? (Just call this proc with (Wff & !))
----------------------------------------------------------------------- */

proto_subgoals_of((A & B) & C, Proto_subgoals):- !,
	proto_subgoals_of(A & (B & C), Proto_subgoals), !.

proto_subgoals_of(A & B, (GlsA,GlsB)):- !,
	proto_subgoals_of(A, GlsA),
	proto_subgoals_of(B, GlsB), !.

proto_subgoals_of((A or B) or C, Proto_subgoals):- !,
	proto_subgoals_of(A or (B or C), Proto_subgoals), !.

proto_subgoals_of(A or B, (GlsA;GlsB)):- !,
	proto_subgoals_of(A, GlsA),
	proto_subgoals_of(B, GlsB), !.

/* Check issue of 'not' being ground or not */
/* For not exists, goal is not ground? MMW */ 
proto_subgoals_of(not__(exists(_,A)), not__(GlsA)):- !,
	proto_subgoals_of(A, GlsA), !.

/* For other types of negation, goal must be ground MMW */

proto_subgoals_of(not__(A), ground_not__(GlsA)):- !,
%%proto_subgoals_of(not__(A), not__(GlsA)):- !,
	proto_subgoals_of(A, GlsA), !.	

proto_subgoals_of(A => B, (not__(GlsA);GlsB)):- !,
	proto_subgoals_of(A, GlsA), 
	proto_subgoals_of(B, GlsB), !.

proto_subgoals_of(A <=> B, ((not__(GlsA);GlsB),(not__(GlsB);GlsA))):- !,
	proto_subgoals_of(A, GlsA), 
	proto_subgoals_of(B, GlsB), !.

/* should check for var clash */
proto_subgoals_of(exists(_,A), GlsA):- !,
	proto_subgoals_of(A, GlsA), !.

proto_subgoals_of(Atom, Atom):-
	atomic_wff(Atom), !.

/* Examples:
?- proto_subgoals_of(p(a) & q('X'), S). ;; S = (p(a),q('X'))   
*/

/* ************************************************************************
+,+,+,-,-. 

------------------------------------------------------------------------ */

update_fn_list_and_eqsort_list([],
			       Fn_list_in, Eqsort_list_in,
			       Fn_list_in, Eqsort_list_in):- !.
update_fn_list_and_eqsort_list([Proto_clause|Proto_clauses],
			       Fn_list_in, Eqsort_list_in,
			       Fn_list_out, Eqsort_list_out):-
	head_of(Proto_clause, Head),
	stack_if_new_eqsort_or_evaluable_fn_defn(Head, 
						 Fn_list_in, Eqsort_list_in,
					   	 Fn_list, Eqsort_list), !,
	update_fn_list_and_eqsort_list(Proto_clauses,
				       Fn_list, Eqsort_list,
			       	       Fn_list_out, Eqsort_list_out), !.


/* ***********************************************************************
head_of(+Clause_term, -Head).

'Head' is the head of Clause_term.
----------------------------------------------------------------------- */

head_of((Head :- Body), Head):- !.
head_of(Head, Head).


/* ***********************************************************************
+,+,+,-,-

----------------------------------------------------------------------- */

stack_if_new_eqsort_or_evaluable_fn_defn(Clause_head,
				  Fn_list_in, Eqsort_list_in,
				  [(Fname,Arity)|Fn_list_in],
				  Eqsort_list_in):-
	fn_defn_eqn(Clause_head, Fn_term, _),
	functor(Fn_term, Fname, Arity),
	not__(member((Fname,Arity), Fn_list_in)), !.
stack_if_new_eqsort_or_evaluable_fn_defn(=(Sort,Term1,Term2), 
					 Fn_list_in,
					 Eqsort_list_in,
					 Fn_list_in,
					 [Sort|Eqsort_list_in]):-
	atomic(Term1),	% not a functional term
	atomic(Term2),
	not__(member(Sort, Eqsort_list_in)), !.
stack_if_new_eqsort_or_evaluable_fn_defn(_, Fn_list_in, Eqsort_list_in,
					 Fn_list_in, Eqsort_list_in).


/* ***********************************************************************
fn_defn_eqn(+Atomic_wff, -Fn_term, -Fn_val_term).

----------------------------------------------------------------------- */
/*
fn_defn_eqn(=(Sort,Fn_val_term,Fn_term), Fn_term, Fn_val_term):-
	atomic(Fn_val_term),	
	not__(atomic(Fn_term)), !.  */

fn_defn_eqn(=(Sort,Fn_term,Fn_val_term), Fn_term, Fn_val_term):-
%	not__(atomic(Fn_term)), !.
	not__(is_tf_variable(Fn_term)), !.
% N.B. Constants are viewed as 'zero-arity functions'.


/* ************************************************************************
create_expr_with_extra_arg(+Expr, +Extra_arg, -New_expr).

New_expr is the expression obtained by adding the extra argument Extra_arg 
to the expression Expr.
------------------------------------------------------------------------ */

create_expr_with_extra_arg(Expr, Extra_arg, New_expr):-
    functor(Expr, Fname, Arity),
    New_arity is Arity + 1,
    functor(New_expr, Fname, New_arity),
    same_args_up_to_argno(Arity, Expr, New_expr),
    arg(New_arity, New_expr, Extra_arg), !.

/* Example:
?- create_expr_with_extra_arg(p(bar), foo, N). % N = p(bar,foo)
*/

/* ***********************************************************************
same_args_up_to_argno(+N, +Term1, +Term2).

Term1 and Term2 (assumed to be wholly or partially instantiated terms)
have the same arguments (if any) up to and including their Nth arguments.
----------------------------------------------------------------------- */

same_args_up_to_argno(0, Term1, Term2):- !.
same_args_up_to_argno(N, Term1, Term2):-
    N > 0,
    arg(N, Term1, Nth_arg),
    arg(N, Term2, Nth_arg),
    M is N - 1, !,
    same_args_up_to_argno(M, Term1, Term2).

/* Examples:
?- same_args_up_to_argno(2, p(a,b,c), q(a,b,d)).  % yes
?- same_args_up_to_argno(2, p(a,b,c), p(a,c,b).   % no
?- same_args_up_to_argno(2, p(a,b,c), p(a,b,e).   % yes
*/

/* ***********************************************************************
+,-,+,+
----------------------------------------------------------------------- */
	
try_to_transform_proto_clauses(error_found, error_found,
			       Fn_list, Eqsort_list):-
	write('1st stage translation to EFP did not succeed for every axiom'),
	nl. 
try_to_transform_proto_clauses(no_errors_found, Error_flag_out,
			       Fn_list, Eqsort_list):-
	write_prototype_header__,	% system-specific predicate
	transform_proto_clauses(Fn_list, Eqsort_list, 
				no_errors_found, Error_flag_out), !.


/* ***********************************************************************
+,+,+,-

----------------------------------------------------------------------- */

transform_proto_clauses(Evaluable_fn_list, Eqsort_list,
			Error_flag_in, Error_flag_out):-
	read(Proto_clause),
	(Proto_clause = end_of_file, !,
	 Error_flag_out = Error_flag_in
	 ;
	 try_to_transform(Proto_clause, Evaluable_fn_list, Eqsort_list,
			  Error_flag_in, Error_flag),
	 transform_proto_clauses(Evaluable_fn_list, Eqsort_list,
				 Error_flag, Error_flag_out)), !.

	
/* ***********************************************************************
+,+,+,+,-
Always succeeds.
----------------------------------------------------------------------- */

try_to_transform(Proto_clause, Evaluable_fn_list, Eqsort_list,
		 Error_flag_in, Error_flag_in):-
	transform(Proto_clause, Evaluable_fn_list, Eqsort_list, Clause),
	write_clause_term(Clause, 0, change_numeral_prefixes_write),   
% start with tab of 0 from left-hand margin
	write('.'),
	nl,
	nl, !.
try_to_transform(Proto_clause, _, _, _, error_found):-
	write('Failed to transform'),
	nl,
	write_clause_term(Proto_clause, 0, change_numeral_prefixes_write),
	nl,
	nl, !.


/* ***********************************************************************
+,+,+,-
----------------------------------------------------------------------- */

transform((Head :- Body), Evaluable_fn_list, Eqsort_list, New_wff):- !,
	transform_head_if_equality(Head, Head1),
	transform_for_equalities(Body, Evaluable_fn_list, 
				 Eqsort_list, Body1),
	transform_for_fn_terms((Head1 :- Body1), 
			       Evaluable_fn_list, New_wff), !.	

transform(Head, Evaluable_fn_list, Eqsort_list, New_wff):- 
%	not__(Head = (_ :- _)),
	transform_head_if_equality(Head, Head1),
	transform_for_fn_terms(Head1, 
			       Evaluable_fn_list, New_wff), !.	


/* ***********************************************************************

----------------------------------------------------------------------- */

transform_head_if_equality(Head, New_head):-
	fn_defn_eqn(Head, Fn_term, Expr), !,
	create_expr_with_extra_arg(Fn_term, Expr, New_head), !.

% next clause applies to any other equalities
transform_head_if_equality(=(Sort,Term1,Term2), New_head):- !,
	name(Sort, Chars),
	append("same_", Chars, Eq_pred_chars),
	name(Eq_pred, Eq_pred_chars),
	New_head =.. [Eq_pred, Term1, Term2], !.

transform_head_if_equality(Head, Head).


/* ***********************************************************************
+,+,+,-
----------------------------------------------------------------------- */

transform_for_equalities((Conj1,Conj2), Evaluable_fn_list, Eqsort_list,
		     	 (New_conj1,New_conj2)):- !,
	transform_for_equalities(Conj1, Evaluable_fn_list, Eqsort_list, 
				 New_conj1),
	transform_for_equalities(Conj2, Evaluable_fn_list, Eqsort_list, 
				 New_conj2), !.

transform_for_equalities((Disj1;Disj2), Evaluable_fn_list, Eqsort_list,
		     	 (New_disj1;New_disj2)):- !,
	transform_for_equalities(Disj1, Evaluable_fn_list, Eqsort_list, 
				 New_disj1),
	transform_for_equalities(Disj2, Evaluable_fn_list, Eqsort_list, 
				 New_disj2), !.

transform_for_equalities(not__(Wff), Evaluable_fn_list, Eqsort_list,
			 not__(New_wff)):- !,
	transform_for_equalities(Wff, Evaluable_fn_list, Eqsort_list,
				 New_wff), !.

/* experiment - goal is ground MMW */

transform_for_equalities(ground_not__(Wff), Evaluable_fn_list, Eqsort_list,
			 ground_not__(New_wff)):- !,
	transform_for_equalities(Wff, Evaluable_fn_list, Eqsort_list,
				 New_wff), !.


transform_for_equalities(Atomic_wff, Evaluable_fn_list, Eqsort_list,
			 New_atomic_wff):- 
	fn_defn_eqn(Atomic_wff, Fn_term, Expr), 
	atomic(Expr), % experimental addition
	functor(Fn_term, Fname, Arity),
	member((Fname,Arity), Evaluable_fn_list), !,
	create_expr_with_extra_arg(Fn_term, Expr, New_atomic_wff), !.

% next 2 clauses cover any other equalities
transform_for_equalities(=(Sort,Term1,Term2), Evaluable_fn_list, Eqsort_list,
			 New_atomic_wff):- 
	member(Sort, Eqsort_list), !, % Sort with non-primitive equality rel.
	name(Sort, Chars),
	append("same_", Chars, Eq_pred_chars),
	name(Eq_pred, Eq_pred_chars),
	New_atomic_wff =.. [Eq_pred, Term1, Term2], !.

% next clause applies to primitive equalities
transform_for_equalities(=(Sort,Term1,Term2), Evaluable_fn_list, Eqsort_list,
			 (Term1 = Term2)):- !.
%	not__(member(Sort, Eqsort_list))

% next clause applies to any other atomic wffs
transform_for_equalities(Atomic_wff, _, _, Atomic_wff).
%	atomic_wff(Atomic_wff)


/* ***********************************************************************
+,+,-
----------------------------------------------------------------------- */

transform_for_fn_terms((Head:-Body), Evaluable_fn_list, 
		       (New_head:-New_body)):- !,
	tf_vars_in((Head:-Body), Used_vars),
	evaluable_fn_terms_in((Head:-Body), 
			      Evaluable_fn_list, Terms),
	insert_new_subgoals_for(Terms, Used_vars, Head, 
				    New_head,
				    Body, New_body), !.	

transform_for_fn_terms(Head, Evaluable_fn_list, Transformed_wff):- !,
%	not__(Head = (_:-_)),
	tf_vars_in(Head, Used_vars),
	evaluable_fn_terms_in(Head, Evaluable_fn_list, Terms),
	(Terms = [], !,
	 Transformed_wff = Head
	 ;
	 insert_new_subgoals_for(Terms, Used_vars, Head, New_head,
				     !, New_body), % start body with '!'
	 Transformed_wff = (New_head :- New_body)), !.


/* ***********************************************************************
+,-

----------------------------------------------------------------------- */

tf_vars_in(Expr, Vars):-
	stack_tf_vars(Expr, [], Vars), !.


/* ***********************************************************************
+,+,-

----------------------------------------------------------------------- */

stack_tf_vars(Expr, Var_stack_in, [Expr|Var_stack_in]):- 
	is_tf_variable(Expr), !.
stack_tf_vars(Expr, Var_stack_in, Var_stack_out):-
% 	not__(is_tf_variable(Expr)),
	functor(Expr, Fname, Arity),
	stack_tf_vars_up_to_argno(Arity, Expr, Var_stack_in,
				  Var_stack_out), !.


/* ***********************************************************************
+,+,+,-

----------------------------------------------------------------------- */

stack_tf_vars_up_to_argno(0, _, Var_stack_in, Var_stack_in):- !.
stack_tf_vars_up_to_argno(N, Expr, Var_stack_in, Var_stack_out):- 
	N > 0,	
	arg(N, Expr, Nth_arg),
	stack_tf_vars(Nth_arg, Var_stack_in, Var_stack),
	M is N - 1, !,
	stack_tf_vars_up_to_argno(M, Expr, Var_stack, Var_stack_out),
	!.


/* ***********************************************************************
+,+,-

----------------------------------------------------------------------- */

evaluable_fn_terms_in(Expr, Evaluable_fn_list, Fn_terms):- 
	stack_evaluable_fn_terms(Expr, any_evaluable_fns,
				 Evaluable_fn_list, [], Fn_terms), !.


/* ***********************************************************************
+,+,+,+,-

----------------------------------------------------------------------- */

stack_evaluable_fn_terms(Expr, any_evaluable_fns, Evaluable_fn_list,
			 Term_stack_in, Term_stack_out):-
	functor(Expr, Fname, Arity),
	member((Fname,Arity), [(+,2),(-,2),(*,2),(/,2),(-,1),(mod,2),
			       (abs,1),(sin,1),(cos,1),(tan,1),(exp,2),
			       (sqrt,1),(integer,1),(round,1),(max,2),(min,2)]), !,
	delete_first(Expr, Term_stack_in, Term_stack),  % get rid of any
						  % earlier occs. 
	stack_evaluable_fn_terms_up_to_argno(Arity, not_arith_fns,
					     Expr, 
					     Evaluable_fn_list,
					    [Expr|Term_stack],
					    Term_stack_out), !.

stack_evaluable_fn_terms(Expr, Any_fn_type, Evaluable_fn_list,
			 Term_stack_in, Term_stack_out):-
	functor(Expr, Fname, Arity),
	member((Fname,Arity), Evaluable_fn_list), % for Sicstus
%	(member((Fname,Arity), Evaluable_fn_list)
%	 ;
%	 member((Fname,Arity), 
%		[(abs,1),(sin,1),(cos,1),(tan,1),(pow,2),(sqrt,1),
%		 (integer,1),(round,1),(max,2),(min,2)])), !,
	delete_first(Expr, Term_stack_in, Term_stack),
	stack_evaluable_fn_terms_up_to_argno(Arity, any_evaluable_fns,
					     Expr, 
					     Evaluable_fn_list,
					    [Expr|Term_stack],
					    Term_stack_out), !.
stack_evaluable_fn_terms(Expr, Fn_type, Evaluable_fn_list,
			 Term_stack_in, Term_stack_out):-
%	non-evaluable term	
	functor(Expr, _, Arity), !,
	stack_evaluable_fn_terms_up_to_argno(Arity, Fn_type, 
					     Expr, 
					     Evaluable_fn_list,
					     Term_stack_in,
					     Term_stack_out), !.


/* ***********************************************************************
+,+,+,+,+,-

----------------------------------------------------------------------- */

stack_evaluable_fn_terms_up_to_argno(0, _, Expr, _, Terms_in, Terms_in):- !.
stack_evaluable_fn_terms_up_to_argno(N, Fn_type, Expr,  Evaluable_fn_list,
				     Terms_in, Terms_out):-
%	N > 0,	
	arg(N, Expr, Nth_arg),
	stack_evaluable_fn_terms(Nth_arg, Fn_type, Evaluable_fn_list, 
				 Terms_in, Terms),
	M is N - 1, !,
	stack_evaluable_fn_terms_up_to_argno(M, Fn_type, Expr, 
					     Evaluable_fn_list,
					     Terms, Terms_out), !.


/* ***********************************************************************
write_clause_term_list(+Clause_term_list, +Write_proc).

Write out to the current Prolog output stream the clause terms in 
Clause_term_list, using the Prolog system predicate Write_proc to write
individual clause heads and subgoals. 
----------------------------------------------------------------------- */

write_clause_term_list([], _):- !.
write_clause_term_list([Clause_term|T], Write_proc):- 
	write_clause_term(Clause_term, 0, Write_proc), !, % start tab of 0
	write('.'),
	nl,
	nl,
	write_clause_term_list(T, Write_proc), !.


/* ***********************************************************************
write_clause_term(+Clause_term, +LH_tab, +Write_proc).

>From a starting position indented by LH_tab from the left-hand margin,
write out the Prolog term Clause_term to the current output stream, 
using the Prolog system predicate Write_proc to write
individual clause heads and subgoals.
----------------------------------------------------------------------- */

write_clause_term((Head :- Body), LH_tab, Write_proc):- !,
	do_write(Head, Write_proc),
	write(':-'),
	nl,
	New_tab is LH_tab + 4,
	tab(New_tab),
	write_clause_term(Body, New_tab, Write_proc), !.
write_clause_term((A,B), LH_tab, Write_proc):- !,
	write_clause_term(A, LH_tab, Write_proc),
	write(','),
	nl,
	tab(LH_tab),
	write_clause_term(B, LH_tab, Write_proc), !.
write_clause_term((A;B), LH_tab, Write_proc):- !,
	write('('),
	tab(1),
	New_tab is LH_tab + 2,
	write_clause_term(A, New_tab, Write_proc),
	nl,
	tab(New_tab),
	write(';'),
	nl,
	tab(New_tab),
	write_clause_term(B, New_tab, Write_proc),
	nl,
	tab(LH_tab), 
	write(')'), !.
write_clause_term(not__(Goals), LH_tab, Write_proc):-
	write('not__(('),
	New_tab is LH_tab + 4,
	write_clause_term(Goals, New_tab, Write_proc),
	write('))'), !.

/* experiment - goal is ground MMW */

write_clause_term(ground_not__(Goals), LH_tab, Write_proc):-
	write('ground_not__(('),
	New_tab is LH_tab + 4,
	write_clause_term(Goals, New_tab, Write_proc),
	write('))'), !.

write_clause_term(Atomic_wff, LH_tab, Write_proc):-
%	not__(member(Atomic_wff, [(_,_),(_;_),not__(_),not__((_,_)),not__((_;_))]))
	do_write(Atomic_wff, Write_proc), !.


/* ***********************************************************************
do_write(+Item, +Write_proc).

Write the Prolog term Item to the current output stream, using the system
output procedure Write_proc.
----------------------------------------------------------------------- */

do_write(Item, Write_proc):- 
	Write_goal =.. [Write_proc, Item],
	Write_goal, !.

/* Examples:
?- do_write('Segment', write).	% output is:	Segment
?- do_write('Segment', writeq).	% output is:	'Segment'
*/

/* ***********************************************************************

----------------------------------------------------------------------- */

change_numeral_prefixes_write(Item):-
	replace_numeral_prefixed_atoms_in(Item, Item1),
	write(Item1), !.


/* ***********************************************************************

Proc. for inserting new subgoals for evaluating functional terms.
----------------------------------------------------------------------- */

insert_new_subgoals_for([], Used_vars, Head_in, Head_in, 
			    Subgoals, Subgoals):- !.
insert_new_subgoals_for([Term|Terms], Used_vars, Head_in,
			    Head_out, Subgoals_in, Subgoals_out):-
	next_unused_var_for(Term, Used_vars, Var),
	create_subgoal(Term, Var, Subgoal),
	recursive_replace_in_exprs(Terms, Term, Var, New_terms),
	recursive_replace(Term, Var, Subgoals_in, Subgoals1), 
	recursive_replace(Term, Var, Head_in, Head),  
%	write(1),
%	trace,
%	ins(Subgoal, Var, Subgoals1, Subgoals2),  /* New proc. - buggy */
%	write(2),
%	notrace,
	insert_new_subgoal(Subgoal, Var, Subgoals1, Subgoals2), 
	insert_new_subgoals_for(New_terms, [Var|Used_vars], 
				    Head, Head_out,
				    Subgoals2, Subgoals_out), !.


/* ***********************************************************************
next_unused_var_for(+Term, +Used_vars, -Var).

----------------------------------------------------------------------- */

next_unused_var_for(Term, Used_vars, Var):-
	pos_integer(N),		% generate a positive integer N
	name(N, Numchars), 	% find chars. in numeral for N
	sort_of(Term, Sortname),
	name(Sortname, Sortchars), 
	append(Sortchars, Numchars, Varchars),
	name(Var,Varchars),
	not__(member(Var, Used_vars)), !.
	

/* ***********************************************************************
pos_integer(-N).

N is a positive integer.
----------------------------------------------------------------------- */

pos_integer(1).
pos_integer(N):-
	pos_integer(M),
	N is M + 1.


/* ***********************************************************************
sort_of(+Term, -Sort).

'Sort' is the sort of Term.
----------------------------------------------------------------------- */

sort_of(Term, Sort):-	% any sort other than 'Val'
	phrase(term(Sort, Term), _), !. % use grammar to find Sort
sort_of(Term, 'Val').


/* ***********************************************************************
create_subgoal(+Fn_term, +Var, -Subgoal). 

Subgoal is the appropriate subgoal for Fn_term and the TF_variable Var
which will be used to denote the function value of Fn_term.
----------------------------------------------------------------------- */

create_subgoal(Fn_term, Var, (Var is Fn_term)):- 
	functor(Fn_term, Op, 2),
	member(Op, [+,-,*,'/',mod,exp,min,max]), !. % exp, min, max Sicstus
create_subgoal(Fn_term, Var, (Var is Fn_term)):-    % Sicstus
	functor(Fn_term, Op, 1),
	member(Op, [abs,integer,round,sqrt,sin,cos,tan]), !.
% create_subgoal(-Fn_term, Var, (Var is -Fn_term)):- !. % Quintus only
create_subgoal(Fn_term, Var, Subgoal):-
%	any other evaluable function term
	create_expr_with_extra_arg(Fn_term, Var, Subgoal), !.

/* Examples:
?- create_subgoal((6 + 5), 'Val1', S).	% S = 'Val1' is 6 + 5
?- create_subgoal(the_Type_of('Aircraft1'), 'X3', S).
%  S = the_Type_of('Aircraft1', 'X3')
*/

/* ***********************************************************************


----------------------------------------------------------------------- */

recursive_replace_in_exprs([], _, _, []):- !.
recursive_replace_in_exprs([Expr|Exprs], Item, 
			   New_item, [New_expr|New_exprs]):-
	recursive_replace(Item, New_item, Expr, New_expr), !,
	recursive_replace_in_exprs(Exprs, Item, New_item, New_exprs), !.

/* Example:
?-recursive_replace(a,b, f(g(a),a,b(j(a))),X). % X = f(g(b),b,b(j(b)))
*/

/* ***********************************************************************
+,+,+,-

----------------------------------------------------------------------- */

recursive_replace(Item, New_item, Item, New_item):- !.
recursive_replace(Item, New_item, Expr, New_expr):-
%	not__(Expr_in = Item), 
	Expr =.. [Fname|Args],
	recursive_replace_in_exprs(Args, Item, New_item, New_args),
	New_expr =.. [Fname|New_args], !.


/* ***********************************************************************
+,+,+,-
----------------------------------------------------------------------- */

insert_new_subgoal(New_subgoal, Term, Subgoals, Subgoals1):-
	occurs_in(Subgoals, Term), !,
	insert_before_occs_of(Term, New_subgoal, Subgoals, Subgoals1), !.

insert_new_subgoal(New_subgoal, Term, Subgoals, Subgoals1):-			
%	not__(occurs_in(Subgoals, Term)),
	right_conjoin_new_subgoal(New_subgoal, Subgoals, Subgoals1), !.

		
/* ***********************************************************************
occurs_in(+Expr,+Sub_expr)

----------------------------------------------------------------------- */

occurs_in(Expr, Expr):- !.
occurs_in(Expr, Sub_expr):-
%	not__(Expr = Sub_expr),
	functor(Expr, _, Arity),
	occurs_in_an_arg_up_to_argno(Arity, Expr, Sub_expr), !.


/* ***********************************************************************
occurs_in_an_arg_up_to_argno(+N, +Expr,+Sub_expr)


----------------------------------------------------------------------- */

occurs_in_an_arg_up_to_argno(N, Expr, Sub_expr):-
	N > 0,
	arg(N, Expr, Nth_arg),
	(occurs_in(Nth_arg, Sub_expr), !
	 ;
	 M is N - 1, !,
	 occurs_in_an_arg_up_to_argno(M, Expr, Sub_expr)), !.


/* ***********************************************************************
+,+,+,-

----------------------------------------------------------------------- */

insert_before_occs_of(Term, New_subgoal, (Conj1,Conj2),
		      (New_Conj1,New_Conj2)):- !,
	insert_before_occs_of(Term, New_subgoal, Conj1, New_Conj1),
	insert_before_occs_of(Term, New_subgoal, Conj2, New_Conj2), !.

insert_before_occs_of(Term, New_subgoal, (Disj1;Disj2),
		      (New_Disj1;New_Disj2)):- !,
	insert_before_occs_of(Term, New_subgoal, Disj1, New_Disj1),
	insert_before_occs_of(Term, New_subgoal, Disj2, New_Disj2), !.

insert_before_occs_of(Term, New_subgoal, not__((Conj1,Conj2)),
		      not__((New_Conj1,New_Conj2))):- !,
	insert_before_occs_of(Term, New_subgoal, Conj1, New_Conj1),
	insert_before_occs_of(Term, New_subgoal, Conj2, New_Conj2), !.

insert_before_occs_of(Term, New_subgoal, not__((Disj1;Disj2)),
		      not__((New_Disj1;New_Disj2))):- !,
	insert_before_occs_of(Term, New_subgoal, Disj1, New_Disj1),
	insert_before_occs_of(Term, New_subgoal, Disj2, New_Disj2), !.

/* experiment - goal is ground MMW */

insert_before_occs_of(Term, New_subgoal, ground_not__((Conj1,Conj2)),
		      ground_not__((New_Conj1,New_Conj2))):- !,
	insert_before_occs_of(Term, New_subgoal, Conj1, New_Conj1),
	insert_before_occs_of(Term, New_subgoal, Conj2, New_Conj2), !.


insert_before_occs_of(Term, New_subgoal, ground_not__((Disj1;Disj2)),
		      ground_not__((New_Disj1;New_Disj2))):- !,
	insert_before_occs_of(Term, New_subgoal, Disj1, New_Disj1),
	insert_before_occs_of(Term, New_subgoal, Disj2, New_Disj2), !.

insert_before_occs_of(Term, New_subgoal, Literal, (New_subgoal,Literal)):-
	occurs_in(Literal, Term), !.

insert_before_occs_of(Term, New_subgoal, Literal, Literal).
%	not__(occurs_in(Literal, Term))		


/* ***********************************************************************
+,+,-

----------------------------------------------------------------------- */

right_conjoin_new_subgoal(New_subgoal, (Conj1,Conj2), (Conj1,New_Conj2)):- 
	!,
	right_conjoin_new_subgoal(New_subgoal, Conj2, New_Conj2), !.
right_conjoin_new_subgoal(New_subgoal, !, (New_subgoal,!)):- !.
right_conjoin_new_subgoal(New_subgoal, Subgoal, (Subgoal,New_subgoal)).
%	any other subgoal form


/* ***********************************************************************
+,-
----------------------------------------------------------------------- */

replace_numeral_prefixed_atoms_in(Expr, New_expr):-
	Expr =.. [Fname|Args],
	convert_if_numeral_prefixed_alphanum_atom(Fname, New_fname),
	replace_numeral_prefixed_atoms_in_expr_list(Args, New_args),
	New_expr =.. [New_fname|New_args], !.


/* ***********************************************************************
+,-
----------------------------------------------------------------------- */

replace_numeral_prefixed_atoms_in_expr_list([], []):- !.
replace_numeral_prefixed_atoms_in_expr_list([Expr|Exprs], 
					    [New_expr|New_exprs]):-
	replace_numeral_prefixed_atoms_in(Expr, New_expr), !,
	replace_numeral_prefixed_atoms_in_expr_list(Exprs, New_exprs), !.


/* ***********************************************************************
+,-
----------------------------------------------------------------------- */

convert_if_numeral_prefixed_alphanum_atom(Expr, New_expr):-
	atomic(Expr),		% system predicate 'atomic'
	not__(number(Expr)),	% system predicate 'number'
	name(Expr, [Num_char,Char|Chars]), 
	numeric_char(Num_char),
	alphabetic_char(Char),
	all_alphanumeric(Chars),
	alphabetic_chars_for_numeric_char(Num_char, Alphabetic_chars),
	append(Alphabetic_chars, [Char|Chars], New_chars),
	name(New_expr, New_chars), !.
convert_if_numeral_prefixed_alphanum_atom(Expr, Expr):-
%	any other atom
	atomic(Expr), !.


/* ***********************************************************************

----------------------------------------------------------------------- */

alphabetic_chars_for_numeric_char(48, "Zero_"):- !.
alphabetic_chars_for_numeric_char(49, "One_"):- !.
alphabetic_chars_for_numeric_char(50, "Two_"):- !.
alphabetic_chars_for_numeric_char(51, "Three_"):- !.
alphabetic_chars_for_numeric_char(52, "Four_"):- !.
alphabetic_chars_for_numeric_char(53, "Five_"):- !.
alphabetic_chars_for_numeric_char(54, "Six_"):- !.
alphabetic_chars_for_numeric_char(55, "Seven_"):- !.
alphabetic_chars_for_numeric_char(56, "Eight_"):- !.
alphabetic_chars_for_numeric_char(57, "Nine_"):- !.


/* ***********************************************************************

----------------------------------------------------------------------- */
	
all_alphanumeric([]):- !.
all_alphanumeric([Char|Chars]):-
	alphanumeric_char(Char), !,
	all_alphanumeric(Chars), !.



% delete 1st occurrence of X from a list 

delete_first(X, [], []):- !.
delete_first(X, [X|T], T):- !.
delete_first(X, [H|T], [H|T1]):-
%	not__(X = H),  
	delete_first(X, T, T1).




