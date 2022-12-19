/* **************************************************************************
This file is 'tf2vf.pl'. It contains the code for translating from TF to VF.
-------------------------------------------------------------------------- */
/* Portability:
\+(, not( --> not__(	DONE
*/

/* ************************************************************************
write_atom_mod_margin(+Expr,
		      +Expr_length,
		      +Col_before_expr_plus_expr_length,
		      +LH_tab,
		      +RH_margin,
		      +Col_before_expr,
		      -Col_after_expr).

------------------------------------------------------------------------ */

/*		|
	   ******		
	  
	   ******	*/

write_atom_mod_margin(Expr,
		      Expr_length,
		      Col_before_expr_plus_expr_length,
		      LH_tab,
		      RH_margin,
		      Col_before_expr,
		      Col_after_expr):- 
	Col_before_expr < RH_margin,	
	Col_before_expr_plus_expr_length =< RH_margin, !,
	write(Expr), 
	tab(1),	
	Col_after_expr is Col_before_expr_plus_expr_length + 1, !.

/*		|
	     ******
      ******		*/

write_atom_mod_margin(Expr,
		      Expr_length,
		      Col_before_expr_plus_expr_length,
		      LH_tab,
		      RH_margin,
		      Col_before_expr,
		      Col_after_expr):- 
%	Col_before_expr < RH_margin,	
	Col_before_expr_plus_expr_length > RH_margin, 
	nl,
	tab(LH_tab),
	write(Expr), 
	tab(1),	
	Col_after_expr is LH_tab + Expr_length + 1, !.
	
/* ************************************************************************
write_atom_list_mod_margin(+Expr_list,
		      +LH_tab,
		      +RH_margin,
		      +Col_before_1st_expr,
		      -Col_after_last_expr).

------------------------------------------------------------------------ */

write_atom_list_mod_margin([], _, _, Col, Col):- !.
write_atom_list_mod_margin([Expr|Exprs],
		      LH_tab,
		      RH_margin,
		      Col_before_1st_expr,
		      Col_after_last_expr):- !,
	name(Expr, Charlist),
	length(Charlist, Expr_length),
	New_col is Col_before_1st_expr + Expr_length,
	write_atom_mod_margin(Expr, Expr_length, New_col,
			      LH_tab, RH_margin, 
			      Col_before_1st_expr,
			      Col_after_1st_expr), !,
	write_atom_list_mod_margin(Exprs, LH_tab, RH_margin,
				   Col_after_1st_expr,
				   Col_after_last_expr), !.


/* ***************************************************************************
vf_write_if_ground(+TF_tree_term, +LH_tab, +RH_margin).

Precheck TF_tree_term to see if it is ground (i.e. contains no uninstantiated
Prolog variables), then proceed with trying to write it if it is ground, or 
fail if it is non-ground. Without this precheck, vf_write may go into an 
infinite loop if it is given a non-ground term as input. Non-ground terms may 
occasionally result from parsing because of minor syntactic mistakes in lexical 
grammar rules added for new lexical items when the conflict prediction 
specification is being modified.
--------------------------------------------------------------------------- */

vf_write_if_ground(TF_tree_term, LH_tab, RH_margin):-
	ground(TF_tree_term),	% Quintus Prolog system predicate 'ground'
	vf_write(TF_tree_term, LH_tab, RH_margin), !.


/* ***************************************************************************
vf_write(+TF_tree_term, +LH_tab, +RH_margin).

Write (to current output file) VF translation of TF_tree_term, starting from 
a current indentation of LH_tab from the left, and using a right-hand margin
position of RH_margin to determine 'wrap-around' of long expressions onto
the next line.
--------------------------------------------------------------------------- */

vf_write((A & B), LH_tab, RH_margin) :- !,
	vf_write(A,  LH_tab, RH_margin), nl,
	tab(LH_tab),
	write_atom_list_mod_margin(['AND'], LH_tab, RH_margin, LH_tab, _),
	nl,
	tab(LH_tab), 
	vf_write(B, LH_tab, RH_margin), !.

vf_write((A => B), LH_tab, RH_margin):- !,
	write_atom_list_mod_margin(['IF'], LH_tab, RH_margin, LH_tab, _), nl,
	New_LH_tab is LH_tab+4,
	tab(New_LH_tab), vf_write(A, New_LH_tab, RH_margin), nl,
	tab(LH_tab), 
	write_atom_list_mod_margin(['THEN'], LH_tab, RH_margin, LH_tab, _), nl,
	tab(New_LH_tab), 
	vf_write(B, New_LH_tab, RH_margin), !.

vf_write((A or B), LH_tab, RH_margin):- !,
	write_atom_list_mod_margin(['EITHER'], LH_tab, RH_margin, LH_tab, 
		Col_after1), nl,	
	vf_disj_write((A or B), LH_tab, RH_margin), !.

vf_write((A <=> B), LH_tab, RH_margin):- !,
	vf_write(A, LH_tab, RH_margin), nl,
	tab(LH_tab), 
	write_atom_list_mod_margin(['IF','AND','ONLY','IF'], LH_tab, RH_margin, 
				   LH_tab, _), 
	nl,
	New_LH_tab is LH_tab + 4,
	tab(New_LH_tab), 
	vf_write(B, New_LH_tab, RH_margin), !.

vf_write(all(V, W), LH_tab, RH_margin):- !,
	write_atom_list_mod_margin(['FOR','ANY'], LH_tab, RH_margin, LH_tab, _),
	vf_univ_quan_write(all(V, W), LH_tab, RH_margin), !.


/* Seq. of two or more leading exist. quantifiers. */
vf_write(exists(V1, exists(V2, W)), LH_tab, RH_margin):- !,
	write_atom_list_mod_margin(['THERE','EXISTS'], LH_tab, RH_margin, 
				   LH_tab, _), 
	vf_ex_quan_write(exists(V1, exists(V2, W)), LH_tab, RH_margin), !.

vf_write(not__(exists(V1, exists(V2, W))), LH_tab, RH_margin):- !,
	write_atom_list_mod_margin(['THERE','DOES','NOT','EXIST'], LH_tab, 
				    RH_margin, LH_tab, _), 
	vf_ex_quan_write(exists(V1, exists(V2, W)), LH_tab, RH_margin), !.	

% Only one leading exist. quantifier. 
vf_write(exists(V1, W), LH_tab, RH_margin):- !,
%	not__(W = exists(_,_)),
	a_or_an(V1, A_or_an),	% checks if V1 starts with a vowel 
	write_atom_list_mod_margin(['THERE','EXISTS',A_or_an,V1,'SUCH','THAT'], 
				   LH_tab, RH_margin, LH_tab, _), 
	nl,
	New_LH_tab is LH_tab + 4,
	tab(New_LH_tab), 
	vf_write(W, New_LH_tab, RH_margin), !.

vf_write(not__(exists(V1, W)), LH_tab, RH_margin):- !,
%	not__(W = exists(_,_)),
	a_or_an(V1, A_or_an),	% checks if V1 starts with a vowel 
	write_atom_list_mod_margin(
		['THERE','DOES','NOT','EXIST',A_or_an,V1,'SUCH','THAT'], 
		LH_tab, RH_margin, LH_tab, _), 
	nl,
	New_LH_tab is LH_tab + 4,
	tab(New_LH_tab), 
	vf_write(W, New_LH_tab, RH_margin), !.


/* ***************************************************************************

--------------------------------------------------------------------------- */

length_of_exp(Val, Exp_length) :- 
	atomic(Val),
	name(Val, Charlist),
	length(Charlist,Exp_length).
length_of_exp(Val, Exp_length) :- 
	Val =.. [F,Val1,Val2],
	member(F, [+, -, *, /, mod]),
	length_of_exp(F, Exp_len),	
	length_of_exp(Val1, Exp_length1),
	length_of_exp(Val2, Exp_length2),
	Exp_length is Exp_len + Exp_length1 + Exp_length2 + 6.
length_of_exp(- Val, Exp_length) :- 
	length_of_exp(Val, Exp_length1),
	Exp_length is Exp_length1 + 2.
length_of_exp(Val, Exp_length) :- 
	Val =.. [F,Val1,Val2],
/*	member(F, [pow]), */
	power_functor_name__(F),
	length_of_exp(Val1, Exp_length1),
	length_of_exp(Val2, Exp_length2),
	Exp_length is Exp_length1 + Exp_length2 + 7.
length_of_exp(Val, Exp_length) :- 
	Val =.. [F,Val1],
	member(F, [abs, sin, cos, tan, sqrt, round]),
	length_of_exp(F, Exp_len),	
	length_of_exp(Val1, Exp_length1),
	Exp_length is Exp_len + Exp_length1 + 5.
length_of_exp(Val, Exp_length) :- 
	Val =.. [F,Val1,Val2],
	member(F, [max,min]),
	length_of_exp(F, Exp_len),
	length_of_exp(Val1, Exp_length1),
	length_of_exp(Val2, Exp_length2),
	Exp_length is Exp_len + Exp_length1 + Exp_length2 + 3.
length_of_exp(Val, Exp_length) :- 
	Val =.. [H|T],
	length_of_exp(H, L1),
	length_of_list(T, L2),
	Exp_length is L1 + L2 + 2.

length_of_list([],0):- !.
length_of_list([H|T], L) :- 
	length_of_exp(H, L1),
	length_of_list(T,L2),
	L is L1 + L2.


% General write routines for equalities and inequalities. 1st two
% clauses are for writing out equalities and inequalities in which
% the left-hand term is a constant or function term. 2nd two
% clauses apply to any other equalities or inequalities.

vf_write(=(Sort,Term1,Term2), LH_tab, RH_margin) :- 
	not__(is_tf_variable(Term1)), !,
	vf_write_term(Term1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is], LH_tab, RH_margin, 
				   Col_after1, Col_after2), 
	vf_write_term(Term2, LH_tab, RH_margin, Col_after2, _), !.

vf_write(not__(=(Sort,Term1,Term2)), LH_tab, RH_margin) :- 
	not__(is_tf_variable(Term1)), !,
	vf_write_term(Term1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,'NOT'], LH_tab, RH_margin, 
				   Col_after1, Col_after2), 
	vf_write_term(Term2, LH_tab, RH_margin, Col_after2, _), !.

vf_write(=(Sort,Term1,Term2), LH_tab, RH_margin) :- !,
	vf_write_term(Term1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,the,same,as], LH_tab, RH_margin, 
				   Col_after1, Col_after2), 
	vf_write_term(Term2, LH_tab, RH_margin, Col_after2, _), !.

vf_write(not__(=(Sort,Term1,Term2)), LH_tab, RH_margin) :- !,
	vf_write_term(Term1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,'NOT',the,same,as], LH_tab, RH_margin, 
				   Col_after1, Col_after2), 
	vf_write_term(Term2, LH_tab, RH_margin, Col_after2, _), !.


/* ************************************************************************
Write routines for each atomic wff and negated atomic wff.
------------------------------------------------------------------------ */

/* ************************************************************************
Type wffs.
------------------------------------------------------------------------ */

vf_write(is_a_jet_type(Type), LH_tab, RH_margin) :- !,
	vf_write_term(Type, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,a,jet,type], LH_tab, RH_margin, Col_after1, _),
	!.

vf_write(not__(is_a_jet_type(Type)), LH_tab, RH_margin) :- !,
	vf_write_term(Type, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,'NOT',a,jet,type], LH_tab, RH_margin, Col_after1, _),
	!.

vf_write(is_a_turbo_type(Type), LH_tab, RH_margin) :- !,
	vf_write_term(Type, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,a,turbo,type], LH_tab, RH_margin, Col_after1, _),
	!.

vf_write(is_a_piston_type(Type), LH_tab, RH_margin) :- !,
	vf_write_term(Type, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,a,piston,type], LH_tab, RH_margin, Col_after1, _),
	!.

/* ************************************************************************
Aircraft wffs.
------------------------------------------------------------------------ */

vf_write(meets_mnps(Aircraft), LH_tab, RH_margin) :- !,
	vf_write_term(Aircraft, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([meets,mnps], LH_tab, RH_margin, Col_after1, _),
	!.

vf_write(not__(meets_mnps(Aircraft)), LH_tab, RH_margin) :- !,
	vf_write_term(Aircraft, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin(['DOES','NOT',meet,mnps], LH_tab, RH_margin, Col_after1, _),
	!.

vf_write(are_jets(Aircraft1,Aircraft2), LH_tab, RH_margin) :- !,
	vf_write_term(Aircraft1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Aircraft2, LH_tab, RH_margin, 
		      Col_after2, Col_after3), 
	write_atom_list_mod_margin([are,jets], LH_tab, RH_margin, Col_after3, 
		_), !. 

vf_write(meet_mnps(Aircraft1,Aircraft2), LH_tab, RH_margin) :- !,
	vf_write_term(Aircraft1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Aircraft2, LH_tab, RH_margin, 
		      Col_after2, Col_after3), 
	write_atom_list_mod_margin([meet,mnps], LH_tab, RH_margin, Col_after3, 
		_), !. 

vf_write(one_or_both_do_not_meet_mnps(Aircraft1,Aircraft2), LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([one,or,both,of], LH_tab, RH_margin, LH_tab, 
		Col_after1), 
	vf_write_term(Aircraft1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Aircraft2, LH_tab, RH_margin, 
		      Col_after3, Col_after4), 
	write_atom_list_mod_margin([do,not,meet,mnps], LH_tab, RH_margin, Col_after4, 
		_), !. 

/* ************************************************************************
Vals wffs.
------------------------------------------------------------------------ */ 

vf_write((Val1 < Val2), LH_tab, RH_margin) :- !,
	vf_write_term(Val1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,less,than], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Val2, LH_tab, RH_margin, Col_after2, _), !. 

vf_write((Val1 > Val2), LH_tab, RH_margin) :- !,
	vf_write_term(Val1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,greater,than], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Val2, LH_tab, RH_margin, Col_after2, _), !.

vf_write((Val1 =< Val2), LH_tab, RH_margin) :- !,
	vf_write_term(Val1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,less,than,or,equal,to], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Val2, LH_tab, RH_margin, Col_after2, _), !.

vf_write((Val1 >= Val2), LH_tab, RH_margin) :- !,
	vf_write_term(Val1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,greater,than,or,equal,to], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Val2, LH_tab, RH_margin, Col_after2, _), !.

vf_write((val1_LTE_val2_LTE_val3(Val1,Val2,Val3)), LH_tab, RH_margin) :- !,
	vf_write_term(Val2, LH_tab, RH_margin,  LH_tab, Col_after1),
	write_atom_list_mod_margin([is,greater,than,or,equal,to], LH_tab, RH_margin, 
		Col_after1, Col_after2), 
	vf_write_term(Val1, LH_tab, RH_margin, Col_after2, Col_after3),
	write_atom_list_mod_margin([and,less,than,or,equal,to], LH_tab, RH_margin,
		Col_after3, Col_after4), 
	vf_write_term(Val3, LH_tab, RH_margin, Col_after4, _), !.

vf_write((val1_LTE_val2_LT_val3(Val1,Val2,Val3)), LH_tab, RH_margin) :- !,
	vf_write_term(Val2, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,greater,than,or,equal,to], LH_tab, RH_margin, 
		Col_after1, Col_after2), 
	vf_write_term(Val1, LH_tab, RH_margin, Col_after2, Col_after3),
	write_atom_list_mod_margin([and,less,than], LH_tab, RH_margin,
		Col_after3, Col_after4), 
	vf_write_term(Val3, LH_tab, RH_margin, Col_after4, _), !.

vf_write((val1_LT_val2_LT_val3(Val1,Val2,Val3)), LH_tab, RH_margin) :- !,
	vf_write_term(Val2, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,greater,than], LH_tab, RH_margin, 
		Col_after1, Col_after2), 
	vf_write_term(Val1, LH_tab, RH_margin, Col_after2, Col_after3),
	write_atom_list_mod_margin([and,less,than], LH_tab, RH_margin,
		Col_after3, Col_after4), 
	vf_write_term(Val3, LH_tab, RH_margin, Col_after4, _), !.

vf_write((val1_LT_val2_LTE_val3(Val1,Val2,Val3)), LH_tab, RH_margin) :- !,
	vf_write_term(Val2, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,greater,than], LH_tab, RH_margin, 
		Col_after1, Col_after2), 
	vf_write_term(Val1, LH_tab, RH_margin, Col_after2, Col_after3),
	write_atom_list_mod_margin([and,less,than,or,equal,to], LH_tab, RH_margin,
		Col_after3, Col_after4), 
	vf_write_term(Val3, LH_tab, RH_margin, Col_after4, _), !.

vf_write((integer(Val)), LH_tab, RH_margin) :- !,
	vf_write_term(Val, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,an,integer], LH_tab, RH_margin, 
		Col_after1, _),  !.

vf_write((non_negative_integer(Val)), LH_tab, RH_margin) :- !,
	vf_write_term(Val, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,a,non,integer], LH_tab, RH_margin, 
		Col_after1, _),  !.

/* ************************************************************************
Lats wffs.
------------------------------------------------------------------------ */

:- op(100, xfx, is_north_of).
vf_write((Lat1 is_north_of Lat2), LH_tab, RH_margin) :- !,
	vf_write_term(Lat1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,north,of], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Lat2, LH_tab, RH_margin, Col_after2, _), !.

:- op(100, xfx, is_at_or_north_of).
vf_write((Lat1 is_at_or_north_of Lat2), LH_tab, RH_margin) :- !,
	vf_write_term(Lat1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,at,or,north,of], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Lat2, LH_tab, RH_margin, Col_after2, _), !.

:- op(100, xfx, is_south_of).
vf_write((Lat1 is_south_of Lat2), LH_tab, RH_margin) :- !,
	vf_write_term(Lat1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,south,of], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Lat2, LH_tab, RH_margin, Col_after2, _), !.

:- op(100, xfx, is_at_or_south_of).
vf_write((Lat1 is_at_or_south_of Lat2), LH_tab, RH_margin) :- !,
	vf_write_term(Lat1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,at,or,south,of], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Lat2, LH_tab, RH_margin,  Col_after2, _), !.

vf_write(are_separated_by_at_least_one_degree(Lat1,Lat2), LH_tab, RH_margin) :- !,
	!,
	vf_write_term(Lat1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Lat2, LH_tab, RH_margin, Col_after2, Col_after3),
	write_atom_list_mod_margin([are,separated,by,at,least,one,degree],
		LH_tab, RH_margin, Col_after3, _),  !.

/* ************************************************************************
Longs wffs.
------------------------------------------------------------------------ */

:- op(100, xfx, is_east_of).
vf_write((Long1 is_east_of Long2), LH_tab, RH_margin) :- !,
	vf_write_term(Long1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,east,of], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Long2, LH_tab, RH_margin, Col_after2, _), !.

:- op(100, xfx, is_west_of).
vf_write((Long1 is_west_of Long2), LH_tab, RH_margin) :- !,
	vf_write_term(Long1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,west,of], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Long2, LH_tab, RH_margin, Col_after2, _), !.

:- op(100, xfx, is_at_or_west_of).
vf_write((Long1 is_at_or_west_of Long2), LH_tab, RH_margin) :- !,
	vf_write_term(Long1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,at,or,west,of], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Long2, LH_tab, RH_margin, Col_after2, _), !.

vf_write(are_on_the_eastern_boundary_of_the_Shanwick_OCA(Long1,Long2), LH_tab, RH_margin) :- !,
	vf_write_term(Long1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Long2, LH_tab, RH_margin, Col_after2, Col_after3),
	write_atom_list_mod_margin(
		[are,on,the,eastern,boundary,of,the,'Shanwick','OCA'],
		LH_tab, RH_margin, Col_after3, _), !.

vf_write(is_on_the_eastern_boundary_of_the_Shanwick_OCA(Long), LH_tab, RH_margin) :- !,
	vf_write_term(Long, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,on,the,eastern,boundary,of,the,'Shanwick','OCA'],
		LH_tab, RH_margin, Col_after1, _),  !.

vf_write(is_at_or_is_west_of_the_eastern_Shanwick_OCA_boundary(Long), LH_tab, RH_margin) :- !,
	vf_write_term(Long, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin(
		[is,at,or,is,west,of,the,eastern,'Shanwick','OCA',boundary], 
		LH_tab, RH_margin, Col_after1, _),  !.

vf_write(is_west_of_the_eastern_Shanwick_OCA_boundary(Long), LH_tab, RH_margin) :- !,
	vf_write_term(Long, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin(
		[is,west,of,the,eastern,'Shanwick','OCA',boundary], 
		LH_tab, RH_margin, Col_after1, _),  !.

vf_write(not__(is_west_of_the_eastern_Shanwick_OCA_boundary(Long)), LH_tab, RH_margin) :- !,
	vf_write_term(Long, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin(
		[is,'NOT',west,of,the,eastern,'Shanwick','OCA',boundary],
		LH_tab, RH_margin, Col_after1, _),  !.

vf_write(is_at_or_is_east_of_the_eastern_Shanwick_OCA_boundary(Long), LH_tab, RH_margin) :- !,
	vf_write_term(Long, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin(
		[is,at,or,is,east,of,the,eastern,'Shanwick','OCA',boundary], 
		LH_tab, RH_margin, Col_after1, _),  !.

vf_write(is_east_of_the_eastern_Shanwick_OCA_boundary(Long), LH_tab, RH_margin) :- !,
	vf_write_term(Long, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,east,of,the,eastern,
		'Shanwick','OCA',boundary], LH_tab, RH_margin, Col_after1, _),  !.

vf_write(not__(is_east_of_the_eastern_Shanwick_OCA_boundary(Long)), LH_tab, RH_margin) :- !,
	vf_write_term(Long, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,'NOT',east,of,the,eastern,
		'Shanwick','OCA',boundary], LH_tab, RH_margin, Col_after1, _),  !.

vf_write(is_at_the_last_recognised_pt_for_oceanic_cpr_of(Long,Profile), LH_tab, RH_margin) :- !,
	vf_write_term(Long, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,at,the,last,recognised,point,for,
		oceanic,conflict,prediction,and,resolution,of], LH_tab, RH_margin,
		Col_after1, Col_after2),
	vf_write_term(Profile, LH_tab, RH_margin, Col_after2, _),  !.

/* ************************************************************************
Flight_level wffs.
------------------------------------------------------------------------ */

:- op(100, xfx, is_at_or_above). 
vf_write((Flight_level1 is_at_or_above Flight_level2), LH_tab, RH_margin) :- !,
	vf_write_term(Flight_level1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,at,or,above], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Flight_level2, LH_tab, RH_margin, 
		      Col_after2, _), !.

:- op(100, xfx, is_at_or_below).
vf_write((Flight_level1 is_at_or_below Flight_level2), LH_tab, RH_margin) :- !,
	vf_write_term(Flight_level1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,at,or,below], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Flight_level2, LH_tab, RH_margin, 
		      Col_after2, _), !.

:- op(100, xfx, is_above).
vf_write((Flight_level1 is_above Flight_level2), LH_tab, RH_margin) :- !,
	vf_write_term(Flight_level1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,above], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Flight_level2, LH_tab, RH_margin, 
		      Col_after2, _), !.

:- op(100, xfx, is_below).
vf_write((Flight_level1 is_below Flight_level2), LH_tab, RH_margin) :- !,
	vf_write_term(Flight_level1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,below], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Flight_level2, LH_tab, RH_margin, 
		      Col_after2, _), !.

vf_write(both_are_at_or_below(Flight_level1,Flight_level2,Flight_level3), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([both], LH_tab, RH_margin, LH_tab, 
		Col_after1), 
	vf_write_term(Flight_level1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Flight_level2, LH_tab, RH_margin, 
		      Col_after3, Col_after4), 
	write_atom_list_mod_margin([are,at,or,below], LH_tab, RH_margin, Col_after4, 
		Col_after5),
	vf_write_term(Flight_level3, LH_tab, RH_margin, 
		      Col_after5, _), !. 

vf_write(both_are_above(Flight_level1,Flight_level2,Flight_level3), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([both], LH_tab, RH_margin, LH_tab, 
		Col_after1), 
	vf_write_term(Flight_level1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Flight_level2, LH_tab, RH_margin, 
		      Col_after3, Col_after4), 
	write_atom_list_mod_margin([are,above], LH_tab, RH_margin, Col_after4, 
		Col_after5),
	vf_write_term(Flight_level3, LH_tab, RH_margin, 
		      Col_after5, _), !. 

vf_write(one_or_both_are_at_or_below(Flight_level1,Flight_level2,Flight_level3),
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([one,or,both,of], LH_tab, RH_margin, LH_tab, 
		Col_after1), 
	vf_write_term(Flight_level1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Flight_level2, LH_tab, RH_margin, 
		      Col_after3, Col_after4), 
	write_atom_list_mod_margin([are,at,or,below], LH_tab, RH_margin, Col_after4, 
		Col_after5),
	vf_write_term(Flight_level3, LH_tab, RH_margin, 
		      Col_after5, _), !. 

vf_write(one_or_both_are_above(Flight_level1,Flight_level2,Flight_level3),
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([one,or,both,of], LH_tab, RH_margin, LH_tab, 
		Col_after1), 
	vf_write_term(Flight_level1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Flight_level2, LH_tab, RH_margin, 
		      Col_after3, Col_after4), 
	write_atom_list_mod_margin([are,above], LH_tab, RH_margin, Col_after4, 
		Col_after5),
	vf_write_term(Flight_level3, LH_tab, RH_margin, 
		      Col_after5, _), !. 

/* ************************************************************************
Time wffs.
------------------------------------------------------------------------ */

:- op(100, xfx, is_at_or_later_than).
vf_write((Time1 is_at_or_later_than Time2), LH_tab, RH_margin) :- !,
	vf_write_term(Time1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,at,or,later,than], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Time2, LH_tab, RH_margin, 
		      Col_after2, _), !.

:- op(100, xfx, is_at_or_earlier_than).
vf_write((Time1 is_at_or_earlier_than Time2), LH_tab, RH_margin) :- !,
	vf_write_term(Time1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,at,or,earlier,than], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Time2, LH_tab, RH_margin, 
		      Col_after2, _), !.

:- op(100, xfx, is_earlier_than).
vf_write((Time1 is_earlier_than Time2), LH_tab, RH_margin) :- !,
	vf_write_term(Time1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,earlier,than], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Time2, LH_tab, RH_margin, 
		      Col_after2, _), !.

:- op(100, xfx, is_later_than).
vf_write((Time1 is_later_than Time2), LH_tab, RH_margin) :- !,
	vf_write_term(Time1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,later,than], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Time2, LH_tab, RH_margin, 
		      Col_after2, _), !.

/* ************************************************************************
2D_pts wffs.
------------------------------------------------------------------------ */

vf_write(is_a_prox_airfield_pt(TwoD_pt), LH_tab, RH_margin) :- !,
	vf_write_term(TwoD_pt, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,a,proximate,airfield,point], LH_tab, RH_margin, Col_after1, 
		_), !.

vf_write(is_on_the_Shanwick_OCA_boundary(TwoD_pt), LH_tab, RH_margin) :- !,
	vf_write_term(TwoD_pt, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,on,the,'Shanwick','OCA',boundary], LH_tab, RH_margin, Col_after1, 
		_), !.

vf_write(is_on_the_eastern_boundary_of_the_Shanwick_OCA(TwoD_pt), LH_tab, RH_margin) :- !,
	vf_write_term(TwoD_pt, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,on,the,eastern,boundary,of,the,'Shanwick','OCA'],
	LH_tab, RH_margin, Col_after1, _), !.

vf_write(is_on_the_western_boundary_of_the_Shanwick_OCA(TwoD_pt), LH_tab, RH_margin) :- !,
	vf_write_term(TwoD_pt, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,on,the,western,boundary,of,the,'Shanwick','OCA'],
	LH_tab, RH_margin, Col_after1, _), !.

vf_write(is_on_the_northern_boundary_of_the_Shanwick_OCA(TwoD_pt), LH_tab, RH_margin) :- !,
	vf_write_term(TwoD_pt, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,on,the,northern,boundary,of,the,'Shanwick','OCA'],
	LH_tab, RH_margin, Col_after1, _), !.

vf_write(is_on_the_southern_boundary_of_the_Shanwick_OCA(TwoD_pt), LH_tab, RH_margin) :- !,
	vf_write_term(TwoD_pt, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,on,the,southern,boundary,of,the,'Shanwick','OCA'],
	LH_tab, RH_margin, Col_after1, _), !.

/* ************************************************************************
3D_pts wffs - none (apart from equalities and inequalities).
------------------------------------------------------------------------ */


/* ************************************************************************
4D_pts wffs - none (apart from equalities and inequalities).
------------------------------------------------------------------------ */


/* ************************************************************************
Profiles wffs.
------------------------------------------------------------------------ */

vf_write(is_a_min_long_sep_value_in_mins_entered_via_the_mst_command(Profile,Val),
	     LH_tab, RH_margin) :- !,
	vf_write_term(Val, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,a,minimum,longitudinal,separation,
		value,for], LH_tab, RH_margin, Col_after1, Col_after2), 
	vf_write_term(Profile, LH_tab, RH_margin, Col_after2, Col_after3),
	write_atom_list_mod_margin([entered,via,the,mst,command], LH_tab, RH_margin,
		 Col_after3, _), !.

vf_write(is_wholly_or_partly_in_the_mnps_airspace(Profile), LH_tab, RH_margin) :- !,
	vf_write_term(Profile, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,wholly,or,partly,in,the,mnps,airspace], LH_tab, RH_margin, Col_after1, 
		_), !.

vf_write(is_wholly_outside_the_mnps_airspace(Profile), LH_tab, RH_margin) :- !,
	vf_write_term(Profile, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,wholly,outside,the,mnps,airspace], LH_tab, RH_margin, Col_after1, 
		_), !.

vf_write(is_wholly_within_the_mnps_airspace(Profile), LH_tab, RH_margin) :- !,
	vf_write_term(Profile, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,wholly,within,the,mnps,airspace], LH_tab, RH_margin, Col_after1, 
		_), !.

vf_write(is_wholly_or_partly_in_oca(Profile), LH_tab, RH_margin) :- !,
	vf_write_term(Profile, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,wholly,or,partly,in,the,'OCA'], LH_tab, RH_margin, Col_after1, 
		_), !.

vf_write(profiles_are_in_oceanic_conflict(Segment1,Profile1,Segment2,Profile2), LH_tab, RH_margin) :- !,
	vf_write_term(Segment1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([of], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Profile1, LH_tab, RH_margin, Col_after2, Col_after3),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after3, Col_after4),
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after4, Col_after5),
	write_atom_list_mod_margin([of], LH_tab, RH_margin,
				    Col_after5, Col_after6),
	vf_write_term(Profile2, LH_tab, RH_margin, 
		      Col_after6, Col_after7),
	write_atom_list_mod_margin([are,in,oceanic,conflict], 
				    LH_tab, RH_margin, 
				    Col_after7, _), !.	

vf_write(both_aircraft_on_are_grounded_at_prox_airfields_at_time_of_current_conflict_probe(Profile1,Profile2),  LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([both,aircraft,on], LH_tab, RH_margin,
				    LH_tab, Col_after1),
	vf_write_term(Profile1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Profile2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([are,grounded,at,proximate,
		airfields,at,time,of,current,conflict,probe], LH_tab, RH_margin, 
		Col_after4, _), !.	

vf_write(only_one_of_the_aircraft_on_is_grounded_at_a_prox_airfield_at_time_of_current_conflict_probe(Profile1,Profile2), LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([only,one,of,the,aircraft,on], LH_tab, RH_margin,
				    LH_tab, Col_after1),
	vf_write_term(Profile1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Profile2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([is,grounded,at,a,proximate,
		airfield,at,time,of,current,conflict,probe], LH_tab, RH_margin, 
		Col_after4, _), !.

vf_write(neither_of_the_aircraft_on_is_grounded_at_prox_airfields_at_time_of_current_conflict_probe(Profile1,Profile2), LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([neither,of,the,aircraft,on], LH_tab, RH_margin,
				    LH_tab, Col_after1),
	vf_write_term(Profile1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Profile2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([is,grounded,at,a,proximate,
		airfield,at,time,of,current,conflict,probe], LH_tab, RH_margin, 
		Col_after4, _), !.

vf_write(aircraft_on_is_grounded_at_a_prox_airfield_at_time_of_current_conflict_probe(Profile), LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([the,aircraft,on], LH_tab, RH_margin,
				    LH_tab, Col_after1),
	vf_write_term(Profile, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([is,grounded,at,a,proximate,
		airfield,at,time,of,current,conflict,probe], LH_tab, RH_margin, 
		Col_after2, _), !.

vf_write(not__(aircraft_on_is_grounded_at_a_prox_airfield_at_time_of_current_conflict_probe(Profile)), LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([the,aircraft,on], LH_tab, RH_margin,
				    LH_tab, Col_after1),
	vf_write_term(Profile, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([is,'NOT',grounded,at,a,proximate,
		airfield,at,time,of,current,conflict,probe], LH_tab, RH_margin, 
		Col_after2, _), !.

vf_write(are_wholly_or_partly_in_the_mnps_airspace(Profile1,Profile2),
		LH_tab, RH_margin) :- !,
	vf_write_term(Profile1, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Profile2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,wholly,or,partly,in,the,mnps,airspace], 
				    LH_tab, RH_margin, 
				    Col_after3, _), !.	

vf_write(not__(is_wholly_or_partly_in_the_mnps_airspace(Profile)),
		LH_tab, RH_margin) :- !,
	vf_write_term(Profile, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([is,'NOT',wholly,or,partly,in,the,mnps,airspace], 
				    LH_tab, RH_margin, 
				    Col_after1, _), !.
	
vf_write(one_or_both_of_is_wholly_outside_the_mnps_airspace(Profile1,Profile2),
		LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([one,or,both,of], LH_tab, RH_margin,
				    LH_tab, Col_after1),
	vf_write_term(Profile1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Profile2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([is,wholly,outside,the,mnps,airspace], 
				    LH_tab, RH_margin, 
				    Col_after4, _), !.	

vf_write(are_wholly_within_the_mnps_airspace(Profile1,Profile2),
		LH_tab, RH_margin) :- !,
	vf_write_term(Profile1, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Profile2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,wholly,within,the,mnps,airspace], 
				    LH_tab, RH_margin, 
				    Col_after3, _), !.	

vf_write(the_linear_tracks_of_continuously_diverge_to_provide_at_least_120NM_separation_by_20_degrees_west(Profile1,Profile2), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([the,linear,tracks,of], LH_tab, RH_margin, LH_tab, 
		Col_after1), 
	vf_write_term(Profile1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Profile2, LH_tab, RH_margin, 
		Col_after3, Col_after4),
	write_atom_list_mod_margin([continuously,diverge,to,provide,at,least,120,'NM',
		separation,by,20,degrees,west], LH_tab, RH_margin, Col_after4, _), !.

vf_write(the_linear_tracks_of_are_separated_by_at_least_120NM_at_20_degrees_west(Profile1,Profile2), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([the,linear,tracks,of], LH_tab, RH_margin, LH_tab, 
		Col_after1), 
	vf_write_term(Profile1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Profile2, LH_tab, RH_margin, 
		Col_after3, Col_after4),
	write_atom_list_mod_margin([are,separated,by,at,least,120,'NM',at,20,degrees,west], LH_tab, RH_margin, Col_after4, _), !.

vf_write(are_laterally_separated_at_the_eastern_Shanwick_OCA_boundary(Profile1,Profile2), 
	     LH_tab, RH_margin) :- !,
	vf_write_term(Profile1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Profile2, LH_tab, RH_margin, 
		Col_after2, Col_after3),
	write_atom_list_mod_margin([are,laterally,separated,at,the,eastern,
		'Shanwick','OCA'], LH_tab, RH_margin, Col_after3, _), !.

vf_write(the_linear_tracks_of_from_the_eastern_Shanwick_OCA_boundary_do_not_cross_prior_to_their_respective_last_recognised_points(Profile1,Profile2),
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([the,linear,tracks,of], LH_tab, RH_margin, LH_tab, 
		Col_after1), 
	vf_write_term(Profile1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Profile2, LH_tab, RH_margin, 
		Col_after3, Col_after4),
	write_atom_list_mod_margin([from,the,eastern,'Shanwick','OCA',boundary,do,not,
		cross,prior,to,their,respective,last,recognised,points], 
		LH_tab, RH_margin, Col_after4, _), !.

vf_write(are_not_cleared_to_the_same_last_recognised_pt(Profile1,Profile2),
	     LH_tab, RH_margin) :- !,
	vf_write_term(Profile1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Profile2, LH_tab, RH_margin, 
		Col_after2, Col_after3),
	write_atom_list_mod_margin([are,not,cleared,to,the,same,last,recognised,
		point], LH_tab, RH_margin, Col_after3, _), !.

vf_write(the_linear_tracks_of_diverge_continuously(Profile1,Profile2),
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([the,linear,tracks,of], LH_tab, RH_margin, LH_tab, 
		Col_after1), 
	vf_write_term(Profile1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Profile2, LH_tab, RH_margin, 
		Col_after3, Col_after4),
	write_atom_list_mod_margin([diverge,continuously], LH_tab, RH_margin, 
		Col_after4, _), !.

/* ************************************************************************
Segments wffs.
------------------------------------------------------------------------ */

vf_write(time_periods_overlap(Segment1,Segment2), LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([time,periods,of], LH_tab, RH_margin, 
		LH_tab, Col_after1), 
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after4),
	write_atom_list_mod_margin([overlap], LH_tab, RH_margin,
		 Col_after4, _), !.

vf_write(not__(time_periods_overlap(Segment1,Segment2)), LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([time,periods,of], LH_tab, RH_margin, 
		LH_tab, Col_after1), 
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after4),
	write_atom_list_mod_margin(['DO','NOT',overlap], LH_tab, RH_margin,
		 Col_after4, _), !.

vf_write(flight_level_ranges_overlap(Segment1,Segment2), LH_tab, RH_margin) :- !, 
	!,
	write_atom_list_mod_margin([flight,level,ranges,of], LH_tab, RH_margin, 
		LH_tab, Col_after1), 
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after4),
	write_atom_list_mod_margin([overlap], LH_tab, RH_margin,
		 Col_after4, _), !.

vf_write(not__(flight_level_ranges_overlap(Segment1,Segment2)), LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([flight,level,ranges,of], LH_tab, RH_margin, 
		LH_tab, Col_after1), 
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after4),
	write_atom_list_mod_margin(['DO','NOT',overlap], LH_tab, RH_margin,
		 Col_after4, _), !.

:- op(100, xfx, lies_in_flight_level_range_of).
vf_write((Flight_level lies_in_flight_level_range_of Segment), LH_tab, RH_margin) :- !,
	vf_write_term(Flight_level, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([lies,in,flight,level,range,of], LH_tab,
		RH_margin, Col_after1, Col_after2), 
	vf_write_term(Segment, LH_tab, RH_margin, Col_after2, _), !.

vf_write(belong_to_profiles_for_different_aircraft(Segment1,Segment2), 
	     LH_tab, RH_margin) :- !,
	vf_write_term(Segment1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab,
		RH_margin, Col_after1, Col_after2), 
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after2, Col_after3), 
	write_atom_list_mod_margin([belong,to,profiles,for,different,aircraft], LH_tab,
		RH_margin, Col_after3, _), !.

vf_write(one_or_both_start_later_than(Segment1,Segment2,Time), LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([one,or,both,of], LH_tab, RH_margin,
				    LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([start,later,than], LH_tab, RH_margin, 
				    Col_after4, Col_after5),
	vf_write_term(Time, LH_tab, RH_margin, 
		      Col_after5, _), !.	

vf_write(is_westerly(Segment), LH_tab, RH_margin) :- !,
	vf_write_term(Segment, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,westerly], LH_tab,
		RH_margin, Col_after1, _), !.

vf_write(is_easterly(Segment), LH_tab, RH_margin) :- !,
	vf_write_term(Segment, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,easterly], LH_tab,
		RH_margin, Col_after1, _), !.

vf_write(finishes_at_or_earlier_than_starts(Segment1,Segment2), LH_tab, RH_margin) :- !,
	vf_write_term(Segment1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([finishes,at,or,earlier,than], LH_tab,
		RH_margin, Col_after1, Col_after2),
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after2, Col_after3),
	write_atom_list_mod_margin([starts], LH_tab,
		RH_margin, Col_after3, _), !.

vf_write(regular(Segment), LH_tab, RH_margin) :- !,
	vf_write_term(Segment, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,regular], LH_tab,
		RH_margin, Col_after1, _), !.

vf_write(not__(regular(Segment)), LH_tab, RH_margin) :- !,
	vf_write_term(Segment, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,'NOT',regular], LH_tab,
		RH_margin, Col_after1, _), !.

vf_write(irregular(Segment), LH_tab, RH_margin) :- !,
	vf_write_term(Segment, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,irregular], LH_tab,
		RH_margin, Col_after1, _), !.

vf_write(is_cruise_climbed(Segment), LH_tab, RH_margin) :- !,
	vf_write_term(Segment, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,cruise,climbed], LH_tab,
		RH_margin, Col_after1, _), !.

vf_write(not__(is_cruise_climbed(Segment)), LH_tab, RH_margin) :- !,
	vf_write_term(Segment, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,'NOT',cruise,climbed], LH_tab,
		RH_margin, Col_after1, _), !.

:- op(100, xfx, is_during_time_period_of).
vf_write((Time is_during_time_period_of Segment), LH_tab, RH_margin) :- !,
	vf_write_term(Time, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,during,time,period,of], LH_tab,
		RH_margin, Col_after1, Col_after2),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after2, _), !.

:- op(100, xfx, belongs_to).
vf_write((Segment belongs_to Profile), LH_tab, RH_margin):- !,
	vf_write_term(Segment, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([belongs,to], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Profile, LH_tab, RH_margin, 
		      Col_after2, _), !.	


vf_write(segments_are_in_oceanic_conflict(Segment1,Segment2), LH_tab, RH_margin):- !,
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,in,oceanic,conflict], 
				    LH_tab, RH_margin, 
				    Col_after3, _), !.	

vf_write(are_in_vertical_oceanic_conflict(Segment1,Segment2), LH_tab, RH_margin):- !,
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,in,vertical,oceanic,conflict], 
				    LH_tab, RH_margin, 
				    Col_after3, _), !.	

vf_write(are_in_lateral_and_longitudinal_oceanic_conflict(Segment1,Segment2), 
		LH_tab, RH_margin):- !,
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,in,lateral,and,longitudinal,oceanic,conflict], 
				    LH_tab, RH_margin, 
				    Col_after3, _), !.

vf_write(are_subject_to_oceanic_cpr(Segment1,Segment2), LH_tab, RH_margin):- !,
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,subject,to,oceanic,conflict,prediction,and
				,resolution], LH_tab, RH_margin, Col_after3, _), !.

vf_write(oceanic_separation_rules_are_applicable_to(Segment), 
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([oceanic,separation,rules,are,applicable,to],
		LH_tab, RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, 
		      Col_after1, _), !.

vf_write(starts_at_or_after_first_recognised_pt_for_oceanic_cpr(Segment), 
	     LH_tab, RH_margin):- !,
	vf_write_term(Segment, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([starts,at,or,after,first,recognised,point,for,
		oceanic,conflict,prediction,and,resolution], LH_tab, RH_margin, Col_after1, _), !.

vf_write(ends_at_or_before_last_recognised_pt_for_oceanic_cpr(Segment), 
	     LH_tab, RH_margin):- !,
	vf_write_term(Segment, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([ends,at,or,before,last,recognised,point,for,
		oceanic,conflict,prediction,and,resolution], LH_tab, RH_margin, Col_after1, _), !.

vf_write(box_conflict_exists_between_linear_tracks_of_at_some_time_at_or_between(Segment1,Segment2,Time1,Time2), 
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([box,conflict,exists,between,linear,tracks,of], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([at,some,time,at,or,between], 
				    LH_tab, RH_margin, 
				    Col_after4, Col_after5),
	vf_write_term(Time1, LH_tab, RH_margin, 
		      Col_after5, Col_after6),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after6, Col_after7),
	vf_write_term(Time2, LH_tab, RH_margin, 
		      Col_after7, _), !.	

vf_write(box_conflict_exists_between_linear_tracks_of_at(Segment1,Segment2,Time), 
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([box,conflict,exists,between,linear,tracks,of], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([at], 
				    LH_tab, RH_margin, 
				    Col_after4, Col_after5),
	vf_write_term(Time, LH_tab, RH_margin, 
		      Col_after5, _), !.
	
vf_write(steep(Segment), LH_tab, RH_margin):- !,
	vf_write_term(Segment, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([is,steep], LH_tab, RH_margin, Col_after1, _), !.

vf_write(not__(steep(Segment)), LH_tab, RH_margin):- !,
	vf_write_term(Segment, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([is,'NOT',steep], LH_tab, RH_margin, Col_after1, _), !.

vf_write(are_deemed_to_be_laterally_separated(Segment1,Segment2), 
	     LH_tab, RH_margin):- !,
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,deemed,to,be,laterally,separated], LH_tab,
			 RH_margin, Col_after3, _), !.

vf_write(not__(are_deemed_to_be_laterally_separated(Segment1,Segment2)), 
	     LH_tab, RH_margin):- !,
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,'NOT',deemed,to,be,laterally,separated], LH_tab,
			 RH_margin, Col_after3, _), !.

vf_write(are_westerly_and_deemed_to_be_laterally_separated(Segment1,Segment2),
	     LH_tab, RH_margin):- !,
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,westerly,and,deemed,to,be,laterally,separated], LH_tab,
			 RH_margin, Col_after3, _), !.

vf_write(are_easterly_and_deemed_to_be_laterally_separated(Segment1,Segment2), 
	     LH_tab, RH_margin):- !,
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,easterly,and,deemed,to,be,laterally,separated], LH_tab,
			 RH_margin, Col_after3, _), !.

vf_write(both_are_flown_in_level_flight(Segment1,Segment2),
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([both], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([are,flown,in,level,flight], 
				    LH_tab, RH_margin, 
				    Col_after4, _), !.

vf_write(is_flown_in_level_flight(Segment),
	     LH_tab, RH_margin):- !,
	vf_write_term(Segment, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([is,flown,in,level,flight], 
				    LH_tab, RH_margin, 
				    Col_after1, _), !.

vf_write(not__(is_flown_in_level_flight(Segment)),
	     LH_tab, RH_margin):- !,
	vf_write_term(Segment, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([is,'NOT',flown,in,level,flight], 
				    LH_tab, RH_margin, 
				    Col_after1, _), !.

vf_write(one_or_both_of_is_not_flown_in_level_flight(Segment1,Segment2), 
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([one,or,both,of], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([is,not,flown,in,level,flight], 
				    LH_tab, RH_margin, 
				    Col_after4, _), !.

vf_write(are_cruise_climbed(Segment1,Segment2), LH_tab, RH_margin):- !,
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,cruise,climbed], 
				    LH_tab, RH_margin, 
				    Col_after3, _), !.

vf_write(are_not_cruise_climbed(Segment1,Segment2), LH_tab, RH_margin):- !,
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,not,cruise,climbed], 
				    LH_tab, RH_margin, 
				    Col_after3, _), !.

vf_write(or_cruise_climbed(Segment1,Segment2), LH_tab, RH_margin):- !,
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([or], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([is,cruise,climbed], 
				    LH_tab, RH_margin, 
				    Col_after3, _), !.

vf_write(both_are_flown_at_supersonic_speed(Segment1,Segment2), LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([both], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([are,flown,at,supersonic,speed], 
				    LH_tab, RH_margin, 
				    Col_after4, _), !.

vf_write(one_or_both_of_are_flown_at_subsonic_speed(Segment1,Segment2), 
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([one,or,both,of], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([are,flown,at,subsonic,speed], 
				    LH_tab, RH_margin, 
				    Col_after4, _), !.

vf_write(both_are_flown_at_subsonic_speed(Segment1,Segment2), LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([both], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([are,flown,at,supersonic,speed], 
				    LH_tab, RH_margin, 
				    Col_after4, _), !.

vf_write(one_or_both_of_are_flown_at_supersonic_speed(Segment1,Segment2), 
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([one,or,both,of], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([are,flown,at,supersonic,speed], 
				    LH_tab, RH_margin, 
				    Col_after4, _), !.

vf_write(both_are_flown_at_the_same_mach_number_in_level_flight(Segment1,Segment2),  
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([both], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([are,flown,at,the,same,mach,number,in,level,flight], 
				    LH_tab, RH_margin, 
				    Col_after4, _), !.

vf_write(both_are_flown_at_the_same_mach_number(Segment1,Segment2),
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([both], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([are,flown,at,the,same,mach,number], 
				    LH_tab, RH_margin, 
				    Col_after4, _), !.

vf_write(one_or_both_of_finish_at_or_after(Segment1,Segment2,Time), 
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([one,or,both,of], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([finish,at,or,after], 
				    LH_tab, RH_margin, 
				    Col_after4, Col_after5),
	vf_write_term(Time, LH_tab, RH_margin, 
		      Col_after4, _), !.

vf_write(both_finish_before(Segment1,Segment2,Time), 
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([both], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([finish,before], 
				    LH_tab, RH_margin, 
				    Col_after4, Col_after5),
	vf_write_term(Time, LH_tab, RH_margin, 
		      Col_after4, _), !.

vf_write(is_in_overlap_time_window_for(Time,Segment1,Segment2),
	     LH_tab, RH_margin):- !,
	vf_write_term(Time, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([is,in,overlap,time,window,for], LH_tab,
				   RH_margin, Col_after1, Col_after2),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after3, Col_after4),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, _), !.

vf_write(min_flight_level_of_upper_segment_of_is_above_max_flight_level_of_lower_segment_by_less_than_required_min_vert_sep(Segment1,Segment2),
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([minimum,flight,level,of,upper,segment,of], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([is,above,maximum,flight,level,of,
	lower,segment,by,less,than,required,minimum,vertical,separation],
	LH_tab, RH_margin, Col_after4, _), !.

vf_write(exit_flight_level_of_does_not_have_required_vert_sep_wrt(Segment1,Segment2), 
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([exit,flight,level,of], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([does,not,have,required,vertical,separation,
	with,respect,to], LH_tab, RH_margin, Col_after2, Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, _),!.

vf_write(no_segment_after_which_has_been_exited_by_has_a_flight_level_with_at_least_required_min_vert_sep_wrt(Segment1,Time,Segment2), 
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([no,segment,after], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([which,has,been,exited,by],
	LH_tab, RH_margin, Col_after2, Col_after3), 
	vf_write_term(Time, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([has,a,flight,level,with,at,least,required,minimum,
     		vertical,separation,with,respect,to],
	LH_tab, RH_margin, Col_after4, Col_after5), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after5, _),!.

vf_write(entry_flight_level_of_has_required_vert_sep_wrt(Segment1,Segment2), 
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([entry,flight,level,of], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([does,has,required,vertical,separation,
		with,respect,to], LH_tab, RH_margin, Col_after2, Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, _),!.

vf_write(exit_flight_level_of_has_required_vert_sep_wrt(Segment1,Segment2), 
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([exit,flight,level,of], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([does,has,required,vertical,separation,
	with,respect,to],
	LH_tab, RH_margin, Col_after2, Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after3, _),!.

vf_write(abs_magnitude_of_lat_over_long_gradient_of_exceeds(Segment,Val), 
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([the,absolute,magnitude,of,the,latitude,over,
		longitude,gradient,of], LH_tab, RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([exceeds], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Val, LH_tab, RH_margin, Col_after3, _),!.

vf_write(position_on_linear_track_of_at_is(Segment,Time,Linear_track_pt), 
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([the,position,on,the,linear,track,of], 
	LH_tab, RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, 
		      Col_after1, Col_after2),
	write_atom_list_mod_margin([at], LH_tab, RH_margin, Col_after2, Col_after3), 
	vf_write_term(Time, LH_tab, RH_margin, 
		      Col_after3, Col_after4),
	write_atom_list_mod_margin([is], LH_tab, RH_margin, Col_after4, Col_after5), 
	vf_write_term(Linear_track_pt, LH_tab, RH_margin, 
		      Col_after5, _),!.

vf_write(is_on_linear_track_or_extended_linear_track_of_at_the_intersection_with_longitude_coord(Linear_track_pt,Segment,Val), 
	     LH_tab, RH_margin) :- !,
	vf_write_term(Linear_track_pt, 
	LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,on,linear,track,or,extended,
		linear,track,of], LH_tab, RH_margin, Col_after1, Col_after2), 
	vf_write_term(Segment, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([at,
        the,intersection,with,longitude,coordinate], LH_tab, RH_margin, Col_after3,
		Col_after4), 
	vf_write_term(Val, LH_tab, RH_margin, 
		      Col_after4, _), !.

vf_write(is_on_linear_track_or_extended_linear_track_of_at_the_intersection_with_latitude_coord(Linear_track_pt,Segment,Val), 
	     LH_tab, RH_margin) :- !,
	vf_write_term(Linear_track_pt, 
	LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,on,linear,track,or,extended,
		linear,track,of], LH_tab, RH_margin, Col_after1, Col_after2), 
	vf_write_term(Segment, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([at,
        the,intersection,with,latitude,coordinate], LH_tab, RH_margin, Col_after3,
		Col_after4), 
	vf_write_term(Val, LH_tab, RH_margin, 
		      Col_after4, _), !.

vf_write(starts_at_or_crosses_the_eastern_Shanwick_OCA_boundary(Segment), LH_tab, RH_margin):- !,
	vf_write_term(Segment, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([starts,at,or,crosses,the,eastern,'Shanwick','OCA',boundary], LH_tab, RH_margin,
				    Col_after1, _), !.

vf_write(are_laterally_separated(Segment1,Segment2), LH_tab, RH_margin):- !,
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after1, Col_after2),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,laterally,separated], LH_tab, RH_margin, 
			Col_after3, _), !.

vf_write(the_linear_tracks_of_cross(Segment1,Segment2),
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([the,linear,tracks,of], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      	Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      	Col_after3, Col_after4),
	write_atom_list_mod_margin([cross], LH_tab, RH_margin, 
			Col_after4, _), !.

vf_write(is_wholly_outside_oca(Segment), LH_tab, RH_margin):- !,
	vf_write_term(Segment, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([is,wholly,outside,'OCA'], LH_tab, RH_margin,
				    Col_after1, _), !.

vf_write(not__(is_wholly_outside_oca(Segment)), LH_tab, RH_margin):- !,
	vf_write_term(Segment, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([is,'NOT',wholly,outside,'OCA'], LH_tab, RH_margin,
				    Col_after1, _), !.

vf_write(reduced_separation_conditions_apply_to(Segment1,Segment2), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([reduced,separation,conditions,apply,to], LH_tab,
		 RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after3, _), !.

vf_write(not__(reduced_separation_conditions_apply_to(Segment1,Segment2)), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([reduced,separation,conditions,'DO','NOT',apply,to],
		 LH_tab, RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after3, _), !.

vf_write(the_linear_tracks_of_diverge(Segment1,Segment2), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([the,linear,tracks,of], LH_tab,
		 RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after3, Col_after4),
	write_atom_list_mod_margin([diverge], LH_tab, RH_margin, Col_after4, 
		_),  !.

vf_write(not__(the_linear_tracks_of_diverge(Segment1,Segment2)), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([the,linear,tracks,of], LH_tab,
		 RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after3, Col_after4),
	write_atom_list_mod_margin(['DO','NOT',diverge], LH_tab, RH_margin, Col_after4, 
		_),  !.

vf_write(the_linear_tracks_of_do_not_cross(Segment1,Segment2), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([the,linear,tracks,of], LH_tab,
		 RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after3, Col_after4),
	write_atom_list_mod_margin([do,not,cross], LH_tab, RH_margin, Col_after4, 
		_),  !.

vf_write(is_on_the_linear_track_of(TwoD_pt,Segment), 
	     LH_tab, RH_margin) :- !,
	vf_write_term(TwoD_pt, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,on,the,linear,track,of], LH_tab,
		 RH_margin, Col_after1, Col_after2),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after2, _), !.

vf_write(are_after_a_common_pt_from_which_profile_tracks_are_same_or_diverging_thereafter_and_at_which_both_aircraft_have_already_reported_by(Segment1,Segment2,Time), 
	     LH_tab, RH_margin) :- !,
	vf_write_term(Segment1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after2, Col_after3),
	write_atom_list_mod_margin([are,after,a,common,point,from,which,profile,
	tracks,are,same,or,diverging,thereafter,and,at,which,both,aircraft,have,
	already,reported,by], LH_tab, RH_margin, Col_after3, Col_after4),
	vf_write_term(Time, LH_tab, RH_margin, 
		Col_after4, _), !.

vf_write(are_after_a_common_pt_from_which_profile_tracks_are_same_thereafter(Segment1,Segment2), 
	     LH_tab, RH_margin) :- !,
	vf_write_term(Segment1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after2, Col_after3),
	write_atom_list_mod_margin([are,after,a,common,point,from,which,profile,
	tracks,are,same,thereafter], LH_tab, RH_margin, Col_after3, _), !.

vf_write(are_after_a_common_pt_from_which_profile_tracks_are_diverging_thereafter(Segment1,Segment2), 
	     LH_tab, RH_margin) :- !,
	vf_write_term(Segment1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after2, Col_after3),
	write_atom_list_mod_margin([are,after,a,common,point,from,which,profile,
	tracks,are,diverging,thereafter], LH_tab, RH_margin, Col_after3, _), !.

vf_write(the_preceding_aircraft_on_or_on_is_not_faster_by_or_more(Segment1,Segment2,Val), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([the,preceding,aircraft,on], LH_tab,
		 RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([or,on], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after3, Col_after4),
	write_atom_list_mod_margin([is,not,faster,by], LH_tab, RH_margin,
		Col_after4, Col_after5), 
	vf_write_term(Val, LH_tab, RH_margin, 
		Col_after5, Col_after6), 
	write_atom_list_mod_margin([mach,or,more], LH_tab, RH_margin,
		Col_after6, _), !.

vf_write(the_preceding_aircraft_on_or_on_is_faster_by(Segment1,Segment2,Val), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([the,preceding,aircraft,on], LH_tab,
		 RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([or,on], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after3, Col_after4),
	write_atom_list_mod_margin([is,faster,by], LH_tab, RH_margin,
		Col_after4, Col_after5), 
	vf_write_term(Val, LH_tab, RH_margin, Col_after5, Col_after6), 
	write_atom_list_mod_margin([mach], LH_tab, RH_margin,
		Col_after6, _), !.

vf_write(the_preceding_aircraft_on_or_on_is_faster_by_at_least(Segment1,Segment2,Val), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([the,preceding,aircraft,on], LH_tab,
		 RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([or,on], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after3, Col_after4),
	write_atom_list_mod_margin([is,faster,by,at,least], LH_tab, RH_margin,
		Col_after4, Col_after5), 
	vf_write_term(Val, LH_tab, RH_margin, Col_after5, Col_after6), 
	write_atom_list_mod_margin([mach], LH_tab, RH_margin,
		Col_after6, _), !.

vf_write(the_preceding_aircraft_on_or_on_is_faster_by_at_least_mach_but_not_more_than(Segment1,Segment2,Val1,Val2), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([the,preceding,aircraft,on], LH_tab,
		 RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([or,on], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after3, Col_after4),
	write_atom_list_mod_margin([is,faster,by,at,least], LH_tab, RH_margin,
		Col_after4, Col_after5), 
	vf_write_term(Val1, LH_tab, RH_margin, Col_after5, Col_after6), 
	write_atom_list_mod_margin([mach,but,not,more,than], LH_tab, RH_margin,
		Col_after6, Col_after7), 
	vf_write_term(Val2, LH_tab, RH_margin, Col_after7, Col_after8), 
	write_atom_list_mod_margin([mach], LH_tab, RH_margin,
		Col_after8, _), !.

vf_write(the_aircraft_on_segment1_precedes_the_aircraft_on_segment2(Segment1,Segment2), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([the,aircraft,on], LH_tab,
		 RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([precedes,the,aircraft,on], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after3, _), !.

vf_write(the_linear_tracks_of_are_the_same(Segment1,Segment2),
	     LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([the,linear,tracks,of], LH_tab,
				   RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, 
		      	Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin,
				    Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, 
		      	Col_after3, Col_after4),
	write_atom_list_mod_margin([are,the,same], LH_tab, RH_margin, 
			Col_after4, _), !.

vf_write(are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_same_or_diverging_thereafter(Segment1,Segment2), 
	     LH_tab, RH_margin) :- !,
	vf_write_term(Segment1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after2, Col_after3),
	write_atom_list_mod_margin([are,after,a,common,point,on,the,'Shanwick',boundary,
	from,which,profile,tracks,are,same,or,diverging,thereafter], LH_tab, RH_margin,
	Col_after3, _), !.

vf_write(are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_same_thereafter(Segment1,Segment2), 
	     LH_tab, RH_margin) :- !,
	vf_write_term(Segment1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after2, Col_after3),
	write_atom_list_mod_margin([are,after,a,common,point,on,the,'Shanwick',boundary,
	from,which,profile,tracks,are,same,thereafter], LH_tab, RH_margin,
	Col_after3, _), !.

vf_write(are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_diverging_thereafter(Segment1,Segment2), 
	     LH_tab, RH_margin) :- !,
	vf_write_term(Segment1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after2, Col_after3),
	write_atom_list_mod_margin([are,after,a,common,point,on,the,'Shanwick',boundary,
	from,which,profile,tracks,are,diverging,thereafter], LH_tab, RH_margin,
	Col_after3, _), !.

/* ************************************************************************
Linear_track_pts wffs.
------------------------------------------------------------------------ */

vf_write(is_within_conflict_box_of(Linear_track_pt2,Linear_track_pt1), 
	     LH_tab, RH_margin):- !,
	vf_write_term(Linear_track_pt2, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([is,within,conflict,box,of],
	LH_tab, RH_margin, Col_after1, Col_after2), 
	vf_write_term(Linear_track_pt1, LH_tab, RH_margin, 
		      Col_after2, _), !.

vf_write(is_not_in_lateral_conflict_with(Linear_track_pt2,Linear_track_pt1), 
	     LH_tab, RH_margin):- !,
	vf_write_term(Linear_track_pt2, LH_tab, RH_margin, 
		      LH_tab, Col_after1),
	write_atom_list_mod_margin([is,not,in,lateral,conflict,with],
	LH_tab, RH_margin, Col_after1, Col_after2), 
	vf_write_term(Linear_track_pt1, LH_tab, RH_margin, 
		      Col_after2, _), !.

/* ************************************************************************
Airspace wffs.
------------------------------------------------------------------------ */ 

vf_write(are_vertices_for(TwoD_pt1,TwoD_pt2,Airspace),
	     LH_tab, RH_margin) :- !,
	vf_write_term(TwoD_pt1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(TwoD_pt2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,vertices,for], LH_tab, RH_margin, Col_after3, 
		Col_after4), 
	vf_write_term(Airspace, LH_tab, RH_margin, 
		      Col_after4, Col_after5),
	write_atom_list_mod_margin([airspace], LH_tab, RH_margin, Col_after5, 
		Col_after_), !.

vf_write(not__(are_vertices_for(TwoD_pt1,TwoD_pt2,Airspace)),
	     LH_tab, RH_margin) :- !,
	vf_write_term(TwoD_pt1, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(TwoD_pt2, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([are,'NOT',vertices,for], LH_tab, RH_margin, Col_after3, 
		Col_after4), 
	vf_write_term(Airspace, LH_tab, RH_margin, 
		      Col_after4, Col_after5),
	write_atom_list_mod_margin([airspace], LH_tab, RH_margin, Col_after5, 
		Col_after_), !.

vf_write(is_the_max_flight_level_for(Flight_level,Airspace),
	     LH_tab, RH_margin) :- !,
	vf_write_term(Flight_level, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,the,maximum,flight,level,for], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Airspace, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([airspace], LH_tab, RH_margin, Col_after3, 
		Col_after_), !.

vf_write(is_the_min_flight_level_for(Flight_level,Airspace),
	     LH_tab, RH_margin) :- !,
	vf_write_term(Flight_level, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,the,mimimum,flight,level,for], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Airspace, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([airspace], LH_tab, RH_margin, Col_after3, 
		Col_after_), !.

vf_write(overlaps_with_the_flight_level_range_of_airspace(Flight_level_range,Airspace),
	     LH_tab, RH_margin) :- !,
	vf_write_term(Flight_level_range, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([overlaps,with,the,flight,level,range,of], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Airspace, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([airspace], LH_tab, RH_margin, Col_after3, 
		_), !.

vf_write(not__(overlaps_with_the_flight_level_range_of_airspace(Flight_level_range,Airspace)),
	     LH_tab, RH_margin) :- !,
	vf_write_term(Flight_level_range, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin(['DOES','NOT',overlap,with,the,flight,level,range,of], LH_tab, RH_margin, Col_after1, 
		Col_after2), 
	vf_write_term(Airspace, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([airspace], LH_tab, RH_margin, Col_after3, 
		_), !.

/* ************************************************************************
Undefined wffs.
------------------------------------------------------------------------ */ 

vf_write(if_are_on_profiles_which_diverge_then_longitudinal_separation_is_at_least_5_mins_where_lateral_separation_of_60nm_is_achieved(Segment1,Segment2), 
	     LH_tab, RH_margin) :- !,
	write_atom_list_mod_margin([if], LH_tab,
		 RH_margin, LH_tab, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	vf_write_term(Segment2, LH_tab, RH_margin, 
		Col_after3, Col_after4),
	write_atom_list_mod_margin([are,on,profiles,which,diverge,then,longitudinal,
		separation,is,at,least,5,mins,where,lateral,separation,of,60,'NM',is,
		achieved], LH_tab, RH_margin, Col_after4, _), !.

vf_write(is_within_lateral_and_longitudinal_boundaries_of_airspace(TwoD_pt,Airspace),
	     LH_tab, RH_margin) :- !,
	vf_write_term(TwoD_pt, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,within,lateral,and,longitudinal,boundaries,of,
	the], LH_tab, RH_margin, Col_after1, Col_after2), 
	vf_write_term(Airspace, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([airspace], LH_tab, RH_margin, Col_after3, 
		_), !.

vf_write(not__(is_within_lateral_and_longitudinal_boundaries_of_airspace(TwoD_pt,Airspace)),
	     LH_tab, RH_margin) :- !,
	vf_write_term(TwoD_pt, LH_tab, RH_margin, LH_tab, Col_after1),
	write_atom_list_mod_margin([is,'NOT',within,lateral,and,longitudinal,boundaries,of,
	the], LH_tab, RH_margin, Col_after1, Col_after2), 
	vf_write_term(Airspace, LH_tab, RH_margin, 
		      Col_after2, Col_after3),
	write_atom_list_mod_margin([airspace], LH_tab, RH_margin, Col_after3, 
		_), !.


/* **********************************************************************
Default clause for display of negation - applies to negations of
non-atomic wffs, or negations of atomic wffs for which no special
form is specified.
---------------------------------------------------------------------- */

vf_write(not__(A), LH_tab, RH_margin):- !,
	write_atom_list_mod_margin(['IT','IS','NOT','THE','CASE','THAT'], 	
				   LH_tab, RH_margin, LH_tab, Col_after1), 
	nl,	
	New_LH_tab is LH_tab + 4,
	tab(New_LH_tab),
	vf_write(A, New_LH_tab, RH_margin), !.


/* ************************************************************************
Write routines for terms. First clause covers all non-compound terms,
i.e. TF_variables and TF_constants.
------------------------------------------------------------------------ */

/* general default clause for terms represented by Prolog atoms */

vf_write_term(A, LH_tab, RH_margin, Col_before_term, Col_after_term) :- 
	atomic(A), !,
	vf_list_for_const_or_var(A, VF_list),
	write_atom_list_mod_margin(VF_list, LH_tab,
		 RH_margin,  Col_before_term, Col_after_term), !.

vf_list_for_const_or_var(shanwick, ['Shanwick']):- !.
vf_list_for_const_or_var(gander, ['Gander']):- !.
vf_list_for_const_or_var(mnps, ['MNPS']):- !.
vf_list_for_const_or_var(oceanic, ['Oceanic']):- !.
vf_list_for_const_or_var(time_of_current_conflict_probe,
		   [`, time, of, current, conflict, probe, Quote]):- !,
	name(Quote, [39]).
vf_list_for_const_or_var(Expr, [Expr]).	% default case


/* ************************************************************************
Aircraft terms.
------------------------------------------------------------------------ */

vf_write_term(the_Aircraft_on_profile(Profile), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'Aircraft',on], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Profile, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_Aircraft_on_segment(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'Aircraft',on], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

/* ************************************************************************
Type terms.
------------------------------------------------------------------------ */

vf_write_term(the_Type_of(Aircraft), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'Type',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Aircraft, LH_tab, RH_margin, Col_after1, Col_after_term), !.

/* ************************************************************************
Latitude terms.
------------------------------------------------------------------------ */

vf_write_term(lat_N(Degs_val), LH_tab, RH_margin, Col_before_term, 
	      Col_after_term) :- !,
	write_atom_list_mod_margin([Degs_val,'N'], LH_tab,
		 RH_margin,  Col_before_term, Col_after_term), !.

vf_write_term(lat_S(Degs_val), LH_tab, RH_margin, Col_before_term, 
	      Col_after_term) :- !,
	write_atom_list_mod_margin([Degs_val,'S'], LH_tab,
		 RH_margin,  Col_before_term, Col_after_term), !.

vf_write_term(lat_N(Degs_val,Mins_val), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([Degs_val,Mins_val,'N'], LH_tab, 
				   RH_margin, Col_before_term, 
				   Col_after_term), !.

vf_write_term(lat_S(Degs_val,Mins_val), LH_tab, RH_margin, Col_before_term, 
	      Col_after_term) :- !,
	write_atom_list_mod_margin([Degs_val,Mins_val,'S'], LH_tab,
		 RH_margin,  Col_before_term, Col_after_term), !.

vf_write_term(the_Lat_of_2D_pt(TwoD_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'Latitude',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(TwoD_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_Lat_of_4D_pt(FourD_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'Latitude',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(FourD_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_entry_Lat_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,entry,'Latitude',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_exit_Lat_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,exit,'Latitude',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_most_northerly_Lat_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,most,northerly,'Latitude',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_most_southerly_Lat_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,most,southerly,'Latitude',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

/* ************************************************************************
Longitude terms.
------------------------------------------------------------------------ */

vf_write_term(long_E(Degs_val), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([Degs_val,'E'], LH_tab,
		 RH_margin,  Col_before_term, Col_after_term), !.

vf_write_term(long_W(Degs_val), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([Degs_val,'W'], LH_tab,
		 RH_margin,  Col_before_term, Col_after_term), !.

vf_write_term(long_E(Degs_val,Mins_val), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([Degs_val,Mins_val,'E'], LH_tab,
		 RH_margin,  Col_before_term, Col_after_term), !.

vf_write_term(long_W(Degs_val,Mins_val), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([Degs_val,Mins_val,'W'], LH_tab,
		 RH_margin,  Col_before_term, Col_after_term), !.

vf_write_term(the_Long_of_2D_pt(TwoD_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'Longitude',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(TwoD_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_Long_of_4D_pt(FourD_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'Longitude',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(FourD_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_entry_Long_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,entry,'Longitude',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_exit_Long_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,exit,'Longitude',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_most_westerly_Long_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,most,westerly,'Longitude',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_most_easterly_Long_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,most,easterly,'Longitude',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

/* ************************************************************************
Flight_level terms.
------------------------------------------------------------------------ */

vf_write_term(fl(Int_0_to_1000), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin(['FL'], LH_tab, RH_margin, 
				   Col_before_term, Col_after1),
	vf_write_term(Int_0_to_1000, LH_tab, RH_margin, 
		      Col_after1, Col_after_term), !.

vf_write_term(the_max_Flight_level_of_fl_range(Flight_level_range), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,maximum,'Flight_level',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Flight_level_range, LH_tab, RH_margin, Col_after1, Col_after_term), !. 

vf_write_term(the_min_Flight_level_of_fl_range(Flight_level_range), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,minimum,'Flight_level',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Flight_level_range, LH_tab, RH_margin, Col_after1, Col_after_term), !. 

vf_write_term(the_Flight_level_of_3D_pt(ThreeD_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'Flight_level',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(ThreeD_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_Flight_level_of_4D_pt(FourD_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'Flight_level',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(FourD_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_max_Flight_level_of_segment(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,maximum,'Flight_level',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_min_Flight_level_of_segment(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,minimum,'Flight_level',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_max_entry_Flight_level_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,maximum,entry,'Flight_level',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_max_exit_Flight_level_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,maximum,exit,'Flight_level',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_min_entry_Flight_level_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,minimum,entry,'Flight_level',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_min_exit_Flight_level_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,minimum,exit,'Flight_level',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

/* ************************************************************************
Time terms.
------------------------------------------------------------------------ */

vf_write_term(time(Hrs_val,Mins_val,Day_val), LH_tab, RH_margin,
	      Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([Hrs_val,Mins_val,day,Day_val], LH_tab,
				   RH_margin, Col_before_term, Col_after_term), !.

vf_write_term(the_next_integer_Time_in_mins_after(Time), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,next,integer,'Time',in,mins,after], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Time, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_Time_of(FourD_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'Time',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(FourD_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_entry_Time_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,entry,'Time',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_exit_Time_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,exit,'Time',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_overlap_window_start_Time_for(Segment1,Segment2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,overlap,window,start,'Time',for], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2), 
	write_atom_list_mod_margin([and], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after_term),  !.

vf_write_term(the_overlap_window_end_Time_for(Segment1,Segment2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,overlap,window,end,'Time',for], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2), 
	write_atom_list_mod_margin([and], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after_term),  !.

/* ************************************************************************
Flight level range terms.
------------------------------------------------------------------------ */

vf_write_term(fl_range(Flight_level1,Flight_level2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	vf_write_term(Flight_level1, LH_tab, RH_margin, Col_before_term, Col_after1),
	write_atom_list_mod_margin([;], LH_tab,
		 RH_margin,  Col_after1, Col_after2),
	vf_write_term(Flight_level2, LH_tab, RH_margin, Col_after2, Col_after_term), !.

vf_write_term(the_Flight_level_range_of_3D_pt(ThreeD_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'Flight_level_range',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(ThreeD_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_Flight_level_range_of_4D_pt(FourD_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'Flight_level_range',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(FourD_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_entry_Flight_level_range_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,entry,'Flight_level_range',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_exit_Flight_level_range_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,exit,'Flight_level_range',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

/* ************************************************************************
2D_pt terms.
------------------------------------------------------------------------ */

vf_write_term(twoD_pt(Lat,Long), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	vf_write_term(Lat, LH_tab, RH_margin, Col_before_term, Col_after1),
	vf_write_term(Long, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_2D_pt_of_3D_pt(ThreeD_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'2D_pt',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(ThreeD_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_2D_pt_of_4D_pt(FourD_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'2D_pt',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(FourD_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_entry_2D_pt_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,entry,'2D_pt',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_exit_2D_pt_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,exit,'2D_pt',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

/* ************************************************************************
3D_pt terms.
------------------------------------------------------------------------ */

vf_write_term(threeD_pt(TwoD_pt,Flight_level), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	vf_write_term(TwoD_pt, LH_tab, RH_margin, Col_before_term, Col_after1),
	write_atom_list_mod_margin([;], LH_tab,
		 RH_margin,  Col_after1, Col_after2),
	vf_write_term(Flight_level, LH_tab, RH_margin, Col_after2, Col_after_term), !.

vf_write_term(the_3D_pt_of(FourD_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'3D_pt',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(FourD_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.
 
/* ************************************************************************
4D_pt terms.
------------------------------------------------------------------------ */

vf_write_term(fourD_pt(ThreeD_pt,Time), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	vf_write_term(ThreeD_pt, LH_tab, RH_margin, Col_before_term, Col_after1),
	write_atom_list_mod_margin([;], LH_tab,
		 RH_margin,  Col_after1, Col_after2),
	vf_write_term(Time, LH_tab, RH_margin, Col_after2, Col_after_term), !.

vf_write_term(the_entry_4D_pt_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,entry,'4D_pt',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_exit_4D_pt_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,exit,'4D_pt',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_first_4D_pt_of(Profile), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,first,'4D_pt',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Profile, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_first_recognised_4D_pt_for_oceanic_cpr_of(Profile), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,first,recognised,'4D_pt',for,oceanic,
		conflict,prediction,and,resolution,of], LH_tab, RH_margin,  
		Col_before_term, Col_after1),
	vf_write_term(Profile, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_last_recognised_4D_pt_for_oceanic_cpr_of(Profile), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,last,recognised,'4D_pt',for,oceanic,
		conflict,prediction,and,resolution,of], LH_tab, RH_margin,  
		Col_before_term, Col_after1),
	vf_write_term(Profile, LH_tab, RH_margin, Col_after1, Col_after_term), !.

/* ************************************************************************
Profile terms. 
------------------------------------------------------------------------ */

vf_write_term(the_Profile_containing(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'Profile',containing], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

/* ***********************************************************************
Segment terms.
----------------------------------------------------------------------- */

vf_write_term(the_Segment(Profile,FourD_pt1,FourD_pt2,Val), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([`,the,'Segment',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Profile, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([from], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(FourD_pt1, LH_tab, RH_margin, Col_after3, Col_after4),
	write_atom_list_mod_margin([to], LH_tab,
		 RH_margin,  Col_after4, Col_after5),
	vf_write_term(FourD_pt2, LH_tab, RH_margin, Col_after5, Col_after6),
	write_atom_list_mod_margin([at,mach,number], LH_tab,
		 RH_margin,  Col_after6, Col_after7),
	vf_write_term(Val, LH_tab, RH_margin, Col_after7, Col_after8),
	name(Quote,[39]), 
	write_atom_list_mod_margin([Quote], LH_tab,
		 RH_margin,  Col_after8, Col_after_term), !.

vf_write_term(the_entry_Segment_of(Profile), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,entry,'Segment',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Profile, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_exit_Segment_of(Profile), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,exit,'Segment',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Profile, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_earlier_Segment_of(Segment1,Segment2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,earlier,'Segment',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_later_Segment_of(Segment1,Segment2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,later,'Segment',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_Segment_of(Linear_track_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,'Segment',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Linear_track_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

/* ***********************************************************************
Linear_track_pt terms.
----------------------------------------------------------------------- */

vf_write_term(the_Linear_track_pt(Segment,Val), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([`,the,'Linear_track_pt',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([at], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Val, LH_tab, RH_margin, Col_after3, Col_after4),
	name(Quote,[39]), 
	write_atom_list_mod_margin([Quote], LH_tab,
		 RH_margin,  Col_after4, Col_after_term), !.

vf_write_term(the_entry_Linear_track_pt_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,entry,'Linear_track_pt',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_exit_Linear_track_pt_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !,
	write_atom_list_mod_margin([the,exit,'Linear_track_pt',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

/* ***********************************************************************
Airspace terms. No compound terms.
----------------------------------------------------------------------- */

/* ***********************************************************************
Value terms.
----------------------------------------------------------------------- */

vf_write_term(Val, LH_tab, RH_margin, Col_before_term, Col_after_term) :-  
	Val =.. [F,Val1,Val2],
	member(F, [+, -, *, /, mod]), !,
	length_of_exp(Val, Exp_length),
	((RH_margin < LH_tab + Exp_length,
	  (Col_before_term =:= LH_tab ; nl, tab(LH_tab)),
	  write_atom_list_mod_margin(['('], LH_tab,
		 RH_margin,  LH_tab, Col_after1),
	  New_LH_tab is Col_after1,
	  vf_write_term(Val1, New_LH_tab, RH_margin, Col_after1, 
		_),
	  nl,
	  tab(New_LH_tab),
 	  write_atom_list_mod_margin([F], New_LH_tab,
		 RH_margin,  Col_after1, _),
	  nl,
	  tab(New_LH_tab),
	  vf_write_term(Val2, New_LH_tab, RH_margin, Col_after1, 
		_),
	  nl,
	  tab(LH_tab),
	  write_atom_list_mod_margin([')'], LH_tab,
		 RH_margin,  LH_tab, Col_after_term));
	 (RH_margin >= Col_before_term + Exp_length,
	  write_atom_list_mod_margin(['('], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	  vf_write_term(Val1, LH_tab, RH_margin, Col_after1, Col_after2),
 	  write_atom_list_mod_margin([F], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	  vf_write_term(Val2, LH_tab, RH_margin, Col_after3, Col_after4), 
	  write_atom_list_mod_margin([')'], LH_tab,
		 RH_margin,  Col_after4, Col_after_term));
       	 (nl,
	  tab(LH_tab),
	  write_atom_list_mod_margin(['('], LH_tab,
		 RH_margin,  LH_tab, Col_after1),
	  vf_write_term(Val1, LH_tab, RH_margin, Col_after1, Col_after2),
 	  write_atom_list_mod_margin([F], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	  vf_write_term(Val2, LH_tab, RH_margin, Col_after3, Col_after4), 
	  write_atom_list_mod_margin([')'], LH_tab,
		 RH_margin,  Col_after4, Col_after_term))), !.

vf_write_term(- Val, LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	length_of_exp(- Val, Exp_length),
	((RH_margin < LH_tab + Exp_length,
	  (Col_before_term =:= LH_tab ; nl, tab(LH_tab)),
	  write_atom_list_mod_margin([-], LH_tab,
		 RH_margin,  LH_tab, Col_after1),
	  New_LH_tab is Col_after1,
	  vf_write_term(Val, New_LH_tab, RH_margin, Col_after1, 
		Col_after_term));
	 (RH_margin >= Col_before_term + Exp_length,
	  write_atom_list_mod_margin([-], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	  vf_write_term(Val, LH_tab, RH_margin, Col_after1, Col_after_term));
       	 (nl,
	  tab(LH_tab),
	  write_atom_list_mod_margin([-], LH_tab,
		 RH_margin,  LH_tab, Col_after1),
	  vf_write_term(Val, LH_tab, RH_margin, Col_after1, Col_after_term))), !.

vf_write_term(Val, LH_tab, RH_margin, Col_before_term, Col_after_term) :-  
	Val =.. [F,Val1],
	member(F, [abs,sin,cos,tan,sqrt,round]), !,
	length_of_exp(Val, Exp_length),
	((RH_margin < LH_tab + Exp_length,
	  (Col_before_term =:= LH_tab ; nl, tab(LH_tab)),
	   ((atomic(Val1), write_atom_list_mod_margin([F, '('], LH_tab,
		 RH_margin,  LH_tab, Col_after1));
	    write_atom_list_mod_margin([F], LH_tab,
		 RH_margin,  LH_tab, Col_after1)),
	   New_LH_tab is Col_after1,
	   vf_write_term(Val1, New_LH_tab, RH_margin, Col_after1, 
		Col_after2),
	   ((atomic(Val1),write_atom_list_mod_margin([')'], New_LH_tab,
		 RH_margin,  Col_after2, Col_after_term));
             Col_after_term is Col_after2));
	 (RH_margin >= Col_before_term + Exp_length,
	  ((atomic(Val1), write_atom_list_mod_margin([F, '('], LH_tab,
		 RH_margin,  LH_tab, Col_after1));
	   write_atom_list_mod_margin([F], LH_tab,
		 RH_margin,  LH_tab, Col_after1)),	  
	   vf_write_term(Val1, LH_tab, RH_margin, Col_after1, Col_after2),
	   ((atomic(Val1),write_atom_list_mod_margin([')'], New_LH_tab,
		 RH_margin,  Col_after2, Col_after_term));
            Col_after_term is Col_after2)); 	  
       	 (nl,
	  tab(LH_tab),
	  ((atomic(Val1), write_atom_list_mod_margin([F, '('], LH_tab,
		 RH_margin,  LH_tab, Col_after1));
	  write_atom_list_mod_margin([F], LH_tab,
		 RH_margin,  LH_tab, Col_after1)),
	  vf_write_term(Val1, LH_tab, RH_margin, Col_after1, Col_after2),
	  ((atomic(Val1),write_atom_list_mod_margin([')'], New_LH_tab,
		 RH_margin,  Col_after2, Col_after_term));
            Col_after_term is Col_after2))), !.

vf_write_term(Val, LH_tab, RH_margin, Col_before_term, Col_after_term) :-  
	Val =.. [F,Val1,Val2],
	power_functor_name__(F), !,
/*	member(F, [pow]), !,     Quintus */
/*	member(F, [exp]), !,	 sicstus */
	length_of_exp(Val, Exp_length),
	((RH_margin < LH_tab + Exp_length,
	  (Col_before_term =:= LH_tab ; nl, tab(LH_tab)),
	  write_atom_list_mod_margin(['('], LH_tab,
		 RH_margin,  LH_tab, Col_after1),
	  New_LH_tab is Col_after1,
	  vf_write_term(Val1, New_LH_tab, RH_margin, Col_after1, 
		_),
	  nl,
	  tab(New_LH_tab),
 	  write_atom_list_mod_margin([^], New_LH_tab,
		 RH_margin,  Col_after1, _),
	  nl,
	  tab(New_LH_tab),
	  vf_write_term(Val2, New_LH_tab, RH_margin, Col_after1, 
		_),
	  nl,
	  tab(LH_tab),
	  write_atom_list_mod_margin([')'], LH_tab,
		 RH_margin,  LH_tab, Col_after_term));
	 (RH_margin >= Col_before_term + Exp_length,
	  write_atom_list_mod_margin(['('], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	  vf_write_term(Val1, LH_tab, RH_margin, Col_after1, Col_after2),
 	  write_atom_list_mod_margin([^], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	  vf_write_term(Val2, LH_tab, RH_margin, Col_after3, Col_after4), 
	  write_atom_list_mod_margin([')'], LH_tab,
		 RH_margin,  Col_after4, Col_after_term));
       	 (nl,
	  tab(LH_tab),
	  write_atom_list_mod_margin(['('], LH_tab,
		 RH_margin,  LH_tab, Col_after1),
	  vf_write_term(Val1, LH_tab, RH_margin, Col_after1, Col_after2),
 	  write_atom_list_mod_margin([^], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	  vf_write_term(Val2, LH_tab, RH_margin, Col_after3, Col_after4), 
	  write_atom_list_mod_margin([')'], LH_tab,
		 RH_margin,  Col_after4, Col_after_term))), !.

vf_write_term(Val, LH_tab, RH_margin, Col_before_term, Col_after_term) :-  
	Val =.. [F,Val1,Val2],
	member(F, [max,min]), !,
	length_of_exp(Val, Exp_length),
	((RH_margin < LH_tab + Exp_length,
	  (Col_before_term =:= LH_tab ; nl, tab(LH_tab)),
	  write_atom_list_mod_margin([F,'('], LH_tab,
		 RH_margin,  LH_tab, Col_after1),
	  New_LH_tab is Col_after1,
	  vf_write_term(Val1, New_LH_tab, RH_margin, Col_after1, 
		Col_after2),
	  write_atom_list_mod_margin([','], New_LH_tab,
		 RH_margin,  Col_after2, _),
	  nl,
	  tab(New_LH_tab),
	  vf_write_term(Val2, New_LH_tab, RH_margin, Col_after1, 
		Col_after3),
	  write_atom_list_mod_margin([')'], New_LH_tab,
		 RH_margin,  Col_after3, Col_after_term));
	 (RH_margin >= Col_before_term + Exp_length,
	  write_atom_list_mod_margin([F,'('], LH_tab,
		 RH_margin,  LH_tab, Col_after1),	  
	  vf_write_term(Val1, LH_tab, RH_margin, Col_after1, Col_after2),
	  write_atom_list_mod_margin([','], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	  vf_write_term(Val2, LH_tab, RH_margin, Col_after3, 
		Col_after4),
	  write_atom_list_mod_margin([')'], LH_tab,
		 RH_margin,  Col_after4, Col_after_term)); 
       	 (nl,
	  tab(LH_tab),
	  write_atom_list_mod_margin([F,'('], LH_tab,
		 RH_margin,  LH_tab, Col_after1),
	  vf_write_term(Val1, LH_tab, RH_margin, Col_after1, Col_after2),
	  write_atom_list_mod_margin([','], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	  vf_write_term(Val2, LH_tab, RH_margin, Col_after3, Col_after4),
	  write_atom_list_mod_margin([')'], LH_tab,
		 RH_margin,  Col_after4, Col_after_term))), !.

vf_write_term(the_long_arc_mins_dist_Val_between(Val1,Val2), LH_tab, 
		RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin(
		[the,longitude,arc,mins,distance,'Val',between], 
		LH_tab, RH_margin, Col_before_term, Col_after1),
	vf_write_term(Val1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Val2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_long_arc_mins_eastward_Val_from(Val1,Val2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,longitude,arc,mins,eastward,'Val',from], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Val1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([to], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Val2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_long_arc_mins_westward_Val_from(Val1,Val2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,longitude,arc,mins,westward,'Val',from], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Val1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([to], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Val2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_total_Val_in_arc_mins_of_lat(Lat), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,total,'Val',in,arc,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Lat, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_total_Val_in_arc_mins_of_long(Long), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,total,'Val',in,arc,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Long, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_arc_mins_eastward_Val_from(Long1,Long2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,arc,mins,eastward,'Val',from], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Long1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([to], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Long2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_arc_mins_westward_Val_from(Long1,Long2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,arc,mins,westward,'Val',from], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Long1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([to], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Long2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_Val_in_100s_of_feet_of(Flight_level), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,'Val',in,'100s',of,feet,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Flight_level, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_Val_in_feet_of(Flight_level), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,'Val',in,feet,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Flight_level, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_total_Val_in_mins_of(Time), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,total,'Val',in,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Time, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_nm_linear_dist_Val_between_2D_pts(TwoD_pt1,TwoD_pt2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,nm,linear,distance,'Val',between], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(TwoD_pt1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(TwoD_pt2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_lat_Val_in_arc_mins_of(TwoD_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,latitude,'Val',in,arc,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(TwoD_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_long_Val_in_arc_mins_of(TwoD_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,longitude,'Val',in,arc,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(TwoD_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_machno_Val_on(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,mach,number,'Val',on], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_cruise_climb_status_Val_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,cruise,climb,status,'Val',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_entry_lat_Val_in_arc_mins_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,entry,latitude,'Val',in,arc,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_exit_lat_Val_in_arc_mins_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,exit,latitude,'Val',in,arc,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_entry_long_Val_in_arc_mins_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,entry,longitude,'Val',in,arc,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_exit_long_Val_in_arc_mins_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,exit,longitude,'Val',in,arc,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_entry_time_Val_in_mins_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,entry,time,'Val',in,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_exit_time_Val_in_mins_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,exit,time,'Val',in,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_lat_over_long_gradient_Val_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,latitude,over,longitude,gradient,'Val',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_nm_linear_track_length_Val_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,nm,linear,track,length,'Val',of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_lat_length_Val_in_arc_mins_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,latitude,length,'Val',in,arc,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_long_length_Val_in_arc_mins_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,longitude,length,'Val',in,arc,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_offset_const_Val_for_linear_track_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,offset,constant,'Val',for,linear,track,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_average_lat_Val_in_arc_mins_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,average,latitude,'Val',in,arc,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_time_to_fly_Val_in_mins_of(Segment), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,time,to,fly,'Val',in,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_min_vertical_sep_Val_in_feet_required_for(Flight_level1,Segment1,Flight_level2,Segment2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,minimum,vertical,separation,'Val',in,feet,
		required,for], LH_tab, RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Flight_level1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([of], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after3, Col_after4),
	write_atom_list_mod_margin([and], LH_tab,
		 RH_margin,  Col_after4, Col_after5),
	vf_write_term(Flight_level2, LH_tab, RH_margin, Col_after5, Col_after6),
	write_atom_list_mod_margin([of], LH_tab,
		 RH_margin,  Col_after6, Col_after7),
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after7, Col_after_term), !.

vf_write_term(the_min_lateral_sep_Val_in_nm_required_for(Segment1,Segment2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,minimum,lateral,separation,'Val',in,'NM',
		required,for], LH_tab, RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_min_longitudinal_sep_Val_in_mins_required_for(Segment1,Segment2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,minimum,longitudinal,separation,'Val',in,
		mins,required,for], LH_tab, RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_basic_min_longitudinal_sep_Val_in_mins_required_for(Segment1,Segment2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,basic,minimum,longitudinal,separation,
		'Val',in,mins,required,for], LH_tab, RH_margin,  Col_before_term,
		Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_prox_airfield_long_sep_adjustment_Val_in_mins_required_for(Segment1,Segment2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,proximate,airfield,longitude,separation,
		adjustment,'Val',in,mins,required,for], LH_tab, RH_margin, 
		Col_before_term, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_time_gap_Val_in_mins_between(Segment1,Segment2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,time,gap,'Val',in,mins,between], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_required_lateral_half_box_dimension_Val_for_wrt(Segment1,Segment2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,required,lateral,half,box,dimension,'Val',
		for], LH_tab, RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([with,respect,to], LH_tab,
		RH_margin,  Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_required_longitudinal_half_box_dimension_Val_for_wrt(Segment1,Segment2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,required,longitudinal,half,box,dimension,
		'Val',for], LH_tab, RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([with,respect,to], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Segment2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_lat_Val_on_linear_track_of_at(Segment,Long), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,latitude,'Val',on,linear,track,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Segment, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([at], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Long, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_total_time_Val_in_mins_at(Linear_track_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,total,time,'Val',in,mins,at], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Linear_track_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_lat_Val_in_arc_mins_of(Linear_track_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,latitude,'Val',in,arc,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Linear_track_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_long_Val_in_arc_mins_of(Linear_track_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,longitude,'Val',in,arc,mins,of], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Linear_track_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_segment_entry_lat_Val_in_arc_mins_for(Linear_track_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,segment,entry,latitude,'Val',in,arc,mins,for], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Linear_track_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_segment_exit_lat_Val_in_arc_mins_for(Linear_track_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,segment,exit,latitude,'Val',in,arc,mins,for], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Linear_track_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_segment_entry_long_Val_in_arc_mins_for(Linear_track_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,segment,entry,longitude,'Val',in,arc,
		mins,for], LH_tab, RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Linear_track_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_segment_exit_long_Val_in_arc_mins_for(Linear_track_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,segment,exit,longitude,'Val',in,arc,mins,for], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Linear_track_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_nm_linear_dist_Val_between_linear_track_pts(Linear_track_pt1,Linear_track_pt2), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,nm,linear,distance,'Val',between], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Linear_track_pt1, LH_tab, RH_margin, Col_after1, Col_after2),
	write_atom_list_mod_margin([and], LH_tab,
		 RH_margin,  Col_after2, Col_after3),
	vf_write_term(Linear_track_pt2, LH_tab, RH_margin, Col_after3, Col_after_term), !.

vf_write_term(the_segment_entry_time_Val_in_mins_for(Linear_track_pt),
 LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,segment,entry,time,'Val',in,mins,for], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Linear_track_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.

vf_write_term(the_segment_exit_time_Val_in_mins_for(Linear_track_pt), LH_tab, RH_margin, Col_before_term, Col_after_term) :- !, 
	write_atom_list_mod_margin([the,segment,exit,time,'Val',in,mins,for], LH_tab,
		 RH_margin,  Col_before_term, Col_after1),
	vf_write_term(Linear_track_pt, LH_tab, RH_margin, Col_after1, Col_after_term), !.


/* **************************************************************************
Auxiliary procedure for writing out wffs with leading universal quantifiers.
-------------------------------------------------------------------------- */

vf_univ_quan_write(all(V, A),  LH_tab, RH_margin):- 	  /* only one leading 'all' */
	not__(A = all(_, _)), !,
	write_atom_list_mod_margin([V], LH_tab, RH_margin, LH_tab, 
		Col_after1), nl,
	New_LH_tab is LH_tab + 4,
	tab(New_LH_tab),
	vf_write(A, New_LH_tab, RH_margin), !.
	
vf_univ_quan_write(all(V1, all(V2, A)), LH_tab, RH_margin):-   /* just two 'all's */
	not__(A = all(_, _)), !,
	write_atom_list_mod_margin([V1], LH_tab, RH_margin, LH_tab, 
		Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2),
	write_atom_list_mod_margin([V2], LH_tab, RH_margin, Col_after2, 
		Col_after3), nl,
	New_LH_tab is  LH_tab + 4,
	tab(New_LH_tab),
	vf_write(A, New_LH_tab, RH_margin), !.


/* Next clause applies if more than 2 nested univ quantifiers. */
vf_univ_quan_write(all(V, A), LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([V], LH_tab, RH_margin, LH_tab, 
		Col_after1),
	write_atom_list_mod_margin([','], LH_tab, RH_margin, Col_after1, 
		Col_after2),
	vf_univ_quan_write(A, LH_tab, RH_margin), !.
	

/* **************************************************************************
Auxiliary procedure for writing out wffs with leading existential quantifiers,
used for wffs with 2 or more leading ex. quantifiers.
-------------------------------------------------------------------------- */

vf_ex_quan_write(exists(V1, exists(V2,A)), LH_tab, RH_margin):-   /* just two 'exists's */
	not__(A = exists(_,_)), !,
	write_atom_list_mod_margin([V1], LH_tab, RH_margin, LH_tab, 
		Col_after1),
	write_atom_list_mod_margin([and], LH_tab, RH_margin, Col_after1, 
		Col_after2),	
	write_atom_list_mod_margin([V2], LH_tab, RH_margin, Col_after2, 
		Col_after3), 
	write_atom_list_mod_margin(['SUCH','THAT'], LH_tab, RH_margin, Col_after3, 
		Col_after4), nl,
	New_LH_tab is  LH_tab+ 4,
	tab(New_LH_tab),
	vf_write(A, New_LH_tab, RH_margin), !.
	
/* Next clause applies if more than 2 leading ex. quantifiers. */
vf_ex_quan_write(exists(V, A), LH_tab, RH_margin):- !,
	write_atom_list_mod_margin([V], LH_tab, RH_margin, LH_tab, 
		Col_after1), 
	write_atom_list_mod_margin([','], LH_tab, RH_margin, Col_after1, 
		Col_after2),
	vf_ex_quan_write(A, LH_tab, RH_margin), !.


	
/* **************************************************************************
a_or_an(+Varname -A_or_An).

Checks if Varname begins with a vowel and returns 'a' or 'an' accordingly.
-------------------------------------------------------------------------- */

a_or_an(Varname, an):- 
	name(Varname, [Char|_]),
	member(Char, "AEIOU"), !.
a_or_an(_, a).  /* Applies if Varname begins with any other char. */


/* **************************************************************************
Procedure for writing out disjunctions of 2 or more disjuncts.
-------------------------------------------------------------------------- */

vf_disj_write((A or B), LH_tab, RH_margin):- !,
	New_LH_tab is   LH_tab + 4,
	tab(New_LH_tab), vf_write(A, New_LH_tab, RH_margin), nl,
	tab(LH_tab),
 	write_atom_list_mod_margin(['OR'], LH_tab, RH_margin, LH_tab, 
		Col_after1), nl,
	vf_disj_write(B, LH_tab, RH_margin).
vf_disj_write(Wff, LH_tab, RH_margin):- !,
/*	not__(Wff = (A or B)),   */
	New_LH_tab is LH_tab+4,
	tab(New_LH_tab),
	vf_write(Wff, New_LH_tab, RH_margin).


