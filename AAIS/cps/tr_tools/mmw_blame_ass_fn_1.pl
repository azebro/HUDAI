/* 

Code for assigning blame to rules which fail during an attempt to
prove a positive instance i.e. blame assignment code for FALSE
NEGATIVES.
	  
NB The code does NOT try to assign blame to shielded rules or failed
facts.


This code has been designed with the intension that it should be able
to work with Prolog containing:- (CB 31/1/97)

built-in predicates
shielding
conjuctions
disjunctions (procedures and ;)


Algorithm
---------

1 For each instance
	form list of IDs for unshielded rules that fail
	remove duplicates from this list

2 Append together all the uniqued ID-lists for the instances and sort
the new list into ascending order.

3 Remove duplicates from the sorted list, annotating it with counts.

NB Duplicate rules are identified using the ID.

NB clause_impress/4 facts are assumed to exist prior to execution of
the code in this file.

NB The code uses the utilities in

/projects/impress/tools/impress_tools/theory_rev/tr_utilities.pl

*/


/********************************************************************/

/*
	   blame_assign_f_neg(List_of_instances,Blame_assignment)

Currently, this is the top level blame assignment procedure.

test with

blame_assign_f_neg([murder(john,john), patricide(john,father(john))],
Answer). 

*/

blame_assign_f_neg(List_of_instances,Blame_assignment):-

	f_neg_get_rules(List_of_instances,L), 
	qsort(L,Sorted_L),
	rule_counter(Sorted_L,Blame_assignment).

/********************************************************************/

/* test with
f_neg_get_rules([murder(john,john), patricide(john,father(john))], List_of_rules).
*/

f_neg_get_rules([],[]).
f_neg_get_rules([H|T], Rules):- 
	f_neg_get_IDs_of_rules_which_fail(H, Hrules),
	f_neg_get_rules(T, Trules), 
	append(Hrules, Trules, Rules).

/********************************************************************/

/* test with
f_neg_get_IDs_of_rules_which_fail(murder(john,john), List_of_rules).
*/

f_neg_get_IDs_of_rules_which_fail(Instance, List2):-
	assertz(list_of_IDs([])),
	assert_IDs(Instance),
	list_of_IDs(List),
	remove_dups(List, List2),
	abolish(list_of_IDs).

/* The list of IDs is asserted to Prolog's memory, as opposed to being
passed back by the lower level procedures, because one of these
procedures, namely assert_IDs_of_rules_which_fail, will (CORRECTLY)
fail whenever it is passed a Goal which would fail if it were a Prolog
query. */

/********************************************************************/

assert_IDs(Instance):- assert_IDs_of_rules_which_fail(Instance).

assert_IDs(_). % ensures that this procedure never fails.

/* The purpose of this procedure is to prevent the rule
f_neg_get_IDs_of_rules_which_fail failing.  The procedure
assert_IDs_of_rules_which_fail will (CORRECTLY) fail whenever it is
passed a Goal which would fail if it were a Prolog query. */

/********************************************************************/

assert_IDs_of_rules_which_fail( (Goal ; _) ) :-
	assert_IDs_of_rules_which_fail(Goal).

assert_IDs_of_rules_which_fail( (_ ; Goal) ) :-
	!,
	assert_IDs_of_rules_which_fail(Goal).

/* The first two clauses concern disjunctions by ; */


assert_IDs_of_rules_which_fail( (Goal1, Goal2) ) :- 
	!,
	assert_IDs_of_rules_which_fail(Goal1),
	assert_IDs_of_rules_which_fail(Goal2).

/* The clause above concerns conjunctions. */


assert_IDs_of_rules_which_fail(true) :- !.   

assert_IDs_of_rules_which_fail(Undefined_predicate) :-
	clause_impress(Undefined_predicate, fail, ID, undefined),
	add_ID_to_list(ID),
	!,
	fail.

assert_IDs_of_rules_which_fail(Goal) :-
	built_in(Goal),
        Goal,
	!.

assert_IDs_of_rules_which_fail(Goal) :-
	built_in(Goal),
	add_ID_to_list(0),  % Built-ins are given the ID 0.
	!,
	fail. 

				% NB Built-ins are never redone.

assert_IDs_of_rules_which_fail(Goal) :- 
	\+ built_in(Goal),
	clause_impress(Goal, Body, Clause_ID, Shield_status),
	process_wrt_shield_status(Shield_status, Body, Clause_ID),
	!.

/********************************************************************/

process_wrt_shield_status(shielded, Body, _):- Body.

/* Subgoals arrising from shielded predicates are not traced. */

process_wrt_shield_status(unshielded, Body, Clause_ID):-
        (true ; (add_ID_to_list(Clause_ID), fail) ),
	assert_IDs_of_rules_which_fail(Body).

/********************************************************************/

add_ID_to_list(ID):-
	retract(list_of_IDs(ID_list)),
	append([ID], ID_list, Updated_ID_list),
	assertz(list_of_IDs(Updated_ID_list)).



/********************************************************************/
