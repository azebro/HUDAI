
/* This file will contain the code for 

- Calculating the accuracy of a theory.
- Getting the coverage and exclusion of a theory.
- Calculating the size of a theory. (NOT implemented yet)

The code assumes there are only two classes of instances, namely true
and fail.

Accuracy is the number of correct classifications expressed as a
percentage.

TLM 2/99 - the code looks very slow! UPDATES TO SPEED IT UP.. 
i.e. compare classifications..

*/

/*************************************************************/

get_accuracy(Accuracy):-
 findall(instance_of_concept(X, Y), instance_of_concept(X, Y), List_of_instances),
 compare_classifications(List_of_instances, TP, FP, TN, FN),
 calculate_accuracy(TP, FP, TN, FN, Accuracy).

/*************************************************************/

/* calculate_accuracy inputs TP, FP, TN, FN which are lists of
instances 

Test with

calculate_accuracy([man(chris),man(tom)], [man(harry)], [man(margaret), man(jane)], [], Accuracy).

*/

calculate_accuracy(TP, FP, TN, FN, A):-
 list_length(TP, N_tp),
 list_length(FP, N_fp),
 list_length(TN, N_tn),
 list_length(FN, N_fn),
 A is (((N_tp + N_tn) / (((N_tp + N_fp) + N_tn) + N_fn)) * 100),!.

/*************************************************************/

get_coverage(TP, FP, Coverage):- append(TP, FP, Coverage).

get_exclusion(TN, FN, Exclusion):- append(TN, FN, Exclusion).

/*************************************************************/

/* get_actual_classification(X, Class) */

get_actual_classification(X, true):- call(X),!.
get_actual_classification(X, fail):- !.

% old.
% get_actual_classification(X, true):- call(X).
% get_actual_classification(X, fail):- \+ (call(X)).

/*************************************************************/

/* compare_classifications(List_of_instances, TP, FP, TN, FN)

where List_of_instances is a list whose elements take the form 

instance_of_concept(ground_unit_clause, expected_classification) 

It implements the following algorithm.

For each instance:
 get actual classification by program
 compare expected and actual classification
 add instance to either TP, FP, TN, FN

Test with

compare_classifications(
 [instance_of_concept(man(chris), true), 
  instance_of_concept(man(tom), true), 
  instance_of_concept(man(harry), fail), 
  instance_of_concept(man(jane), fail), 
  instance_of_concept(man(margaret), fail)
 ], 
 TP, FP, TN, FN).

*/

compare_classifications([], [], [], [], []) :- !.

compare_classifications([instance_of_concept(X, TF_E) | Tail], TP, FP, TN, FN):-
  get_actual_classification(X, TF_A),
  if_then( (TF_E = true, TF_A = true), 
           (TP = [X|TP_tail], FP = FP_tail, TN = TN_tail, FN =FN_tail ) 
         ),
  if_then( (TF_E = fail, TF_A = true), 
           (TP = TP_tail, FP = [X|FP_tail], TN = TN_tail, FN = FN_tail) 
         ),
  if_then( (TF_E = fail, TF_A = fail), 
           (TP = TP_tail, FP = FP_tail, TN = [X|TN_tail], FN = FN_tail) 
         ),
  if_then( (TF_E = true, TF_A = fail), 
           (TP = TP_tail, FP = FP_tail, TN = TN_tail, FN = [X|FN_tail]) 
         ),
  compare_classifications(Tail, TP_tail,FP_tail,TN_tail,FN_tail),!.


% compare_classifications([instance_of_concept(X, true) | Tail], [X|TP_tail], FP, TN, FN):-
%  get_actual_classification(X, true),
%  compare_classifications(Tail, TP_tail, FP, TN, FN),!.

% compare_classifications([instance_of_concept(X, fail) | Tail], TP, [X|FP_tail], TN, FN):-
%  get_actual_classification(X, true),
%  compare_classifications(Tail, TP, FP_tail, TN, FN),!.

% compare_classifications([instance_of_concept(X, fail) | Tail], TP, FP, [X|TN_tail], FN):-
%  get_actual_classification(X, fail),
%  compare_classifications(Tail, TP, FP, TN_tail, FN),!.

% compare_classifications([instance_of_concept(X, true) | Tail], TP, FP, TN, [X|FN_tail]):-
%  get_actual_classification(X, fail),
%  compare_classifications(Tail, TP, FP, TN, FN_tail),!.



