%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% OPERATORS for theory revision
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*

NB The following predicate is important.

revision(Type_of_revision, clause_impress(Head, Body, ID, Shield_Status), Score)

where 

  Head and Body are the revised version of rule ID rather than the original. 
  Type_of_revision is either add, delete or substitute.

*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% get_score(Revision, Score)
%%
%% This is used by all the operators.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
get_score(R, Score):-
 get_accuracy(Old_accuracy),
 make_revision(R, Old_clause_impress),
 get_accuracy(New_accuracy),
 reverse_revision(R, Old_clause_impress),
 Score is New_accuracy - Old_accuracy.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% OPERATOR delete_clause(ID, Revision)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
delete_clause(11, revision(delete, clause_impress(man(X), (male(X)), 11, unshielded), Acc)).
 -20? */

/* Algorithm for Operator Delete Clause

For a given clause, C
 IF there is one or more other clauses whose head has the same predicate
  and arity as C
 THEN delete C and its corresponding clause_impress ground unit clause 
 ELSE substitute both the body of C and the body term of the clause_impress
   ground unit clause with fail.

*/

delete_clause(ID, R):-
 clause_impress(H, B, ID, SS),
 functor(H, F, N),
 clause_impress(H2, _, ID_different, _),
 functor(H2, F, N),
 \+ (ID = ID_different),
 R = revision(delete, clause_impress(H, B, ID, SS), Score),
 get_score(R, Score),
 !.

delete_clause(ID, R):-
 clause_impress(H, _, ID, SS),
 R = revision(substitute, clause_impress(H, fail, ID, SS), Score),
 get_score(R, Score),
 !.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% OPERATOR add_antecedents(ID, Revision)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
add_antecedents(11, revision(substitute, clause_impress(man(X), (male(X), adult(X)), 11, unshielded), Acc)).
20? */

/* Algorithm for Operator add_antecedents

For a given clause, C.
 Let L = empty list.
 REPEAT
  get C_temp and T_temp where
   C_temp = a temporary revised version of C where the elements in L have
            been added to C as antecedents.
   T_temp = a temporary revised version of the theory where C has been 
            replaced by C_temp.
  create a set of possible new antecedents for C_temp.
  score each one of the antecedents on their ability to improve the accuracy 
   of the theory, T_temp.
  let A_best be the antecedent which was awarded the highest score.
  IF score of A_best > 0 THEN
   append A_best to L.
 UNTIL score of A_best =< 0.
 get C_final where
   C_final = a revised version of C where the elements in L have been added
             to C as antecedents.
 score C_final on its ability to improve the accuracy of the orginal theory.
 RETURN C_final and its score as the revision proposed by the operator.

*/

add_antecedents(ID, R):- 
 clause_impress(H, B, ID, SS),
 add_one_antecedent_at_a_time(H, B, ID, SS, [], R).

add_one_antecedent_at_a_time(H, B, ID, SS, List_of_antecedents_already_chosen, R):-
 get_best_antecedent(H, B, ID, SS,
                     List_of_antecedents_already_chosen, 
                     New_antecedent, 
                     Score_of_new_antecedent),
 decide_whether_to_stop_adding_antecedents(H, B, ID, SS,
                                           List_of_antecedents_already_chosen, 
                                           New_antecedent, 
                                           Score_of_new_antecedent,
                                           R).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% decide_whether_to_stop_adding_antecedents(H, B, ID, SS, L, N, S, R)
%%
%% where
%% L = List_of_antecedents_already_chosen, 
%% N = New_antecedent, 
%% S = Score_of_new_antecedent,
%% R = Revision
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

decide_whether_to_stop_adding_antecedents(H, B, ID, SS, 
                                          List_of_antecedents_already_chosen, 
                                          New_antecedent, 
                                          Score_of_new_antecedent,
                                          R):-
 Score_of_new_antecedent > 0,
 append([New_antecedent], List_of_antecedents_already_chosen, L),
 add_one_antecedent_at_a_time(H, B, ID, SS, L, R).

decide_whether_to_stop_adding_antecedents(
 H, B, ID, SS,
 List_of_antecedents_already_chosen, 
 _, 
 Score_of_new_antecedent,
 revision(
  substitute,
  clause_impress(H, NewB, ID, SS),
  Final_score)
 ):-
 Score_of_new_antecedent =< 0,
 add_antecedents_to_body(List_of_antecedents_already_chosen, B, NewB),
 get_score(revision(substitute,
                    clause_impress(H, NewB, ID, SS),
                    Final_score),
           Final_score).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% get_best_antecedent(H, B, ID, SS, L, N, S)
%%
%% where
%% L = List_of_antecedents_already_chosen, 
%% N = New_antecedent, 
%% S = Score_of_new_antecedent,
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
get_best_antecedent(man(X), (male(X)), 11, unshielded,
   [], New_antecedent, Score_of_new_antecedent).
*/

get_best_antecedent(H, B, ID, SS,
                    List_of_antecedents_already_chosen, 
                    New_antecedent, 
                    Score_of_new_antecedent):-
 add_antecedents_to_body(List_of_antecedents_already_chosen, B, NewB),
 get_score(revision(substitute,
                    clause_impress(H, NewB, ID, SS),
                    Score_for_antecedents_already_chosen),
           Score_for_antecedents_already_chosen),
 get_possible_antecedents(H, NewB, Possible_new_antecedents),
 award_score_to_each_antecedent(
  H, B, ID, SS,
  List_of_antecedents_already_chosen, 
  Score_for_antecedents_already_chosen,
  Possible_new_antecedents,
  Possible_new_antecedents_and_scores),
 qsort_on_2nd_term_of_the_elements_in_list(
  Possible_new_antecedents_and_scores, 
  Sorted_possible_new_antecedents_and_scores),
 return_best_or_dummy_values(Sorted_possible_new_antecedents_and_scores,
                             New_antecedent, 
                             Score_of_new_antecedent).

return_best_or_dummy_values([], dummy, 0).
return_best_or_dummy_values(
 [antecedent(New_antecedent, Score_of_new_antecedent) | _],
 New_antecedent,
 Score_of_new_antecedent).
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% get_possible_antecedents(Head, Body, Possible_new_antecedents)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
get_possible_antecedents(man(X), (male(X)), Answer).
get_possible_antecedents(man(X), (male(X)), [adult(X),child(X),female(X)]).

get_possible_antecedents(man(X), (male(X),adult(X)), Answer).
get_possible_antecedents(man(X), (male(X),adult(X)), [child(X),female(X)]).
*/

/* Algorithm for get_possible_antecedents

Let C be the clause to be revised.
Generate a list, Lp, of all the predicates in the theory except for the
 predicate in the head of C.
**NB This was replaced by a list provided in the revisable cps MMW Sep 97.** 
Generate a list, Lv, of all the variables in C.
FOR each predicate, P, in Lp
 generate all the possible unit clauses that share the same principal functor 
  and arity as P and whose terms are all members of Lv.
revise_theory(min_vert_log).
revise_theory(min_vert_log).
RETURN a list comprising all the possible unit clauses for all the predicates 
 in Lp. 

*/

get_possible_antecedents(H, B, Possible_new_antecedents):-

%% MMW - alteration Sep 1997
%% get_all_predicates(L),
%% replaced by existing list from revisable CPS
%% L currently contains built-in predicates 
  list_of_cps_predicates(L), 
 functor(H, Name_of_predicate, Arity),
 del(pred(Name_of_predicate, Arity), L, L2), 
        % prevents intrduction of recursion

 get_vars_in_clause(H, B, L_vars),
 freeze(L_vars, L_frozen_vars, L_vars, LR),
 remove_dups(LR, L_unique_frozen_vars),

 generate_possible_antecedents(L2, L_unique_frozen_vars, L3),
 thaw(L_vars, L_frozen_vars, L3, L4),

 split_body_into_a_list_of_its_antecedents(B, B_antecedents),
 set_difference(L4, B_antecedents, Possible_new_antecedents).
        % prevents introduction of redundant literals


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% get_all_predicates(List)
%%
%% This generates a list of all the predicates in the current theory
%% i.e. all predicates which occur in the enveloped clauses. Each item in
%% the list takes the form pred(Name_of_Predicate, Arity_of_predicate).
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
get_all_predicates(L).
 L = [pred(male,1),pred(adult,1),pred(child,1),pred(female,1),pred(man,1),pred(true,0)]
*/

get_all_predicates(L):-
 findall(H, clause_impress(H, _, _, _), L1),
 findall(B, clause_impress(_, B, _, _), L2),
 split_bodies_into_their_antecedents(L2, L3),
 append(L1, L3, L4),
 get_predicates_from_literals(L4, L5),
 remove_dups(L5, L).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% get_predicates_from_literals(List_of_antecedents, List_of_predicates)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
get_predicates_from_literals([man(X), male(chris), female(X), adult(X), child(X), a(a,b), c], Result).
Result =  [pred(man, 1), pred(male, 1), pred(female, 1), pred(adult, 1), pred(child, 1), pred(a, 2), pred(c, 0)]
*/

get_predicates_from_literals([], []).

get_predicates_from_literals([H|T], [pred(Name_of_predicate, Arity) | T_fs]):-
 functor(H, Name_of_predicate, Arity),
 get_predicates_from_literals(T, T_fs).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% split_bodies_into_their_antecedents(L, A)
%%
%% where 
%% L is a list of the bodies of some clauses
%% A is a list of the antecedents in those bodies
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
split_bodies_into_their_antecedents([(b(B),c(C,C2);d(D)), (e(E),f(F))], Answer).*/ 

split_bodies_into_their_antecedents([], []).

split_bodies_into_their_antecedents([H|T], Antecedents):-
 split_body_into_a_list_of_its_antecedents(H, H_antecedents),
 split_bodies_into_their_antecedents(T, T_antecedents),
 append(H_antecedents, T_antecedents, Antecedents).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% split_body_into_a_list_of_its_antecedents(Body, Antecedents)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
split_body_into_a_list_of_its_antecedents((b(B),c(C,C2);d(D)), Antecedents).
Antecedents = [b(B),c(C,C2),d(D)] 
*/

split_body_into_a_list_of_its_antecedents(Body, Result):-
 Body =.. [';', X, Y],
 split_body_into_a_list_of_its_antecedents(X, X_result),
 split_body_into_a_list_of_its_antecedents(Y, Y_result),
 append(X_result, Y_result, Result).

split_body_into_a_list_of_its_antecedents(Body, Result):-
 \+ Body =.. [';', X, Y],
 Body =.. [',', X, Y],
 split_body_into_a_list_of_its_antecedents(X, X_result),
 split_body_into_a_list_of_its_antecedents(Y, Y_result),
 append(X_result, Y_result, Result).

/* If we do NOT want antecedents whose predicates are built-in to be
added to clauses then the code which is currently commented out must
be made executable. */

/*
 split_body_into_a_list_of_its_antecedents(Body, []):-
 \+ Body =.. [';', X, Y],
 \+ Body =.. [',', X, Y],
 built_in(Body).
*/

split_body_into_a_list_of_its_antecedents(Body, [Body]):- 
 \+ Body =.. [';', X, Y],
 \+ Body =.. [',', X, Y].
/* \+ built_in(Body).*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  get_vars_in_clause(Head, Body, L_variabless)
%%
%% This returns a list, L_variables, whose items are the variables in
%% the clause.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
get_vars_in_clause(a(A), (b(B),c(C,C2);d(D)), L_vars).
get_vars_in_clause(a(A), (b(B), c(C1, C2), d(D); e(E)), L_vars). 
*/

get_vars_in_clause(H, B, L_vars):-
 split_body_into_a_list_of_its_antecedents(B, L),
 append([H], L, L2),
 get_terms_from_literals(L2, L3),
 remove_non_vars(L3, L_vars).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% get_terms_from_literals(Literals, Terms)
%%
%% This returns a list of terms, Terms, whose items are the terms of
%% the literals in the list, Literals.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
get_terms_from_literals( [a(A), b(B),c(C,C2),d(D), e(f), g(h,i)], Terms).
Terms = [A,B,C,C2,D,f,h,i]
*/

get_terms_from_literals([], []).

get_terms_from_literals([H | T], T_final):-
 H =.. [_ | Terms],
 get_terms_from_literals(T, T_result),
 append(Terms, T_result, T_final).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% remove_non_vars(List, List_of_variables)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
remove_non_vars([A,B,C,C2,D,f,h,i], Answer).
Answer = [A,B,C,C2,D]
*/

/** NB  (MMW) This predicate also removes terms of the form f(A,B)
test with
remove_non_vars([A,B,C,C2,D, f(X), h(Z),i], Ans).

Ans = [A,B,C,C2,D] ? 

**/
remove_non_vars([], []).

remove_non_vars([H | T], T_result):-
 nonvar(H),
 remove_non_vars(T, T_result).

remove_non_vars([H | T], [H | T_result]):-
 var(H),
 remove_non_vars(T, T_result).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% generate_possible_antecedents(L, Terms, L_antecedents)
%%
%% L is a list of whose items are facts of the form 
%%   pred(Name_of_predicate, Arity_of_predicate)
%% Terms is a list of terms, none of which are variables.
%% L_antecedents is a list of possible antecedents.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
generate_possible_antecedents([pred(a, 2), pred(b, 3), pred(c, 0)], [x, y, z], Antecedents).
generate_possible_antecedents([pred(man, 1)], ['X'], Antecedents).
*/

generate_possible_antecedents([], _, []).

generate_possible_antecedents(
 [pred(Name, Arity) | T], 
 Terms, 
 Antecedents
 ):-
 findall(
  Predicate, 
  generate_antecedent(pred(Name, Arity), Terms, Predicate),
  H_antecedents),
 generate_possible_antecedents(T, Terms, T_antecedents),
 append(H_antecedents, T_antecedents, Antecedents).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% generate_antecedent(P, Terms, Antecedent)
%%
%% P is a fact of the form pred(Name_of_predicate, Arity_of_predicate)
%% Terms is a list of terms, none of which are variables.
%%
%% Antecedent is gound instantiation of the predicate i.e.
%% a ground unit clause whose predicate name and arity are 
%% Name_of_predicate and Arity_of_predicate respectively and whose
%% terms belong to the list Terms.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
generate_antecedent(pred(a, 2), [b, c, d], Predicate).
findall(Predicate, generate_antecedent(pred(a, 2), [b, c, d], Predicate), Answer). 
*/

:- use_module(library(lists)).
/* The predicates sublist, length and permutation are in the SICSTUS library lists. */

generate_antecedent(pred(Name, Arity), Terms, Predicate):-
 sublist(S, Terms),
 length(S, Arity),
 permutation(S, Perm),
 Predicate =.. [Name | Perm].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% award_score_to_each_antecedent(H, B, ID, SS,
%%                                List_of_antecedents_already_chosen, 
%%                                Score_for_antecedents_already_chosen,
%%                                Possible_new_antecedents,
%%                                Possible_new_antecedents_and_scores)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

award_score_to_each_antecedent(_, _, _, _, _, _, [], []).

award_score_to_each_antecedent(
 H, B, ID, SS,
 List_of_antecedents_already_chosen, 
 Score_for_antecedents_already_chosen,
 [Current_antecedent | Tail_antecedents],
 [antecedent(Current_antecedent, Score_of_current_antecedent) | Tail_results]
 ):-
 append([Current_antecedent], List_of_antecedents_already_chosen, L),
 add_antecedents_to_body(L, B, NewB),
 get_score(revision(substitute,
                    clause_impress(H, NewB, ID, SS),
                    Score_for_current_and_already_chosen_antecedents),
           Score_for_current_and_already_chosen_antecedents),
 Score_of_current_antecedent is
  Score_for_current_and_already_chosen_antecedents -
  Score_for_antecedents_already_chosen,
 award_score_to_each_antecedent(H, B, ID, SS,
                                List_of_antecedents_already_chosen, 
                                Score_for_antecedents_already_chosen,
                                Tail_antecedents,
                                Tail_results).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% add_antecedents_to_body(List_of_antecedents,
%%                         Body_of_clause,
%%                         New_body_of_clause)
%%
%% where New_body_of_clause is the same as Body_of_clause except that
%% it has the additional antecedents given in the list.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
add_antecedents_to_body([adult(X)], (male(X)), (male(X), adult(X))).
add_antecedents_to_body([d(D),e(E)], (a(A),b(B),c(C)), (a(A),b(B),c(C),d(D),e(E))).
*/

add_antecedents_to_body([], B, B).

add_antecedents_to_body([H|T], Body, Result):-
 add_one_antecedent(H, Body, New_body),
 add_antecedents_to_body(T, New_body, Result).
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% add_one_antecedent(Antecedent, Body_of_clause, New_body_of_clause)
%%
%% This uses the distribution law when adding an antecedent to a 
%% clause containing a disjunction e.g. (b V c) ^ d = (b^d) V (c^d).
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* test with
add_one_antecedent(adult(chris),(male(chris)), (male(chris),adult(chris))).
add_one_antecedent(d(D),(a(A),b(B),c(C)), (a(A),b(B),c(C),d(D))).
add_one_antecedent(d(D),(a(A),b(B);c(C)), (a(A),b(B),d(D);c(C),d(D))).
add_one_antecedent(d(D),(a(A);b(B);c(C)), (a(A),d(D);b(B),d(D);c(C),d(D))).
*/

add_one_antecedent(New_antecedent, Body, New_body):-
 Body =.. [';',X,Y],
 add_one_antecedent(New_antecedent, X, X_and_ante),
 add_one_antecedent(New_antecedent, Y, Z_and_ante),
 New_body =.. [';', X_and_ante, Z_and_ante].

add_one_antecedent(New_antecedent, Body, New_body):-
 \+ Body =.. [';',X,Y],
 Body =.. [',',X,Y],
 add_one_antecedent(New_antecedent, Y, Z),
 New_body =.. [',',X, Z].

add_one_antecedent(New_antecedent, Body, New_body):-
 \+ Body =.. [';',X,Y],
 \+ Body =.. [',',X,Y],
 New_body =.. [',', Body, New_antecedent].


