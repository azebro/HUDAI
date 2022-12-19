/***************************************************************************/

/* FAROAS PROJECT                                                           */
/* Commercial in Confidence                                                 */
/*                                                                          */
/* PATT - MAIN PROGRAM                                                     */
/* 									    */
/* TLM update 11/96: example on l.31                                        */
/* TLM update 10/98: puniv at end of file                                   */
/****************************************************************************/


/* *************************************************************************
translate_to_vf(+TF_file,+Output_mode,-VF_output_chan, -N).

Reads TF_strings from TF_file and writes their translations in VF to
the terminal or to a file, according to the Output_mode ('user' or 
'file_out') specified. VF_output_chan becomes instantiated to the
name of the output channel, and N to the number of axioms.
------------------------------------------------------------------------- */	 

translate_to_vf(TF_file, Output_mode, VF_output_chan, N):-
	name(TF_file, Chars),
	vf_output_chan_name(Output_mode, Chars, VF_output_chan),
	see_seen_see(TF_file),
	tell_told_tell(VF_output_chan),	
	read_and_translate_axioms(0, N),
	seen,
	told. 

tf2vf(C,D) :- translate_to_vf('patt_in.msl', file_out, C, D). 
/* Examples:
?- translate_to_vf('spec', user, C, D).	% VF output goes to terminal
   C = user

% VF output goes to file 'spec.vf' C = spec.vf
*/

vf_output_chan_name(user, _, user):- !.
vf_output_chan_name(file_out, Chars, Output_file_name):-
	add_suffix(Chars, ".vf", Output_file_name), !.

/* TLM - Mod 7/97 to allow arbit. file name */
vf_output_chan_name(X,_,X) :- !.


/* *************************************************************************
read_and_translate_axioms.

Reads and translates TF_strings, one at a time. Translations are written 
to output file specified before entry to this predicate. 
------------------------------------------------------------------------- */

read_and_translate_axioms(N1, N3):-
	read(String),	/* read an ASCII string from TF-file */
	not__(String = end_of_file), !,
	N2 is N1 + 1,
	parse_and_translate(String), !, 
	read_and_translate_axioms(N2, N3).
read_and_translate_axioms(N, N).


/* *************************************************************************
parse_and_translate(+String).

------------------------------------------------------------------------- */

parse_and_translate(String):-	
	parse_wff(String, TF_tree_term),
	translate_tree(TF_tree_term). 

/*  clause to make procedure go on regardless */
parse_and_translate(_).


/* ************************************************************************
translate_tree(+TF_tree_term).

Side-effect: writes translation of TF_tree_term to output file.
------------------------------------------------------------------------- */

translate_tree(TF_tree_term):-
	tab(4),
	vf_write_if_ground(TF_tree_term, 4, 65), !, 
	nl, % 0 is starting indentation, 65 is right-hand margin position
	nl,
	nl.

translate_tree(TF_tree_term):- 
	nl,
	write(' Translation to VF failed for following parse tree:'),
	nl,
	write(TF_tree_term),
	nl,
	nl,
	fail. 


/* *************************************************************************
parse_wff(+String,-TF_tree_term).
------------------------------------------------------------------------- */

parse_wff(String, W):-
	atoms_of(String, Atom_list),	/* identify 'chunks' in String */
	phrase(wff(W), Atom_list), !.	/* 'phrase' is a system predicate */
parse_wff(String, _):-
	write('Parsing of the following atom list failed:'),
	atoms_of(String, Atom_list), 
	nl,
	writeq__(Atom_list), /* for testing */
	nl,
	nl,
	fail.


write_string([]):- !.
write_string([Char|Chars]):-
	put(Char), !,
	write_string(Chars).

	
/* ***************************************************************************
is_tf_variable(+Item).

Item is a TF_variable.
--------------------------------------------------------------------------- */

is_tf_variable(Item):-
	phrase(variable(_,_), [Item]).	% Uses TF-grammar to check 


/* **************************************************************************
atoms_of(+String, -Atoms).

Atoms is a list of Prolog atoms representing the significant 'chunks' found
in the input string String. String is a Prolog list of ASCII character values.
-------------------------------------------------------------------------- */

atoms_of(String, Atoms):-
	atoms_of(String, X, X, Atoms, Atoms), !.

atoms_of([], Cdp, Cv, Adp, Av):-
	(	var(Cdp), !,
		Av = [] 
		;
		Cv = [],
		name(A, Cdp),
		Av = [A]
	), !.

atoms_of([Ch|Chs], Cdp, Cv, Adp, Av):-
	alphanumeric_char(Ch), !,
	Cv = [Ch|Cv1],
	atoms_of(Chs, Cdp, Cv1, Adp, Av), !.

atoms_of([Ch|Chs], Cdp, Cv, Adp, Av):-
	punctuation_or_op_char(Ch), !,
	name(A, [Ch]),
	(	var(Cdp),
		Av = [A|Av1]
		;
		Cv = [],
		name(A0, Cdp),
		Av = [A0,A|Av1]
	),
	atoms_of(Chs, Cv1, Cv1, Adp, Av1), !.

atoms_of([Ch1|Chs], Cdp, Cv, Adp, Av):-
	white_space_char(Ch1), !,
	(	Chs = [Ch2|Chs1],
		not__(Ch2 = 95), 	% 95 is ASCII for underscore char. (_)
		alphanumeric_char(Ch2), !,
		(	var(Cdp), !,
			atoms_of([Ch2|Chs1], Cdp, Cv, Adp, Av)
			;
			Cv = [],
			name(A, Cdp),
			Av = [A|Av1],
			atoms_of([Ch2|Chs1], Cv1, Cv1, Adp, Av1)
		)
		;
		atoms_of(Chs, Cdp, Cv, Adp, Av)
	), !.

/* Example:
?- atoms_of("(Profile1 and Profile2 are_in_conflict)
	      <=>
	      E Segment1, Segment2 [ (Segment1 belongs_to Profile1)
				     &
				     (Segment2 belongs_to Profile2)
				    ]", Atoms).
Atoms = ['(','Profile1',and,'Profile2',are_in_conflict,')',<=>,'E',
'Segment1',',', 'Segment2','[','(','Segment1',belongs_to,'Profile1',')',
&,'(','Segment2',belongs_to,'Profile2',')']
*/
	
alphanumeric_char(Char):-
	numeric_char(Char).
alphanumeric_char(Char):-
	alphabetic_char(Char).

white_space_char(32).	/* ASCII for 'space' */
white_space_char(9).	/* 'tab' */
white_space_char(10).	/* newline */
white_space_char(13).	/* ???? */

numeric_char(Char):-
	Char >= 48,	/* 48 is ASCII value for '0'  */
	Char =< 57.	/* 57 is ASCII value for '9'  */
alphabetic_char(Char):-
	Char >= 97,	/* 97 is ASCII value for 'a'  */
	Char =< 122.	/* 122 is ASCII value for 'z' */
alphabetic_char(Char):-
	Char >= 65,	/* 65 is ASCII value for 'A' */
	Char =< 90.	/* 90 is ASCII value for 'Z' */
alphabetic_char(95).	/* 95 is ASCII value for '_' */
alphabetic_char(39).	/* 39 is ASCII value for ' (single quote) */
alphabetic_char(60).	/* 60 is ASCII value for '<' */
alphabetic_char(62). 	/* 62 is ASCII value for '>' */
alphabetic_char(61).	/* 61 is ASCII value for '=' */
alphabetic_char(92).	/* 92 is ASCII value for '\' */
alphabetic_char(46).	/* 46 is ASCII value for '.' */



punctuation_or_op_char(40).	/* 40 is ASCII value for '(' */
punctuation_or_op_char(41).	/* 41 is ASCII value for ')' */
punctuation_or_op_char(91).	/* 91 is ASCII value for '[' */
punctuation_or_op_char(93).	/* 93 is ASCII value for ']' */
punctuation_or_op_char(44).	/* 44 is ASCII value for ',' */
punctuation_or_op_char(59).	/* 59 is ASCII value for ';' */
punctuation_or_op_char(58).	/* 58 is ASCII value for ':' */
punctuation_or_op_char(47).	/* 47 is ASCII value for '/' */
punctuation_or_op_char(43).	/* 43 is ASCII value for '+' */
punctuation_or_op_char(45).	/* 45 is ASCII value for '-' */
punctuation_or_op_char(42).	/* 42 is ASCII value for '*' */
punctuation_or_op_char(38).	/* 38 is ASCII value for '&' */
punctuation_or_op_char(94).	/* 94 is ASCII value for '^' */
punctuation_or_op_char(35).    /* 35 is ASCII value for '#' */



%% This pred definition is missing from ppatt

/* **************************************************************************
insert_univ_quantifiers_for_free_tf_vars(+TF_vars, +TF_tree_term, -TF_tree_term1
).
 
Insert missing universally quantified TF_variables TF_vars into TF_tree_term
to produce TF_tree_term1. (N.B. `TF_vars' are actually Prolog atoms, such as
the atoms 'Aircraft1', 'Profile3', etc.)
-------------------------------------------------------------------------- */
 
insert_univ_quantifiers_for_free_tf_vars([], TF_tree_term, TF_tree_term):- !.
insert_univ_quantifiers_for_free_tf_vars([TF_var|TF_vars],
                                      TF_tree_term,
                                      all(TF_var, TF_tree_term1)):-
        insert_univ_quantifiers_for_free_tf_vars(TF_vars, TF_tree_term, 
		TF_tree_term1).
 
/* Example:
?- insert_univ_quantifiers_for_free_tf_vars(
        ['Segment1','Segment2'],
        temporally_overlap('Segment1','Segment2'),
        TF_tree_term1).
 
TF_tree_term1 = all('Segment1', all('Segment2',
                temporally_overlap('Segment1', 'Segment2')))
*/
 
 

