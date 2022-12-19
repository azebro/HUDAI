%%:- use_module(library(lists)).
:- dynamic base/0.

:- dynamic limitvalF/2, limitval/2, limitbodsF/2, limitbods/2, flag_for_revision/0, limits_counter/1.

:- dynamic is_greater/2, is_less/2, is_greater_eq/2, is_less_eq/2.
:- dynamic old_FN_count/1.

/* code for revising upper and lower limits for vars */
/* Jan 1999 - now simple and comp. TR combined into 
   general hill climbing algorith */

/* log file omitted for now */
%% new accuracy not calculated -- problems with code



/************* DESIGN OF MAIN TR FN **********/
/*

LOOP of 2.7 in journal paper:
2.7  REPEAT
2.7.1   remove the first clause F from list RP' and retrieve trace of F;
2.7.2   Use the trace information to
        (a) evaluate ordinal parameter changes via the creation of new regions
        (b) evaluate ordinal operator changes via the replacement of
            existing operators with others of the same sort
2.7.3   award a score to each revision, where score is the resulting
        accuracy of F using the trace information;
2.7.4   record best revision found so far (Rmax) with its accuracy score Smax
2.7  UNTIL no revisions are left OR potential maximum score of
        of a revision to the next revision point < Smax;

IMPLEMENTATION:

 *** label_ex_gen_tr( INS: Clauses_involving_limits,Old_Acc, .., False_exs,TP),
         OUT: LR1

LR1 = list of rule(Gen_head,Revis_body,Gen_body,New_Acc,change_region)

FOR EACH F:

   labels body (not quite same as journal paper which says do this first -
the ordinal variable lists would have to be stored, as would the data
on all the Fs - tricky)
   gets ordinal variable list from F
   EXECUTE theory on TPs - get data on use of F
   EXECUTE theory on FPs - get data on use of F

   CALL gen_clause_and_Acc to get new clause and accuracy


 *** gen_clause_and_Acc( INS: Gen_head,Labelled_body2,Gen_body,
                            N (no. pf ord vars),Listvar2,Clause_ID_no,
                       OUT: Revis_body,New_Acc)

   CALL gen_clause  ..  get Revis_body

 *** gen_clause(INS: Gen_head,  Labelled_body, ith, N, Listvar
                OUT: Revis_body)

This looks at the ith of the N ordinal operator literals in F and tries 
to find a revision that makes each op succeed on TPs but not on FPs. 

It acculmulates these changes into a Revis_body.

*** What we need is a procedure which tries out every change (both new
*** region AND new operator) and notes the score using only the
*** trace info. It then picks the change with the highest score.

*** Only problem is I'm not sure the RVSM rule would have been 
*** discovered using this algorithm...????
   



*/
startTR :-

   cf_spec_executable_file(A1),
   cf_spec_exec_enveloped_file(A2),
   cf_theory_refinement_TR_oracle(A3),
   cf_tests_executable_file(A4),
   cf_enveloped_tests_file(A5),
   cf_tr_trace(XFX),tell(XFX),nl, 
   write('executable_file= '),write(A1),nl,
   write('enveloped_executable= '),write(A2),nl,
   write('oracle= '),write(A3),nl,
   write('tests_executable= '),write(A4),nl,
   write('tests_enveloped= '),write(A5),nl,
   tell(user),

    hill_ClimbingFP(1),!.

startTR :- nl,nl,write('TR failed'),nl,nl.

/*******************************************************/

hill_ClimbingFP(0) :- write(' finished TR '),nl,cf_tr_trace(XFX),tell(XFX),told,!.

hill_ClimbingFP(5) :- write(' finished TR '),nl,cf_tr_trace(XFX),tell(XFX),told,!. % CUT OFF !

hill_ClimbingFP(Counter) :-

%%% Classify Examples

       findall(instance_of_concept(GUC, Class),
               instance_of_concept(GUC, Class),
               List_of_instances),

if_then(Counter=1, check_oracle_env_defined(List_of_instances)),

nl,write('compare- entry at start of hill climbing'),nl,
   compare_classifications(List_of_instances, TP, FP, TN, FN),

nl,write('compare- exit at start of hill climbing'),nl,

    list_length(FN, FN_len), 
    if_then(Counter = 1, assert(old_FN_count(FN_len))), 

%   calculate_acc_SAFE(TP, FP, TN, FN, Old_Acc),
   calculate_accuracy(TP, FP, TN, FN, Old_Acc),


   list_length(FP, FP_len   ),
   list_length(TN, TN_len   ), list_length(TP, TP_len   ),
   cf_tr_trace(XFX),tell(XFX),
   nl,  write('NO of False Positive: '),write(FP_len),nl, nl,  
    write('NO of False Negative: '),write(FN_len),nl,
   nl,  write('NO of True Positive: '),write(TP_len),nl, nl,  
    write('NO of True Negative: '),write(TN_len),nl,
   tell(user),
   nl,  write('NO of Falsely Positive: '),write(FP_len),nl, nl,  
    write('NO of Falsely Negative: '),write(FN_len),nl,
   nl,  write('NO of Truely Positive: '),write(TP_len),nl, nl,  
    write('NO of Truely Negative: '),write(TN_len),nl,
 
    cf_tr_trace(XFX),tell(XFX), 
    nl,nl,write(Counter),write(' **NEW LEVEL** '),write(Old_Acc),nl,nl,
    tell(user),
    nl,nl,write(Counter),write(' **NEW LEVEL** '),write(Old_Acc),nl,nl,

   retract(old_FN_count(_)),
   assert(old_FN_count(FN_len)),

   hill_ClimbingFP_next(Counter,TP, FP, TN, FN, Old_Acc),!.

/**********************************************************/

hill_ClimbingFP_next(Counter,TP, False_exs, TN, FN, Old_Acc) :-
   False_exs = [],
   nl,
   write('*** no false positives to work from ***'),!.


hill_ClimbingFP_next(Counter,TP, False_exs, TN, FN, Old_Acc) :-

% put -1 and it will call blame as normal..
if_then_else(Counter =  -1,

  FP_blame_assignment =

% blame for 1997 RVSM
% see trace26_97
% blame for original RVSM
 [potential(-85,95),potential(-76,95),potential(-32,95),potential(-31,95),potential(-30,95),potential(-29,95),potential(1,95),potential(2,95),potential(3,95),potential(4,95),potential(5,95),potential(6,95),potential(7,95),potential(8,92),potential(9,3),
 potential(10,92),potential(11,92),potential(12,76),potential(13,16),potential(14,14),potential(15,78),potential(16,95),potential(17,1),potential(18,5),potential(19,95),
 potential(20,93),potential(21,2),potential(22,3),potential(23,2),potential(26,84),potential(27,94),potential(28,1),potential(29,5),potential(35,95),potential(38,95),potential(41,46),potential(42,1),potential(43,1),potential(44,3),potential(47,22),potential(48,51),potential(53,22),potential(57,51),potential(61,1),potential(62,83),
 potential(65,73),potential(66,83),potential(67,1),potential(70,73),potential(71,94),potential(72,1),potential(75,95),potential(77,73),potential(82,92),potential(83,37),potential(84,47),potential(85,5),potential(86,92),potential(87,95),potential(89,1),
 potential(98,1),potential(101,46),potential(102,50),potential(103,1),potential(104,5),potential(107,50),potential(108,1),potential(109,50),potential(110,51),potential(111,50),potential(112,1)],
 
 blame_assign_f_pos(False_exs, FP_blame_assignment) ),

   nl, write(FP_blame_assignment),nl,
cf_tr_trace(XFX),tell(XFX),nl, write(FP_blame_assignment),nl,tell(user),
   split_rules(FP_blame_assignment,Pos_ID, Neg_ID),
   nl, write(Neg_ID),
   nl, write(Pos_ID),
   nl,

% NB these findalls may have terrific side effects - the 
% clause_involves_limits changes the representation of
% those clauses containing implicit limits by expanding them
% out!

   findall(Clause_ID_no,
          (member(Clause_ID_no,Neg_ID),
           clause_involves_limits(Clause_ID_no)),
              List_of_neg_clauses_involving_limits1),
   remove_dups(List_of_neg_clauses_involving_limits1,
                  List_of_neg_clauses_involving_limits),
   cf_tr_trace(XFX),tell(XFX),nl,
   write('these are negative clauses involving limits:'), nl,
   write( List_of_neg_clauses_involving_limits),nl, 
   tell(user),nl,
   write('these are negative clauses involving limits:'), nl,
   write( List_of_neg_clauses_involving_limits),nl, 


   findall(Clause_ID_no,
          (member(Clause_ID_no,Pos_ID),
           clause_involves_limits(Clause_ID_no)),
              List_of_pos_clauses_involving_limits1),
     remove_dups(List_of_pos_clauses_involving_limits1,
                  List_of_pos_clauses_involving_limits),
   cf_tr_trace(XFX),tell(XFX),nl,
   write('these are positive clauses involving limits:'), nl,
   write( List_of_pos_clauses_involving_limits),nl, nl,
   write('First the negative clauses then the positive clauses will be revised'),nl,
   tell(user),nl,
   write('these are positive clauses involving limits:'), nl,
   write( List_of_pos_clauses_involving_limits),nl, nl,
   write('First the negative clauses then the positive clauses will be revised'),nl,

%%% weed out any clauses not declared revisable
% defn in tools/utilities.pl

   weed_out_unrevisable(List_of_pos_clauses_involving_limits,Lpcl),
   weed_out_unrevisable(List_of_neg_clauses_involving_limits,Lncl),

   cf_tr_trace(XFX),tell(XFX),nl,
   write('these are the REVISABLE positive clauses involving limits:'), nl,
   write( Lpcl),nl, nl,
   write('these are the REVISABLE negative clauses involving limits:'), nl,
   write( Lncl),nl, nl,
   tell(user),nl,
   nl,write( Lpcl),nl,write( Lncl),nl,

%%% Theory Revision Round

%%% call Composite Revisions..

cf_tr_trace(XFX),tell(XFX),nl,write('STARTING THEORY REVISION'),nl,tell(user),
nl,write('STARTING THEORY REVISION'),nl,

 append(Lpcl, Lncl, Clauses_involving_limits),

  label_ex_gen_tr(Clauses_involving_limits,Old_Acc, LR1, False_exs,TP),

%   if_then_else(cf_REVISION_operator(restrict_region),
%      label_ex_gen_tr(Clauses_involving_limits, LR1, False_exs,TP),
%      LR1 = [ ]),!,
%
% cf_tr_trace(XFX),tell(XFX),nl,write('STARTING SIMPLE '),nl,tell(user),
% nl,write('STARTING SIMPLE TR'),nl,
% 
%    % if_then_else(cf_REVISION_operator(reverse_all_conditions),
%       simple_tr_reverse(Clauses_involving_limits, LR2),
%       LR2 = [ ]),!,
% 
%    if_then_else(cf_REVISION_operator(drop_each_condition),
%       simple_tr_drop(Clauses_involving_limits, LR4),
%       LR4 = [ ]),!,

%     append(LR1,LR2,LR3),
%     append(LR3,LR4,LR),
   
     LR = LR1,

%%% Implement Best Revision if its better than old..

%   get_the_best_one 
    max_pos_in_list(LR, 0, 0, 0, Pos),
    get_arg_pos(LR,Pos,REV),

nl,write('IMPLEMENT BEST REV '),nl,

    REV = rule(_,_,_,ACC,TYPE),

    implement_best_one(Old_Acc,ACC,REV,Counter),

       nl,write('New Acc: '),write(ACC),nl,
       write('Old Acc: '),write(Old_Acc),nl,

       nl,write('BEST Revision is a '), write(TYPE),nl,
       cf_tr_trace(XFX),tell(XFX),nl,write('Revision is a '), 
       write(TYPE),nl,tell(user),

    if_then_else( (ACC =< Old_Acc ; ACC = 100.0) ,
                  Counter1 is 0,
                  Counter1 is Counter + 1), 

    hill_ClimbingFP(Counter1),!.

hill_ClimbingFP(_) :- cf_tr_trace(XFX),tell(XFX),told,nl,nl,
                      write('HC FAILED *******'),nl,!.
%%%%%%%%%%%%%%%%%%

implement_best_one(Old_Acc,Best_acc,_,_) :-
    Old_Acc >= Best_acc,!.
    
implement_best_one(Old_Acc,Best_acc,
               rule(Head,New_body,Old_body,_,_),Counter) :-
    Clause_No is 1000000 + Counter,
    assert(clause_impress(Head,New_body, Clause_No, unshielded)),

% hmmmm should this be in?

%    retract(clause_impress(Head,Old_body,_,unshielded)),
    retract( ( Head :- Old_body) ),
    asserta( ( Head :- New_body) ),
    !.

% call with max_pos_in_list(L, 0, 0, 0, Final_Pos)

max_pos_in_list([],_,_,0,1) :-!.
max_pos_in_list([],_,_,Pos,Pos) :- !.

max_pos_in_list([rule(_ ,_,_,H,_)|T],Counter,Current,Pos, Final_Pos) :-
        Counter1 is Counter + 1,
        H > Current,
        Current1 is H,
        Pos1 is Counter1,
        max_pos_in_list(T,Counter1,Current1,Pos1, Final_Pos),!.
max_pos_in_list([H|T],Counter,Current,Pos, Final_Pos) :-
        Counter1 is Counter + 1,
        max_pos_in_list(T,Counter1,Current,Pos, Final_Pos),!.

% get_arg_pos: [a,s,d,f] * 3 --> d
%  --------------------------------
get_arg_pos(Args,Pos,A) :-
        get_arg_pos(Args,Pos,1,_,A) .
 
get_arg_pos([A|_],P,P,_,A) .
get_arg_pos([_|B],P,P1,P3,A) :-
        P2 is P1+1 ,
        get_arg_pos(B,P,P2,P3,A) .
 

/********************************************************/
/********************************************************/

/* This code implements all the theory revision operators,
   finding ones for each each revision point(clause)    */

/************** new COMPOSITE code ***********************/

label_ex_gen_tr([], _,[],_, _) :- !. 


label_ex_gen_tr( [Clause_ID_no|T], Old_Acc,
         [rule(Gen_head,Revis_body,Gen_body,New_Acc,Mode)| R], FP, TP):- 

     clause_impress(Gen_head, Gen_body, Clause_ID_no, unshielded),
     Gen_head =.. [Name|_],

          nl, write('Revising Rule '), write(Clause_ID_no),nl,
          nl, write(' Rule before revision: '), nl,
%          nl, write(Gen_head), nl,
%           nl, write(Name), nl,
          listing(Name),nl,nl,
          cf_tr_trace(XFX),tell(XFX),
          nl, write('Revising Rule '), write(Clause_ID_no),nl,
          nl, write('Original Rule: '), nl,
%          nl, write(Gen_head), nl,
%          nl, write(Name), nl,
          listing(Name),nl,nl,
          tell(user),
   add_label_after_each_limit_av(limitvar(0), Gen_body, 
          Labelled_body1, limitvar(N), [],Bodies,[], Listvar1),
   N1 is N+1,
        
%% removes duplicate variables 
    remove_dups_vars(Listvar1, Listvar2),


%% these two procs add 'asserts' on to the faulty clause

   add_label_for_write_vars( Labelled_body1, Labelled_body2, Bodies,
                                                      Listvar2,1, N1 ),
   replace_old_body(Gen_head, Gen_body, Labelled_body2),

%          nl, write(Labelled_body2),nl,
%          cf_tr_trace(XFX),tell(XFX), nl, write(Labelled_body2),nl,
          tell(user),

%%%%%      RUN ALL TESTS TO PRINT  OUT TRACES

   run_all_TP_FP(TP,FP),
              
%%%%%
% Now values of FP/TPs are known, try to change ordinal ops

  gen_clause_and_Acc(Gen_head,Labelled_body2,Gen_body,N,Listvar2,Clause_ID_no,  
                  Revis_body1,New_Acc1,TP,FP),
  
% put original body back..
%% for comp only % replace_old_body(Gen_head, Revis_body1,  Gen_body),

% put labelled body back there
% replace_old_body(Gen_head, Revis_body1, Labelled_body2),
replace_old_body(Gen_head, Revis_body1,  Gen_body),

  new_simple(Gen_head,Labelled_body2,Gen_body,N,Listvar2,Clause_ID_no,  
                  Revis_body2,New_Acc2),

% put original body back..
    replace_old_body(Gen_head, Revis_body2,  Gen_body),

  if_then_else( New_Acc1 > New_Acc2,
                (New_Acc = New_Acc1, Revis_body1 = Revis_body, Mode = change_region), 
                (New_Acc = New_Acc2, Revis_body2 = Revis_body,Mode = change_predicate )  ),
 
%% for change_region only % New_Acc = New_Acc1, Revis_body1 = Revis_body,

    cf_tr_trace(XFX),tell(XFX),
    nl,write('%%%%%%%'), write('Accuracy using change region = '), write(New_Acc1),nl,
    nl,write('%%%%%%%'), write('Accuracy using change predicate = '), write(New_Acc2),nl,
    nl,write('%%%%%%%'), write('Mode = '), write(Mode),nl,
    tell(user),


  label_ex_gen_tr( T, Old_Acc, R, FP, TP),!.

label_ex_gen_tr(_,_,_,_, _) :- 
        cf_tr_trace(XFX),tell(XFX),
    nl,write('((((((((( WARNING label_ex_gen_tr FAILED)))))))))'),nl,
    tell(user),
    nl,write('((((((((( WARNING label_ex_gen_tr FAILED)))))))))'),nl,!.


/***************************************/

run_all_TP_FP(TP,FP) :-

% first get rid of any existing traces
     retractall(limitval(_,_)),
     retractall(limitvalF(_,_)),
     retractall(limitbods(_,_)),
     retractall(limitbodsF(_,_)),

% cf_tr_trace(XFX),tell(XFX),nl,
%              nl,write('xxxx running FP then TP sets xxxx'),nl,tell(user),
% nl,write('test_set call within label_ex_gen_tr '),nl,
     test_set(FP),        
     convert_limitval_limitvalF,
     test_set(TP),        
% nl,write('test_set exit within label_ex_gen_tr '),nl,


% NB HUGE AMOUNT OF LIMITS FOR REAL TR..
%               write_out_Flimitval,
%              write_out_limitval,

% NB SINCE WE DON'T USE WE'll just get rid of them for now..

%     retractall(limitbods(_,_)),
     retractall(limitbodsF(_,_)),!.
/***************************************/

convert_limitval_limitvalF :-
    retract(limitval(X,Y)),
    assert(limitvalF(X,Y)),
    convert_limitval_limitvalF,!.
convert_limitval_limitvalF :-
    retract(limitbods(X,Y)),
    assert(limitbodsF(X,Y)),
    convert_limitval_limitvalF,!.
convert_limitval_limitvalF.
write_out_limitval :-
    limitval(X,Y),
    cf_tr_trace(XFX),tell(XFX),
    nl,write(limitval(X,Y)),
    tell(user),
    fail.
write_out_limitval :-
    limitbods(X,Y),
    cf_tr_trace(XFX),tell(XFX),
    nl,write(limitbods(X,Y)),
    tell(user),
    fail.
write_out_limitval.
write_out_Flimitval :-
    limitvalF(X,Y),
    cf_tr_trace(XFX),tell(XFX),
    nl,write(limitvalF(X,Y)),
    tell(user),
    fail.
write_out_Flimitval :-
    limitbodsF(X,Y),
    cf_tr_trace(XFX),tell(XFX),
    nl,write(limitbodsF(X,Y)),
    tell(user),
    fail.
write_out_Flimitval.


/*********************************************************************/
/***** for each clause find a possible operator replacement ***********/

new_simple(Gen_head,Labelled_body2,Gen_body,N,Listvar2,Clause_ID_no,   
                  Revis_body,New_Acc) :- 
   
% find operator refinement if poss...

   change_operator(Clause_ID_no, Gen_head, Revis_body, Gen_body),

% temp. replace original rule..

   replace_old_body(Gen_head, Gen_body, Revis_body),


   new_simple2(Gen_head,Labelled_body2,Gen_body,N,Listvar2,
            Clause_ID_no,       Revis_body,New_Acc). 


new_simple2(Gen_head,Labelled_body2,Gen_body,N,Listvar2,
            Clause_ID_no,       Revis_body,New_Acc) :- 


  Gen_head =.. [Name|_],
  assert(clause_impress(Gen_head,Revis_body, 1000000, unshielded)),

  findall(instance_of_concept(GUC, Class),
         instance_of_concept(GUC, Class),
          List_of_instances1),

 remove_dups(List_of_instances1, List_of_instances),
nl,write('compare- entry after new simple revision'),nl,
 compare_classifications(List_of_instances, New_TP, New_FP, New_TN, New_FN),
nl,write('compare- exit after new simple revision'),nl,

  calculate_accuracy(New_TP, New_FP, New_TN, New_FN, New_Acc),
% calculate_acc_SAFE(New_TP, New_FP, New_TN, New_FN, New_Acc),

% record
    cf_tr_trace(XFX),tell(XFX),
    write('Rule '),nl,write(Clause_ID_no),
    write(' has been changed using CHANGE PREDICATE operator'),nl,
    write(' accuracy is  '), write(New_Acc), write(' per cent'), nl, 
    list_length(New_FN, FN_len   ), list_length(New_FP, FP_len   ),
    list_length(New_TN, TN_len   ), list_length(New_TP, TP_len   ),
    write('FP_len: '), write(FP_len), write(' FN_len: '),
    write(FN_len),nl,  write('TP_len: '),
    write(TP_len),  write(' TN_len: '), write(TN_len),nl,
    nl, write(' NEW RULE IS '),nl,
    nl,listing(Name),nl,nl,
    tell(user),

    retract(clause_impress(Gen_head,Revis_body, 1000000, unshielded)),!.

new_simple2(Gen_head,_,Gen_body,_,_,_, Revis_body,0) :- !.

/***************************************/
/***************************************/

% change_operator(Clause_ID_no, Gen_head, New_body, Gen_body ) :-
%        clause_impress(Gen_head, Gen_body, Clause_ID_no, unshielded),
change_operator(_, Gen_head, New_body, Gen_body ) :-
        assert(limits_counter(1)),
         copy( (Gen_head:-Gen_body), (Copy_head:-Copy_body) ),
         change_op_in_body(Copy_body,New_body),
        retractall(limits_counter(_)),
        Gen_head = Copy_head.
 
change_op_in_body(Body,New_body) :-
    Body =.. [',', X, Y],
    change_op_in_body(X,N_X),
    change_op_in_body(Y,N_Y),
    New_body =.. [',',N_X, N_Y],!.
 
change_op_in_body(Body,New_body) :-
    Body =.. [';', X, Y],
    change_op_in_body(X,N_X),
    change_op_in_body(Y,N_Y),
    New_body =.. [';',N_X, N_Y],!.
 
change_op_in_body(Body,New_body) :-
  \+ Body =.. [',', X, Y],
  \+ Body =.. [';', X, Y],
    Body =.. [Name_ante, A, B],
    limits_clause(Name_ante),

    retract(limits_counter(N)),
    N1 is N+1,
    assert(limits_counter(N1)),
    setof(BodX, limitbods(_,BodX), Bods),

    is_in_same_sort(List_names),
    member(Name_ante,List_names),
    member(New_name,List_names),
 \+ Name_ante = New_name,

    try_out_New_name_with_TPs(Name_ante,New_name,N,Bods),
    New_body =.. [New_name, A,B],!.

change_op_in_body(Body,Body) :-
  \+ Body =.. [',', X, Y],
  \+ Body =.. [';', X, Y], !.


% ths only succeeds if all non-var TP bods succeed
try_out_New_name_with_TPs(_,_,_,[]) :-!.
try_out_New_name_with_TPs(OldN,NewN,N,[Bod|R]) :-
    reverse(Bod,List1),
    nth(N,List1,Nth),
    Nth =.. [OldN, C1, C2],
    var_in_list([OldN, C1, C2]),
    try_out_New_name_with_TPs(OldN,NewN,N,R),!.
try_out_New_name_with_TPs(OldN,NewN,N,[Bod|R]) :-
    reverse(Bod,List1),
    nth(N,List1,Nth),
    Nth =.. [OldN, C1, C2],
    New_instance =.. [NewN, C1,C2],
    call(New_instance),
    try_out_New_name_with_TPs(OldN,NewN,N,R),!.




is_in_same_sort([is_at_or_above,is_at_or_below,is_above,is_below,=, # ]).
is_in_same_sort([is_north_of, is_at_or_north_of, is_south_of, is_at_or_south_of,=,#]).
is_in_same_sort([is_west_of,is_east_of,is_at_or_west_of,=,#]).
is_in_same_sort([is_at_or_later_than, is_earlier_than, is_at_or_earlier_than, =,#]).
is_in_same_sort([>,<,=<,>=,=, # ]).


/*********************************************************************/
/***** for each clause find a region if poss.. ***********/

 gen_clause_and_Acc(Gen_head,Labelled_body2,Gen_body,N,Listvar2,Clause_ID_no,   
                  Clean_body,New_Acc,TP,FP) :- 
   
% find region if poss...

   gen_clause( Gen_head,  Labelled_body2, 
                             Revis_body, 1, N, Listvar2,TP,FP),

   gen_clause_and_Acc2(Gen_head,Labelled_body2,Gen_body,N,Listvar2,
            Clause_ID_no,       Revis_body,Clean_body,New_Acc). 


gen_clause_and_Acc2(Gen_head,Labelled_body2,Gen_body,N,Listvar2,
            Clause_ID_no,       Revis_body,Clean_body,New_Acc) :- 

% fails if no revision found..
    flag_for_revision,
    retractall(flag_for_revision),

  Gen_head =.. [Name|_],
  assert(clause_impress(Gen_head,Revis_body, 1000000, unshielded)),

  findall(instance_of_concept(GUC, Class),
         instance_of_concept(GUC, Class),
          List_of_instances1),

 remove_dups(List_of_instances1, List_of_instances),
nl,write('compare- entry after comp revision'),nl,
 compare_classifications(List_of_instances, New_TP, New_FP, New_TN, New_FN),
nl,write('compare- exit after comp revision'),nl,

calculate_accuracy(New_TP, New_FP, New_TN, New_FN, New_Acc),
% calculate_acc_SAFE(New_TP, New_FP, New_TN, New_FN, New_Acc),

% record
    cf_tr_trace(XFX),tell(XFX),
    nl,write('Rule '),write(Clause_ID_no),
    write(' has been changed using CHANGE REGION operator'),nl,
    write(' accuracy is  '), write(New_Acc), write(' per cent'), nl, 
    list_length(New_FN, FN_len   ), list_length(New_FP, FP_len   ),
    list_length(New_TN, TN_len   ), list_length(New_TP, TP_len   ),
    write('FP_len: '), write(FP_len), write(' FN_len: '),
    write(FN_len),nl,  write('TP_len: '),
    write(TP_len),  write(' TN_len: '), write(TN_len),nl,
    nl, write(' NEW RULE IS '),nl,

    change_every_generic_limits_clause(Revis_body, Clean_body),
    replace_old_body(Gen_head, Revis_body, Clean_body),

    nl,listing(Name),nl,nl,
    tell(user),

    retract(clause_impress(Gen_head,Revis_body, 1000000, unshielded)),!.

gen_clause_and_Acc2(Gen_head,_,Gen_body,_,_,_,_, Revis_body,0) :- !.

/***************************************/
/***************************************/



gen_clause( _,  R, R, _, 0,_,_,_) :- !.

gen_clause( Gen_head,Labelled_body,Revis_body, M, N, Listvar,TP,FP) :-
 
             nl, write(N), nl,    

%     if_then_else(vars_in_list_p_tuples(M),
%
%       (get_List_of_nulls(N, List_of_nulls),  
%        replace_one_label_by_limit_av(M, Labelled_body, Temp_body,
%                            List_of_nulls),
%        N1 is N - 1,  M1 is M + 1,
%        replace_old_body(Gen_head,  Labelled_body, Temp_body ),
%        gen_clause(Gen_head, Temp_body , Revis_body,M1, N1, Listvar,TP,FP)
%       ),
%
%      gen_clause_FOLLOW( Gen_head,Labelled_body, Revis_body, M, N, Listvar,TP,FP)
%      ),!.

  gen_clause_FOLLOW( Gen_head,Labelled_body, Revis_body, M, N, Listvar,TP,FP), !.

% Called only if no vars in the trace record..

gen_clause_FOLLOW( Gen_head,  Labelled_body,
                        Revis_body,  M, N, Listvar,TP,FP) :-        
     list_length(Listvar, NumberVars),
     nl, write(N), nl,  

    find_interval_for_each_N(M,1,NumberVars, ListMaxMinVars),
  
%             write(ListMaxMinVars), nl,
%             cf_tr_trace(XFX),tell(XFX),nl,
%             nl,write('ListMaxMinVars = '),write(ListMaxMinVars),nl,
%             tell(user),

    obtain_antes( Listvar, ListMaxMinVars,  ListMaxMinAntes),
    sift_out_nullvar(ListMaxMinAntes,  ListMaxMinAntes1),
    replace_one_label_by_limit_av(M, Labelled_body, Temp_body, 
                            ListMaxMinAntes1),
   set_flag_if_revision(ListMaxMinAntes1),
   N1 is N - 1,  M1 is M + 1, 
   replace_old_body(Gen_head,  Labelled_body, Temp_body ),!,

% FOR ITERATION THROUGH CLAUSE
%
   if_then(dclause(Labelled_body),

   ( cf_tr_trace(XFX),tell(XFX),nl,
      Gen_head =.. [Name|_],
     listing(Name), tell(user), run_all_TP_FP(TP,FP))
          ),

   gen_clause(Gen_head, Temp_body , Revis_body,
                                  M1, N1, Listvar,TP,FP),!.

/*********************************************/

dclause(L) :-  
    L =.. [';', X, Y],!.
dclause(L) :-  
    L =.. [',', X, Y],
    (dclause(X) ; dclause(X) ),!. 

/**************** TLMc 3/99 new code for finding interval of FP's with most
  contiguous hits!!  *******************************/
% NB this assumes there ARE TPs !!

/***************** some tests

testb :-
         find_interval1([1.0,6.0,8.0,8.0,9.0,9.1,9.2],[7.0,7.0,8.5],[Y,J]).
testc :- find_interval1([1.0,6.0,8.0,8.0,9.0,9.1,9.2],[0.5,0.6, 0.9], [Y,J]).
testd :- find_interval1([1.0,6.0,8.0,8.0,9.0,9.1,9.2],[0.5,0.6, 0.9, 20], [Y,J]).
teste :- find_interval1([1.0,1.0], [1.0,1.0,1.0], [Y,J]).
testf :- find_interval1([1.0,1.0,1.5], [1.0,1.0,1.0], [Y,J]).
testx :- find_interval1([5,7,1,7,7,5],[0,0,0,4,3,2],[X,Y]).
testa :- get_next_limit(1.0,1,[1.0,6.0,8.0,8.0],[7.0,7.0,8.5],Y,J),
         J1 is J+1,
         nth(J1,[1.0,6.0,8.0,8.0],NTH),
         snap_off_front([7.0,7.0,8.5],NTH, End).
  ******************************************************/
testx :- find_interval1([5,7,1,7,7,5],[0,0,0,4,3,2],[X,Y]).
testc :- find_interval1([1.0,6.0,8.0,8.0,9.0,9.1,9.2],[0.5,0.6, 0.9], [Y,J]).

find_interval_for_each_N(_,N1,N, []) :- N1 > N,!.

find_interval_for_each_N(M,N1,N,[nullvar(interval)|ListMaxMinVars]):-
    findall( Limitval, (limitvalF(M, Listvals),
            nth(N1,  Listvals, Limitval )),  List_FP),
  findall( Limitval, (limitval(M, Listvals),
            nth(N1,  Listvals, Limitval )),  List_TP),
  (var_in_list(List_FP) ; var_in_list(List_TP)),
  N2 is N1+1,
  find_interval_for_each_N(M,N2,N,ListMaxMinVars),!.

find_interval_for_each_N(M,N1,N,[IN|ListMaxMinVars]):-
  findall( Limitval, (limitvalF(M, Listvals), 
            nth(N1,  Listvals, Limitval )),  List_FP),
  findall( Limitval, (limitval(M, Listvals), 
            nth(N1,  Listvals, Limitval )),  List_TP),
% first take away any FP's that appear in TP's
% if FP is a subset of TP, then its the only case of nullvars
del_ALL(List_TP,List_FP,  List_FP1),  
%
find_interval1(List_FP1,List_TP, IN),

%             cf_tr_trace(XFX),tell(XFX),nl,
%            write('***'),
%            write(List_FP1), nl,
%            write(List_TP), nl,
%            write(IN), nl,
%            write('***'),
%            tell(user),

  N2 is N1+1,
  find_interval_for_each_N(M,N2,N,ListMaxMinVars),!.

% is_greater,is_less_eq,is_less,is_less_eq

% after taking away TP's there may be no FP's left..
find_interval1([],_, nullvar(interval)) :- !.
find_interval1(List_FP,List_TP, [U,V]) :-
  gqsort(List_FP,OLFP),gqsort(List_TP,OLTP),
% fisrt interval..
  OLFP = [Head|_],
  snap_off_front(OLTP,Head, OLTP1),
  get_next_limit(Head,1,OLFP,OLTP1,Y,J),
  find_interval2(in(Head,1,Y,J),J,OLFP,OLTP1,in(U,N,V,M)),!.

find_interval2(in(X,I,Y,J),CNT,OLFP,OLTP,in(X,I,Y,J) ) :-
   length(OLFP,CNT),!.
find_interval2(in(X,I,Y,J),CNT,OLFP,OLTP,in(X1,I1,Y1,J1) ) :-
   CNT1 is CNT+1,
   nth(CNT1,OLFP,NTH),
   snap_off_front(OLTP,NTH, OLTP1),
   get_next_limit(NTH,CNT1,OLFP,OLTP1,NY,NJ), 
   Len is J-I,
   LenN is NJ-CNT1,
   if_then_else( LenN>Len, 
                 (X2 = NTH, I2 = J1, Y2 = NY, J2 = NJ),
                 (X2 = X, I2 = I, Y2 = Y, J2 = J)
                ),
    find_interval2(in(X2,I2,Y2,J2),NJ,OLFP,OLTP1,in(X1,I1,Y1,J1)),!.

snap_off_front([],_,[]) :- !.
snap_off_front([H|L],NTH,[H|L]) :- 
   is_less_eq(NTH,H),!.
snap_off_front([H|L],NTH,L1) :-
   snap_off_front(L,NTH,L1),!.

del_ALL([],L,L) :-!.
del_ALL([H|T],L,O) :-
  del(H,L,L1),
  del_ALL(T,L1,O),!.

% assumes that X < head of TPs -Y
get_next_limit(X,I,OLFP,_,X,I) :-
   length(OLFP,I),!.
get_next_limit(X,I,OLFP,[Y|OLTP],X,I) :-
   J is I+1,
   nth(J,OLFP, Z),
   is_less_eq(Y,Z),!.
get_next_limit(X,I,OLFP,OLTP,Y,J) :-
   I1 is I + 1,
   nth(I1,OLFP, Z),
   get_next_limit(Z,I1,OLFP,OLTP,Y,J),!. 
   


set_flag_if_revision([]) :-!.
set_flag_if_revision([nullvar(interval) | Tail]) :-
    set_flag_if_revision(Tail),!.
set_flag_if_revision(_) :- 
    assert(flag_for_revision),!.

sift_out_nullvar(X,X) :-
   all_are_nullvar(X),!.
sift_out_nullvar(X,Y) :- 
    sift_out_nullvar_1(X,Y).

sift_out_nullvar_1([],[]) :-!.
sift_out_nullvar_1([nullvar(interval)|T],X):-
   sift_out_nullvar_1(T,X),!.
sift_out_nullvar_1([Y|T],[Y|X]):-
   sift_out_nullvar_1(T,X),!.

all_are_nullvar([]) :-!.
all_are_nullvar([nullvar(interval)|T]):-
   all_are_nullvar(T),!.


get_List_of_nulls(0, []) :- !.
get_List_of_nulls(N, [nullvar(interval)|T]) :- 
     N1 is N-1, get_List_of_nulls(N1, T),!.

vars_in_list_p_tuples(M) :-
   limitvalF(M,L),
   var_in_list(L).
var_in_list([H|T]):- var(H),!.
var_in_list([H|T]):- var_in_list(T),!.

replace_old_body(H, B1, B2) :-
   retract((H  :-   B1)),
   asserta((H  :-   B2)), !.

replace_old_body(H, B1, B2) :-
   retract((H  :- _)).
   asserta((H  :-   B2)),
       nl, write('** warning - error in replace body (1) **'),nl,
      cf_tr_trace(XFX),tell(XFX), nl, write('** warning - error in replace body **'),nl,
      tell(user), !.

replace_old_body(H, B1, B2) :-
    asserta((H  :-   B2)),
      nl, write('** warning - error in replace body (2) **'),nl,
      cf_tr_trace(XFX),tell(XFX), nl, write('** warning - error in replace body (2) **'),nl,
      tell(user),!.




/*********************NEW CALC ACCURACY ********************/

calculate_acc_SAFE(TP, FP, TN, FN, 0):-
    old_FN_count(OLDFN),
    list_length(FN, N_fn),
     N_fn > OLDFN,!.

calculate_acc_SAFE(TP, FP, TN, FN, A):-
 list_length(TP, N_tp),
 list_length(FP, N_fp),
 list_length(TN, N_tn),
 list_length(FN, N_fn),
 A is (((N_tp + N_tn) / (((N_tp + N_fp) + N_tn) + N_fn)) * 100),!.
 


/* def of ordinals */
 
limits_clause(<).
limits_clause(>).
limits_clause(>=).
limits_clause(=<).
limits_clause(is_at_or_below ).
limits_clause(is_at_or_above ).
limits_clause(is_below ).
limits_clause(is_above ).
limits_clause(is_earlier_than).
limits_clause(is_later_than).
limits_clause(is_at_or_later_than).
limits_clause(is_at_or_earlier_than).
limits_clause(is_at_or_west_of).
limits_clause(is_west_of).
limits_clause(is_east_of).
limits_clause(is_at_or_west_of).
limits_clause(is_south_of).
limits_clause(is_north_of).
limits_clause(is_at_or_south_of).
limits_clause(is_at_or_north_of).

implicit_limits_clause(both_are_at_or_below).
implicit_limits_clause(one_or_both_are_at_or_below).
implicit_limits_clause(both_are_above).
implicit_limits_clause(one_or_both_are_above).
% 
implicit_limits_clause(one_or_both_of_finish_at_or_after).
implicit_limits_clause(both_finish_before).
 
implicit_limits_clause(both_are_flown_at_subsonic_speed).
implicit_limits_clause(one_or_both_of_are_flown_at_supersonic_speed).
implicit_limits_clause(are_separated_by_at_least_one_degree).
implicit_limits_clause(the_linear_tracks_of_are_separated_by_at_least_120NM_at_20_degrees_west).
implicit_limits_clause(the_preceding_aircraft_on_or_on_is_faster_by_at_least).



removable_clause(<).
removable_clause(>).
removable_clause(>=).
removable_clause(=<).
removable_clause(is_at_or_below ).
removable_clause(is_at_or_above ).
removable_clause(is_below ).
removable_clause(is_above ).
removable_clause(is_earlier_than).
removable_clause(is_later_than).
removable_clause(is_at_or_later_than).
removable_clause(is_at_or_earlier_than).
removable_clause(is_at_or_west_of).
removable_clause(is_at_or_north_of).
removable_clause(is_west_of).
removable_clause(is_east_of).
removable_clause(is_south_of).
removable_clause(is_north_of).
removable_clause(is_at_or_south_of).
removable_clause(is_at_or_north_of).
 
removable_clause(same_Long).
removable_clause(same_Lat).
removable_clause(same_2D_pt).
 


/* generic def of ordinal rels */
is_greater(fl(X), fl(Y)):- 
fl(X) is_above fl(Y).

is_less(fl(X), fl(Y)):- 
 fl(X) is_below fl(Y).

is_greater_eq(fl(X),fl(Y)):- fl(X) is_at_or_above fl(Y). 

is_less_eq(fl(X),fl(Y)):- fl(X) is_at_or_below fl(Y). 

is_greater(time(D1,M1,S1), time(D2,M2,S2)) :-
time(D1,M1,S1) is_later_than time(D2,M2,S2).

is_less_eq(time(D1,M1,S1), time(D2,M2,S2)):-

time(D1,M1,S1) is_at_or_earlier_than time(D2,M2,S2).

is_less(time(D1,M1,S1), time(D2,M2,S2)):-

time(D1,M1,S1) is_earlier_than time(D2,M2,S2).

is_greater_eq(time(D1,M1,S1), time(D2,M2,S2)) :-
time(D1,M1,S1) is_at_or_later_than time(D2,M2,S2).

is_greater(lat_N(X1,X2), lat_N(Y1,Y2)) :-
lat_N(X1,X2) is_north_of lat_N(Y1,Y2).

is_greater(lat_N(X), lat_N(Y)) :-
lat_N(X) is_north_of lat_N(Y).

is_greater(lat_N(X), lat_N(Y1,Y2)) :-
lat_N(X) is_north_of lat_N(Y1,Y2).

is_greater(lat_N(X1,X2), lat_N(Y)) :-
lat_N(X1,X2) is_north_of lat_N(Y).

is_less(lat_N(X1,X2), lat_N(Y1,Y2)):-
lat_N(X1,X2) is_south_of lat_N(Y1,Y2).

is_less(lat_N(X), lat_N(Y1,Y2)):-
lat_N(X) is_south_of lat_N(Y1,Y2).

is_less(lat_N(X1,X2), lat_N(Y)):-
lat_N(X1,X2) is_south_of lat_N(Y).

is_less(lat_N(X), lat_N(Y)) :-
lat_N(X) is_south_of lat_N(Y).

is_greater_eq(lat_N(X1,X2), lat_N(Y1,Y2)):-
lat_N(X1,X2) is_at_or_north_of lat_N(Y1,Y2).

is_greater_eq(lat_N(X), lat_N(Y1,Y2)):-
lat_N(X) is_at_or_north_of lat_N(Y1,Y2).

is_greater_eq(lat_N(X1,X2), lat_N(Y)):-
lat_N(X1,X2) is_at_or_north_of lat_N(Y).

is_greater_eq(lat_N(X), lat_N(Y)) :-
lat_N(X) is_at_or_north_of lat_N(Y).

is_less_eq(lat_N(X1,X2), lat_N(Y1,Y2)):-
lat_N(X1,X2) is_at_or_south_of lat_N(Y1,Y2).

is_less_eq(lat_N(X), lat_N(Y1,Y2)):-
lat_N(X) is_at_or_south_of lat_N(Y1,Y2).

is_less_eq(lat_N(X1,X2), lat_N(Y)):-
lat_N(X1,X2) is_at_or_south_of lat_N(Y).

is_less_eq(lat_N(X), lat_N(Y)) :-
lat_N(X) is_at_or_south_of lat_N(Y).

is_greater(long_W(X), long_W(Y1,Y2)) :-
long_W(X) is_west_of long_W(Y1,Y2).

is_greater(long_W(X1,X2), long_W(Y)) :-
long_W(X1,X2) is_west_of long_W(Y).

is_greater(long_W(X), long_W(Y)) :-
long_W(X) is_west_of long_W(Y).

is_greater(long_W(X1,X2),long_W(Y1,Y2)) :-
long_W(X1,X2) is_west_of long_W(Y1,Y2).


is_less_eq(long_W(X), long_W(Y1,Y2)) :-
long_W(X) is_east_of long_W(Y1,Y2);
same_Long(long_W(X), long_W(Y1,Y2)).

is_less_eq(long_W(X1,X2), long_W(Y)) :-
long_W(X1,X2) is_east_of long_W(Y);
same_Long(long_W(X1,X2), long_W(Y)).

is_less_eq(long_W(X), long_W(Y)) :-
long_W(X) is_east_of long_W(Y);
same_Long(long_W(X), long_W(Y)).

is_less_eq(long_W(X1,X2),long_W(Y1,Y2)) :-
long_W(X1,X2) is_east_of long_W(Y1,Y2);
same_Long(long_W(X1,X2),long_W(Y1,Y2)).

is_less(long_W(X),long_W(Y1,Y2)):-
long_W(X) is_east_of long_W(Y1,Y2).

is_less(long_W(X1,X2),long_W(Y)):-
long_W(X1,X2) is_east_of long_W(Y).

is_less(long_W(X),long_W(Y)):-
long_W(X) is_east_of long_W(Y).

is_less(long_W(X1,X2),long_W(Y1,Y2)) :-
long_W(X1,X2) is_east_of long_W(Y1,Y2).


is_greater_eq(long_W(X), long_W(Y1,Y2)) :-
long_W(X) is_at_or_west_of long_W(Y1,Y2).

is_greater_eq(long_W(X1,X2), long_W(Y)) :-
long_W(X1,X2) is_at_or_west_of long_W(Y).

is_greater_eq(long_W(X), long_W(Y)) :-
long_W(X) is_at_or_west_of long_W(Y).

is_greater_eq(long_W(X1,X2),long_W(Y1,Y2)) :-
long_W(X1,X2) is_west_of long_W(Y1,Y2);
same_long(long_W(X1,X2), long_W(Y1,Y2)).


is_greater(Val1, Val2) :- number(Val1), number(Val2), Val1 > Val2.
% 
is_less_eq(Val1, Val2) :- number(Val1), number(Val2), Val1 =< Val2.
% 
is_less(Val1, Val2) :- number(Val1), number(Val2), Val1 < Val2.
% 
is_greater_eq(Val1, Val2) :- number(Val1), number(Val2), Val1 >=  Val2.

% is_greater(Val1, Val2) :- Val1 > Val2.
% is_less_eq(Val1, Val2) :-  Val1 =< Val2.
% is_less(Val1, Val2) :-  Val1 < Val2.
% is_greater_eq(Val1, Val2) :- Val1 >=  Val2.


nullvar(_).

limitvar(_).

first([X|_], X).          

base.

% test:
% subtract_intervals(3,[[fl(340),fl(340)],[fl(340),fl(340)]],[[fl(340),fl(340)],[fl(340),fl(340)]],F).


subtract_intervals( _, [],  [],  [] ) :- !.

subtract_intervals(M, [[Min1,Max1]|Rest1],  [[Min2,Max2]|Rest2],
                           [[Min1,Max1]|Rest3] ):-
     (   is_greater(Min1, Max2)
          ;
         is_less(Max1, Min2)
      ), 
      subtract_intervals(M, Rest1,  Rest2,  Rest3 ),!.
   
subtract_intervals(M, [[Min1,Max1]|Rest1],  [[Min2,Max2]|Rest2],
                    [nullvar(interval)|Rest3] ) :-

     (   (is_greater_eq(Max2,Min1), is_greater_eq(Min1, Min2))
           ;
          (is_greater_eq( Max1, Min2) , is_greater_eq(Min2 , Min1))
     ),
     subtract_intervals(M, Rest1,  Rest2,  Rest3 ),!.

subtract_intervals(M, [[Min1,Max1]|Rest1], [nullvar(_)|Rest2],
                         [[Min1,Max1]|Rest3] ) :-
     subtract_intervals( M, Rest1,  Rest2,  Rest3 ),!.

subtract_intervals(M, [nullvar(_)|Rest1], [_|Rest2],
                         [nullvar(interval)|Rest3] ) :-
     subtract_intervals( M, Rest1,  Rest2,  Rest3 ),!.


obtain_antes([],  [], [] ). 

obtain_antes( [Var| Rest], [[Minvar,Maxvar]|Rest1], [ Max_Min_ante |Rest2] ) :-

       Max_Min_ante =.. [';', not__(is_greater_eq(Var, Minvar)), 
                          not__(is_less_eq(Var, Maxvar) )],

          obtain_antes(Rest, Rest1, Rest2).

obtain_antes( [_|Rest], [nullvar(X) |Rest1], [nullvar(X) |Rest2] ) :-

       
          obtain_antes(Rest, Rest1, Rest2).


/* USED TO CHECK ENVELOPED DEFNS EXIST *********************/

check_oracle_env_defined([]) :-
   nl,nl,write('all oracle segments checked'),nl,nl,!.
check_oracle_env_defined([X|Tail]) :-
   (X = instance_of_concept(segments_are_in_oceanic_conflict(S1,S2),_)  ;
    X = instance_of_concept(profiles_are_in_oceanic_conflict(S1,_,S2,_),_)  ),
   clause_impress(S1 belongs_to _ ,_,_,_),
   clause_impress(S2 belongs_to _ ,_,_,_),
   check_oracle_env_defined(Tail),!.

check_oracle_env_defined([X|Tail]) :-
   (X = instance_of_concept(segments_are_in_oceanic_conflict(S1,S2),_) ;
    X = instance_of_concept(profiles_are_in_oceanic_conflict(S1,_,S2,_),_) ),
      clause_impress(S1 belongs_to _ ,_,_,_),
   cf_tr_trace(XFX),tell(XFX),
   nl,write('** not env **'),nl,
      write(S2),
   tell(user),
   nl,write('** not env **'),nl,
      write(S2),
    check_oracle_env_defined(Tail),!.
check_oracle_env_defined([X|Tail]) :-
   (X = instance_of_concept(segments_are_in_oceanic_conflict(S1,S2),_) ;
    X = instance_of_concept(profiles_are_in_oceanic_conflict(S1,_,S2,_),_) ),
      clause_impress(S2 belongs_to _ ,_,_,_),
   cf_tr_trace(XFX),tell(XFX),
   nl,write('** not env **'),nl,
      write(S1),
   tell(user),
   nl,write('** not env **'),nl,
      write(S1),
    check_oracle_env_defined(Tail),!.
check_oracle_env_defined([X|Tail]) :-
   (X = instance_of_concept(segments_are_in_oceanic_conflict(S1,S2),_) ;
    X = instance_of_concept(profiles_are_in_oceanic_conflict(S1,_,S2,_),_) ),
   cf_tr_trace(XFX),tell(XFX),
   nl,write('** not env **'),nl,
      write(S1),
   tell(user),
   nl,write('** not env **'),nl,
      write(S1),
   cf_tr_trace(XFX),tell(XFX),
   nl,write('** not env **'),nl,
      write(S2),
   tell(user),
   nl,write('** not env **'),nl,
      write(S2),
    check_oracle_env_defined(Tail),!.


 
test_set([]) :- !.
 
test_set([X| RestSet]) :-
   (call(X); true) , test_set(RestSet),!.
 

%% this is probably not needed now.

partition_antecedants([],_,_,_).

partition_antecedants( [H1|T1], [H1|T2],  Limit_ante, Rest):-
 H1 =.. [Name_ante|_],

 \+ (limits_clause( Name_ante )),
  partition_antecedants( T1, T2,  Limit_ante, Rest).

partition_antecedants( [H1|T1], [], [Name_ante|Var_list] , T1):-
 H1 =.. [Name_ante|Var_list],

  limits_clause( Name_ante ).
 
/* succeed if clause_involves_limits or if
clause_involves_implicit limits. In the latter case
chamge the rep. of the Clause of Clause_ID_no so that
it is expanded with all its implicit limits clauses */
 
clause_involves_limits(Clause_ID_no):-
    clause_impress(Head, Body, Clause_ID_no,unshielded),
    split_body_into_a_list_of_its_antecedents(Body, Anteced_list),
% note ; and , have been abstracted away by above procedure
    member(Ante, Anteced_list),
    Ante =.. [Name_ante|_], 
    implicit_limits_clause( Name_ante ),
% ok now change..
    copy( (Head:-Body), (Copy_head:-Copy_body) ),
    change_every_limits_clause(Body,New_body),
    Head = Copy_head,

cf_tr_trace(XFX),tell(XFX),
    nl,write('replacing explicits'),nl,
    nl,write(Clause_ID_no), write(' expanded'),nl,
tell(user),
    nl,write('replacing explicits'),nl,
    nl,write(Clause_ID_no), write(' expanded'),nl,

    retract(clause_impress(Head,Body, Clause_ID_no, unshielded)),
    assert(clause_impress(Head,New_body, Clause_ID_no, unshielded)),
    retract( ( Head :- Old_body) ),
    asserta( ( Head :- New_body) ),!.

% if it dosen't have implicits it may have explicits 
clause_involves_limits(Clause_ID_no):-
    clause_impress(Head, Body, Clause_ID_no,unshielded),
    split_body_into_a_list_of_its_antecedents(Body, Anteced_list),
    member(Ante, Anteced_list),
    Ante =.. [Name_ante|_], 
    limits_clause( Name_ante ),!.

clause_involves_constant_limits(Clause_ID_no):-
% must be binary with a constant second arg
    clause_impress(Head, Body, Clause_ID_no,unshielded),
    split_body_into_a_list_of_its_antecedents(Body, Anteced_list),
    member(Ante, Anteced_list),
    Ante =.. [Name_ante, _, Limit],
    limits_clause( Name_ante ),
    nonvar(Limit),!.

change_every_limits_clause(Body,New_body) :- 
    Body =.. [',', X, Y],
    change_every_limits_clause(X,N_X),
    change_every_limits_clause(Y,N_Y),
    New_body =.. [',',N_X, N_Y],!.
 
change_every_limits_clause(Body,New_body) :-
    Body =.. [';', X, Y],
    change_every_limits_clause(X,N_X),
    change_every_limits_clause(Y,N_Y),
    New_body =.. [';',N_X, N_Y],!.

change_every_limits_clause(Body,New_body) :-
  \+ Body =.. [',', X, Y],
  \+ Body =.. [';', X, Y],
    Body =.. [Name_ante|_],
    implicit_limits_clause(Name_ante),
    clause_impress(Body, New_body,_,_),!.

change_every_limits_clause(Body,Body) :-
  \+ Body =.. [',', X, Y],
  \+ Body =.. [';', X, Y], !.

%%%% 

change_every_generic_limits_clause(Body,New_body) :-
    Body =.. [',', X, Y],
    change_every_generic_limits_clause(X,N_X),
    change_every_generic_limits_clause(Y,N_Y),
    New_body =.. [',',N_X, N_Y],!.
 
change_every_generic_limits_clause(Body,New_body) :-
    Body =.. [';', X, Y],
    change_every_generic_limits_clause(X,N_X),
    change_every_generic_limits_clause(Y,N_Y),
    New_body =.. [';',N_X, N_Y],!.
 
change_every_generic_limits_clause(Body,not__(New_body)) :-
  \+ Body =.. [',', X, Y],
  \+ Body =.. [';', X, Y],
    Body = not__(T),
    change_every_generic_limits_clause(T,New_body),!.
change_every_generic_limits_clause(Body,New_body) :-
  \+ Body =.. [',', X, Y],
  \+ Body =.. [';', X, Y],
    Body =.. [Name_ante|_],
   member(Name_ante,[is_greater, is_less, is_greater_eq, is_less_eq]), 
    clause(Body,New_body),!.
 
change_every_generic_limits_clause(Body,Body) :-
  \+ Body =.. [',', X, Y],
  \+ Body =.. [';', X, Y], !.
 
 
%%%%
 
/* generic quick sort which ignore's `null' ****** don't need it..
gqXsort( [], [] ).
gqXsort( [null | T], Slist) :- gqXsort( T, Slist),!.
gqXsort( [H | T], Slist ):-
    gpartitionX( H, T, L1, L2 ),
    gXqsort( L1, Slist1 ),
    gXqsort( L2, Slist2 ),
    append( Slist1, [H | Slist2], Slist ),!.
gpartitionX(Divider, [H | T], [null | S1], S2):-
    gpartitionX(Divider,[H | T], S1, S2),!.
gpartitionX(Divider, [null | T], [H | S1], S2):-
    gpartitionX(Divider, T, [H | S1], S2),!.
gpartitionX(Divider, [H | T], [H | S1], S2):-
    is_less_eq(H , Divider),
    gpartitionX(Divider, T, S1, S2),!.
gpartitionX(Divider, [H | T], S1, [H | S2]):-
    is_greater(H , Divider),
    gpartitionX(Divider, T, S1, S2),!.
gpartitionX(_, [], [], []).
*/

