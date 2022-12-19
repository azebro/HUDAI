
/* 

Code for assigning blame to rules which succeed during an attempt to
prove a negative instance i.e. blame assignment code for FALSE
POSITIVES.

Algorithm
---------

1 For each instance

	generate a generalised proof tree
	form list of unshielded rules which does not include facts
	form list of IDs for these rules
	remove duplicates from this list

2 Append together all the uniqued ID-lists for the instances and sort
the resulting list into ascending order.

3 Remove duplicates from the appended list, annotating it with counts.

NB Duplicate rules are identified using the ID.

NB clause_impress/4 facts are assumed to exist prior to execution of
the code in this file.

NB The code uses the utilities in

/projects/impress/tools/impress_tools/theory_rev/utilities.pl

*/


/********************************************************************/

/*
	   blame_assign_f_pos(List_of_instances,Blame_assignment)

Currently, this is the top level blame assignment procedure.

test with

blame_assign_f_pos([kill(john,john), patricide(john,father(john))],
Answer).

*/

blame_assign_f_pos(List_of_instances,Blame_assignment):-

	f_pos_get_rules(List_of_instances,L), 
	qsort(L, Sorted_L),
	rule_counter(Sorted_L,Blame_assignment).

/********************************************************************/

/* test with
f_pos_get_rules([kill(john,john), patricide(john,father(john))], List_of_rules).
*/

f_pos_get_rules([],[]).
f_pos_get_rules([H|T], Rules):- 
	get_list_of_rules_used_in_proof(H, Hrules),
	f_pos_get_rules(T, Trules), 
	append(Hrules, Trules, Rules).

/********************************************************************/

/* test with
get_list_of_rules_used_in_proof(kill(john,john),List_of_rules).
*/

get_list_of_rules_used_in_proof(Instance,Unique_list_of_rule_IDs):-

	generalise_instance(Instance,Gen_Instance),
	gen_trees(Instance,Gen_Instance,_,Gen_proof),
	form_rules(Gen_proof,L),
	form_list_of_rule_IDs(L,List_of_rule_IDs),
	remove_dups(List_of_rule_IDs,Unique_list_of_rule_IDs).

/********************************************************************/

/* The purpose of this rule is to generate the generalised version of
an instance needed for the call to gen_trees.
*/

generalise_instance(X,GenX):-
	
	functor(X,F,N),
	functor(GenX,F,N).

/********************************************************************/

/* The procedure form_rules(P,L) inputs a proof tree,P, and outputs a
list,L, of lists, where each sublist represents a rule used in the
proof. The sublists for rules take the form

	 [Rule_ID, Head_of_rule, Subgoal_1, Subgoal_2.... ]

NB Facts used in the proof are not included in the L.

Here is some test data.

form_rules([1,[a,[2,a1]]], [[1,a,a1]]).
form_rules([5,[b,[6,[b1,[7,b1i]]]]], [[5,b,b1], [6,b1,b1i]]).
form_rules([8,[c,[9,c1]],10,[d,[11,d1]]],
           [[8,c,c1],[10,d,d1]]).
form_rules([12,e], []). 
form_rules([12,e,13,f], [] ). 
form_rules([10,[d,[11,d1]],12,e,13,f],
           [[10,d,d1]]).
form_rules([14,[h,[12,e,13,f]]], [[14,h,e,f]]).
form_rules([15,[i,[12,e,13,f,10,[d,[11,d1]]]]],
           [[15,i,e,f,d],[10,d,d1]] ).
form_rules([17,[k,[12,e,10,[d,[11,d1]],13,f]]],
           [[17, k, e, d, f],[10,d,d1]] ).
*/

form_rules([], []).

form_rules([N, X], []):-integer(N),  % facts are not returned
			\+ is_list(X).

form_rules([N, [H, L] | T], Rules):-

	integer(N),
	\+ is_list(H),
	is_list(L),
	get_subgoals(L, Lsubgoals),
	form_rules(L, Lrules),
	form_rules(T, Trules),
	append([[N, H | Lsubgoals]], Lrules, Rules1),
	append(Rules1, Trules, Rules).

	
form_rules([H|T], Rules):-

	is_list(H),
	form_rules(H, Hrules),
	form_rules(T, Trules),
	append(Hrules, Trules, Rules).

form_rules([N, H|T], Rules):-

	integer(N),
	\+ is_list(H),
	form_rules([N, H], Hrules),
	form_rules(T, Trules),
	append(Hrules, Trules, Rules).

/********************************************************************/

/* test with

get_subgoals([2,a1], [a1]).
get_subgoals([6,[b1,[7,b1i]]], [b1]).
get_subgoals([12,e,13,f], [e, f]).
get_subgoals([12,e,13,f,10,[d,[11,d1]]], [e, f, d]).

*/

get_subgoals([], []).

get_subgoals([N, A], [A]):-	integer(N),
				\+ is_list(A).

get_subgoals([N, [X|_] | T], [X | TSGs]):- 
	
	integer(N),
	get_subgoals(T, TSGs).

get_subgoals([N, H | T], [H | TSGs]) :-	integer(N),
					\+ is_list(H), 
					get_subgoals(T, TSGs).

/********************************************************************/

/* The procedure gen_trees(X,Gen_X,Proof,Gen_proof) generates a proof
tree and a generalised proof tree. Both trees include clause IDs.

 test with

gen_trees(kill(john,john),kill(X,X),P,GenP).

 */

gen_trees((A ; _), (Gen_A ; _), Proof, Gen_proof) :-
	gen_trees(A, Gen_A, Proof, Gen_proof),
	!.
 
gen_trees((_ ; A), (_ ; Gen_A), Proof, Gen_proof) :-
	!,
	gen_trees(A, Gen_A, Proof, Gen_proof).

/* The first two clauses concern disjunctions by ; */


gen_trees((A, B), (Gen_A, Gen_B), Proof, Gen_proof) :-
	!,
	gen_trees(A, Gen_A, A_Proof, Gen_A_Proof),
	gen_trees(B, Gen_B, B_Proof, Gen_B_Proof),
	append(A_Proof, B_Proof, Proof),
	append(Gen_A_Proof, Gen_B_Proof, Gen_proof).

/* The clause above concerns conjunctions. */

gen_trees(A, Gen_A, [0, A], [0, Gen_A]) :-	
	built_in(A),
	!,
	A.      
		% built-in predicates are given an ID of 0.

/* The parts of the proof concerning either built-in or shielded
predicates are not included in the proof tree. */

gen_trees(Head,Gen_head,[Clause_ID_no, Head],[Clause_ID_no, Gen_head]):-
	clause_impress(Head,true,Clause_ID_no,_),
	!.
      
gen_trees(Head, Gen_head, [Clause_ID_no, Proof], [Clause_ID_no, Gen_proof]) :- 

	clause_impress(Gen_head, Gen_body, Clause_ID_no, Shield_status),
	copy( (Gen_head:-Gen_body), (Head:-Body) ),
	Body,
                     %% Body is called to check that it succeeds.
                     %% This is necessary because Head may match the
                     %% head of a Prolog procedure rather than just
                     %% a single rule. If Body fails then Prolog will
                     %% backtrack to the other rules in the procedure.
	!,
	process_body(Shield_status, Head, Gen_head, Body, Gen_body, Proof, Gen_proof).

/********************************************************************/

process_body(shielded, Head, Gen_head, _, _, Head, Gen_head).

process_body(unshielded, Head, Gen_head, Body, Gen_body, Proof, Gen_proof):-

	gen_trees(Body, Gen_body, Body_proof, Gen_body_proof),
	append([Head],[Body_proof], Proof),
	append([Gen_head], [Gen_body_proof], Gen_proof).

/********************************************************************/

copy(Old,New):- assert('$marker'(Old)), 
                retract('$marker'(New)).


/* form_list_of_rule_IDs(L, List_of_rule_IDs) accepts a list, L, of
lists, where each sublist represents a rule. The sublists for rules
take the form

	 [Rule_ID, Head_of_rule, Subgoal_1, Subgoal_2.... ]

The procedure outputs a list of the IDs for the rules.

Tests...
form_list_of_rule_IDs([[8,c,c1],[10,d,d1]], [8, 10]).


 */

form_list_of_rule_IDs([],[]).

form_list_of_rule_IDs([ [H|_] | T2], [H|T2_IDs]):-
	form_list_of_rule_IDs(T2, T2_IDs).



/********************************************************************/
