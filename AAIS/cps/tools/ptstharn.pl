/* ************************************************************************/
/* TEST HARNESS */

/* New test harness                                   - 8/11/96 TLMc */
/* Added `test with last N profiles' mod              - 5/97 */
/* MM output, 'expanation' optional                   - 8/97 */
/* ? bugs in above!  2/99 */
/* Added preprocessor to make tests accurate          - 8/97 */
/* Added `test in query mode' facility                -10/97 */

:- unknown(_,fail).
:- dynamic conflict_detected/1.
conflict_detected(no).

/* Run tests in query mode */
 
test_in_query_mode :-
    cf_query_executable_file(F),
    introduce(F),
    cf_blame_input_file(F1),
    cf_test_log_file(F2),
    execute_queries(F1,F2),
    tell(F2),
    told,
    tell(F1),
    told.
 
execute_queries(F1,F2) :-
    query(Text,Result,Tree,QueryTF,QueryEF),
    execute_queries1(F1,F2,query(Text,Result,Tree,QueryTF,QueryEF)),
    fail.
execute_queries(_,_).
 
execute_queries1(F1,F2,query(Text,Result,Tree,QueryTF,QueryEF)) :-
    test_query(QueryEF,CPS_Result),
    tell(F1),
    write_out_class(QueryEF,Result,CPS_Result),nl,nl,
    tell(user),
    nl,
    write(Text),nl,
    write_string(QueryTF),nl,
    write('Result was              .. '),write(CPS_Result),nl,
    write('Result should have been .. '),write(Result),nl,
    if_then_else(CPS_Result = Result,write(ok),write(mismatch)),nl,
    nl,
    tell(F2),
    write(Text),nl,
    write_string(QueryTF),nl,
    write('Result was              .. '),write(CPS_Result),nl,
    write('Result should have been .. '),write(Result),nl,
    if_then_else(CPS_Result = Result,write(ok),write(mismatch)),nl,
    nl,
    tell(user),
    !.
 
test_query(QueryEF,true) :-
    call(QueryEF),!.
test_query(QueryEF,false).
 
write_out_class(QueryEF,true,true) :-
    write(query(QueryEF,truely_positive)),!.
write_out_class(QueryEF,true,false) :-
    write(query(QueryEF,falsely_negative)),!.
write_out_class(QueryEF,false,true) :-
    write(query(QueryEF,falsely_positive)),!.
write_out_class(QueryEF,false,false) :-
    write(query(QueryEF,truely_negative)),!.
 


/* Run tests in pairwise checking mode */

test_in_pairwise_checking_mode :-
    cf_profile_pairs_file(F),
    introduce(F),
    pairs_of_profiles(P),
    list_to_set(P,PR),
    gather_profs([],PS),
    list_take(PR,PS,Rest),
    nl,write(PR),nl,nl,
    nl,write(PS),nl,nl,
    nl,write(Rest),nl,
    test_in_pairwise_checking_mode(Rest,P),!.
test_in_pairwise_checking_mode([_|_],P) :-
    nl,nl,
    write('Aborting - Some profiles are not in profile file'),
    nl,nl,!.
test_in_pairwise_checking_mode(_,P) :-
    th_open_files,
    perform_test_pairs(P),
    th_close_files,
    close_explanation_file,!.

perform_test_pairs([]) :- !.
perform_test_pairs([L,X|Z]) :- 
    test_two(L,X,Result),
    write(Result),nl,nl,
    cf_test_log_file(F0),
    tell(F0),
    write('test: '),  write(L),  write(' with '), write(X),nl,nl,
    write(Result),nl,nl,
    tell(user),
% for conflicts in every segment pair..
% testing pairs of profiles usually requires this.
    fail.
% for conflicts in first one.
%    perform_test_pairs(Z).

perform_test_pairs([L,X|Z]) :-
    perform_test_pairs(Z),!.

/* Run tests in `CLEARANCE' mode */
test_in_clearance_mode :-
    gather_profs([],PS),
    length(PS,L),
    th_open_files(L),
     perform_tests(PS),
    th_close_files,
     !.

test_two(X,Y,conflict(S1,S2)) :-
    cf_run_tests(_, explanation,_),
    profiles_are_in_oceanic_conflict(S1,X,S2,Y),
    th_tell_output_con(S1,X,S2,Y,MMfile),
    put_explanation(S1,S2,MMfile),
    if_then(nonvar(MMfile),(tell(MMfile),told)).
test_two(X,Y,conflict(S1,S2)) :-
    not__( cf_run_tests(_, explanation,_)),
    profiles_are_in_oceanic_conflict(S1,X,S2,Y).
test_two(X,Y,no_conflict).


perform_tests([_]) :-!.
perform_tests(Y) :- 
    remove_last(Y,YR),
    perform_tests(YR),
    last(Y,L),
    perform_tests2(L,YR), !.

perform_tests2(L,YR) :- 
    length(YR,LY),
    cf_clear_with_last(N),
    LY > N-1,
    reduce15(N,YR,YR10),
    perform_tests1(L, YR10),!.
perform_tests2(_,_).

reduce15(N,YR,YR) :-
    length(YR,L),
    L < N+1,!.

reduce15(N,[_|Y],Y1) :-
    reduce15(N,Y,Y1),!.

perform_tests1(_,[]) :- !.
perform_tests1(L,[X|Y]):-
    write('test: '),  write(L),  write(' with '), write(X),nl,nl,
 
    test_two(L,X,Result),
 
    write(Result),nl,nl,

    cf_test_log_file(F0),
    tell(F0),
    write('test: '),  write(L),  write(' with '), write(X),nl,nl,
    write(Result),nl,nl,
    tell(user),
 
    perform_tests1(L,Y).

% last([X],X) :- !.
% last([X|Y],Z) :- last(Y,Z),!.
remove_last([Y],[]) :- !.
remove_last([X|Y],[X|Y1]) :- remove_last(Y,Y1),!.

gather_profs(X,X) :-
    finish(X), !.
gather_profs(X,Y) :-       
   retract(the_Aircraft_on_profile(Profile, Call_sign)),
   append(X,[Profile],Y1),
   assertz(the_Aircraft_on_profile(Profile, Call_sign)),
   gather_profs(Y1,Y), !. 
finish(X) :-
    the_Aircraft_on_profile(Profile, Call_sign),!,
    member(Profile,X).
   
th_open_files(L) :- 

   cf_clear_with_last(N),
   N1 is (L-N)*N,
   /* old test file */
   cf_test_log_file(F0),
   tell(F0), nl,nl,
   write('Test runs total '),  write(N1), 
   write(' comparisons'),nl,nl,nl,
   /* output for screen */
   tell(user),nl,nl,
      write('Test results total '),  write(N1), 
   write(' comparisons'),nl,nl,nl,
   th_open_files,!.
th_open_files :-
   /* output for input to blame ass  file */
   cf_blame_input_file(F),
   tell(F),nl,nl,
   write('list_of_pos(X) :- X ='), nl,nl, write('['), 
   tell(user),!.

   /* output for input to MM software */
   /* no banner */


th_close_files :-

   cf_test_log_file(F0),
   tell(F0),
   told,

   cf_theory_refinement_input_file(FFF),
   tell(FFF),
   told,

   cf_blame_input_file(F),
   tell(F),
   write('].'),nl,told.

   /* Output for BLAME ASSIGNMENT and MULTIMEDIA */
   
th_tell_output_con(S1,X,S2,Y,MMfile) :-
   /* Print out FIRST conflict without comma!!*/
   conflict_detected(no),
   cf_blame_input_file(F),
   tell(F),
   write('profiles_are_in_oceanic_conflict('),write(S1),
   write(','),write(X),
   write(','),write(S2),
   write(','),write(Y),
   write(')'),nl,nl,tell(user),
   retract(conflict_detected(no)),
   assert(conflict_detected(yes)),

/* output for oracle */

   cf_theory_refinement_input_file(FFF),
   tell(FFF),
   write('instance_of_concept(segments_are_in_oceanic_conflict('),
   nl,
   write(S1),write(','),nl,
   write(S2),write('),fail).'),nl,nl,
   tell(user),

   th_tell_output_dis(S1,X,S2,Y,MMfile),!.

th_tell_output_con(S1,X,S2,Y,MMfile) :-
   cf_blame_input_file(F),
   tell(F),
   write(', profiles_are_in_oceanic_conflict('),write(S1),
   write(','),write(X),
   write(','),write(S2),
   write(','),write(Y),
   write(')'),nl,nl,tell(user),

   cf_theory_refinement_input_file(FFF),
   tell(FFF),
   write('instance_of_concept(segments_are_in_oceanic_conflict('),
   nl,
   write(S1),write(','),nl,
   write(S2),write('),fail).'),nl,nl,
   tell(user),

   th_tell_output_dis(S1,X,S2,Y,MMfile),!.

/* put conflicting segments in profile files */

% th_tell_output_dis(_,_,_,_,_) :- cf_multimedia_output(no),!.

th_tell_output_dis(S1,X,S2,Y,File) :- 
   empty_temp_files.
     /* put call signs together into a file name */
%   get_call_signs(X,Y,Call1,Call2),
%   cf_display_input_file(D),
%   name(D,DL),name(Call1,CL1),name(Call2,CL2),
%   T1 = [95 | CL2 ],
%   append(CL1,T1,T2),
%   append(DL,T2,FChars),
%   name(File,FChars),
%   tell(File),
%     /* write out first bit */
%   w_out_header(X,Y),
%   w_out_segments(X,S1),
%   write('End1'),nl,
%   w_out_segments(Y,S2),
%   write('End2').
% File now closed by explanation fn
%   nl,
%   told.

get_call_signs(X,Y,Call1,Call2) :-
   the_Aircraft_on_profile(X, Call1),
   the_Aircraft_on_profile(Y, Call2),!.

w_out_header(X,Y) :-
     write('Start'),nl,
     the_Aircraft_on_profile(X, Call1),
     the_Aircraft_on_profile(Y, Call2),
     write(Call1),nl,
     write(Call2),nl,
 %    the_Type_of(Call1,Typ1),
 %    the_Type_of(Call2,Typ2),
 %    write(Typ1),nl,
 %    write(Typ2),nl,
     the_Segment(X, _, _, M1) belongs_to X,
     the_Segment(Y, _, _, M2) belongs_to Y,
     write(M1),nl,
     write(M2),nl,!.

% t1 :- 
%   gather_profs([],[X,Y|PS]),
%   format(X),
%   format(Y),
%   gather_segs(profile_BAW183_1,[],LS).

/* write out first segment point .. */
w_out_segments(X,S) :-
   the_Segment(X, D1, D2, M) belongs_to X,
   the_Lat_of_4D_pt(D1,Lat),
   ( (Lat = lat_N(A,B), LatD is A + B/60.0) ; 
     (Lat = lat_N(A), LatD is A*10.0/10.0) ),  
   write(LatD),nl,
   the_Long_of_4D_pt(D1,Long),
   ( (Long = long_W(A1,B1), LongD is A1 + B1/60.0) ; 
     (Long = long_W(A1), LongD is A1*10.0/10.0) ),
   write(LongD),nl,
   the_Flight_level_range_of_4D_pt(D1,fl_range(fl(F1),fl(_))),
   write(F1),nl,
   the_entry_Time_of(the_Segment(X, D1, D2, M) ,time(H,M1,_)),
   write(H),nl,
   write(M1),nl,
   !,
   w_out_segments_rest(X,S).

w_out_segments_rest(X,S) :-
   the_Segment(X, D1, D2, M) belongs_to X,
   ( (S = the_Segment(X, D1, D2, M), write('Conflict'),nl ) ; 
     not__(S = the_Segment(X, D1, D2, M)) ),
   the_Lat_of_4D_pt(D2,Lat),
   ( (Lat = lat_N(A,B), LatD is A + B/60.0) ; 
     (Lat = lat_N(A), LatD is A*10.0/10.0) ),  
   the_Long_of_4D_pt(D2,Long),
   write(LatD),nl,
   ( (Long = long_W(A1,B1), LongD is A1 + B1/60.0) ; 
     (Long = long_W(A1), LongD is A1*10.0/10.0) ),  
   write(LongD),nl,
   the_Flight_level_range_of_4D_pt(D2,fl_range(fl(F1),fl(_))),
   write(F1),nl,
   the_exit_Time_of(the_Segment(X, D1, D2, M) ,time(H,M1,_)),
   write(H),nl,
   write(M1),nl,
   fail.
w_out_segments_rest(X,S) :- 
   !.


/********************* code for EXPLANATION FACILITY *****/

empty_temp_files :-
   temp_file1(T1),
   temp_file2(T2),
   temp_file3(T3),
   tell(T1),
   told,
   tell(T2),
   told,
   tell(T3),
   told,!.

tell_explanation_file :-
   cf_explanation_tests_file(E),
   tell(E).
   

% h - header, v - vert - l - lat/long 
ex_outh(X) :-
   temp_file1(T1),
   tell(T1),
   write(h(X)), write('.'), nl,
   tell(user),!.
ex_outv(X) :-
   temp_file2(T2),
   tell(T2),
   write(v(X)), write('.'), nl,
   tell(user),!.
ex_outl(X) :-
   temp_file3(T3),
   tell(T3),
   write(l(X)), write('.'), nl,
   tell(user),!.

put_explanation(S1,S2,MMfile) :-
   pretty_print_segments(S1,S2),
/* at this stage all temp files are open */
   temp_file1(T1),
   temp_file2(T2),
   temp_file3(T3),
   put_explanation3(T1,MMfile),
   put_explanation3(T2,MMfile),
   put_explanation3(T3,MMfile), 
   !.
put_explanation(_,_,_) :-!.

pretty_print_segments(the_Segment(X,D1,D2,M), the_Segment(Y,E1,E2,N)) :-
   ex_outh([" "]),
   ex_outh([" ************ Segments are not Separated ************ "]),
   ex_outh([" "]),
   ex_outh(["CallSign - Type - Mach - non-MNPS? - Steep Sgmt? - Irregular Sgmt?"]),
   ex_outh(["--------- ------ ------ ---------- -------------- ---------------"]),
   the_Aircraft_on_profile(X, Call1),
   the_Aircraft_on_profile(Y, Call2),
   the_Type_of(Call1,Typ1),
   the_Type_of(Call2,Typ2),
   ((meets_mnps(Call1), MNPS1 = "no ") ; MNPS1 = "yes"),
   ((meets_mnps(Call2), MNPS2 = "no ") ; MNPS2 = "yes"),
   ((steep(the_Segment(X,D1,D2,M)), Stp1 = "yes") ; Stp1 = "no "),
   ((steep(the_Segment(Y,E1,E2,N)), Stp2 = "yes") ; Stp2 = "no "),
   ((regular(the_Segment(X,D1,D2,M)), Reg1 = "no ") ; Reg1 = "yes"),
   ((regular(the_Segment(Y,E1,E2,N)), Reg2 = "no ") ; Reg2 = "yes"),
   
   ex_outh([Call1,"     ",Typ1,"   ",M,"      ",MNPS1,"         ",Stp1,"           ",Reg1 ]),
   ex_outh([Call2,"     ",Typ2,"   ",N,"      ",MNPS2,"         ",Stp2,"           ",Reg2 ]),
ex_outh([" "]),
   ex_outh(["Entry: Time   FL   Lat  Long    Exit: Time  FL   Lat   Long "]),
   ex_outh(["-----  ----   --   ---  ----    ----- ----  --   ---   ----"]),
   the_entry_Time_of(the_Segment(X,D1,D2,M) , time(Tin1H,Tin1M,_)),
   the_entry_Time_of(the_Segment(Y,E1,E2,N) , time(Tin2H,Tin2M,_)),
   the_Flight_level_range_of_4D_pt(D1,fl_range(fl(FL1in),fl(_))),
   the_Flight_level_range_of_4D_pt(D2,fl_range(fl(FL1out),fl(_))),
   the_exit_Time_of(the_Segment(X,D1,D2,M) , time(Tout1H,Tout1M,_)),
   the_exit_Time_of(the_Segment(Y,E1,E2,N) , time(Tout2H,Tout2M,_)),
   the_Flight_level_range_of_4D_pt(E1,fl_range(fl(FL2in),fl(_))),
   the_Flight_level_range_of_4D_pt(E2,fl_range(fl(FL2out),fl(_))),
   spacing(Spa1,Tin1M),spacing(Spa2,Tout1M),
   spacing(Spa3,Tin2M),spacing(Spa4,Tout2M),

   the_Lat_of_4D_pt(D1,Lat1),
   the_Long_of_4D_pt(D1,Long1),
   the_Lat_of_4D_pt(D2,Lat2),
   the_Long_of_4D_pt(D2,Long2),

   ( (Lat1 = lat_N(LatD1, LatM1)) ;
     (Lat1 = lat_N(LatD1), LatM1 = "00") ),
   ( (Long1 = long_W(LongD1,LongM1)) ;
     (Long1 = long_W(LongD1), LongM1 = "00") ),
   ( (Lat2 = lat_N(LatD2,LatM2)) ;
     (Lat2 = lat_N(LatD2), LatM2 = "00") ),
   ( (Long2 = long_W(LongD2,LongM2)) ;
     (Long2 = long_W(LongD2), LongM2 = "00") ),

   the_Lat_of_4D_pt(E1,LatE1),
   the_Long_of_4D_pt(E1,LongE1),
   the_Lat_of_4D_pt(E2,LatE2),
   the_Long_of_4D_pt(E2,LongE2),

   ( (LatE1 = lat_N(LatDE1, LatF1)) ;
     (LatE1 = lat_N(LatDE1), LatF1 = "00") ),
   ( (LongE1 = long_W(LongDE1,LongF1)) ;
     (LongE1 = long_W(LongDE1), LongF1 = "00") ),
   ( (LatE2 = lat_N(LatDE2,LatF2)) ;
     (LatE2 = lat_N(LatDE2), LatF2 = "00") ),
   ( (LongE2 = long_W(LongDE2,LongF2)) ;
     (LongE2 = long_W(LongDE2), LongF2 = "00") ),


   ex_outh([Call1," ", Tin1H,Spa1,Tin1M,"  ",FL1in,"  ",LatD1," ",LatM1," ",
   LongD1," ",LongM1,"        ", Tout1H,Spa2,Tout1M,"  ",FL1out,"  ", 
   LatD2," ",LatM2,"  ",LongD2," ",LongM2]),

   ex_outh([Call2," ", Tin2H,Spa3,Tin2M,"  ",FL2in,"  ",LatDE1," ",LatF1," ",
   LongDE1," ",LongF1,"        ", Tout2H,Spa4,Tout2M,"  ",FL2out,"  ", 
   LatDE2," ",LatF2,"  ",LongDE2," ",LongF2]),

%   ex_outh(["    ", Tin2H,Spa3,Tin2M,"   ",FL2in,"   ",LatD2,LatM2,"    ",
%   Tout2H,Spa4,Tout2M,"  ",FL2out,"    ", LongD2,LongM2]),

   ex_outh([" "]),!.
   
spacing(" ",X) :- X > 9.
spacing(" 0",X) :- X < 10. 
close_explanation_file :-
   tell_explanation_file,
   nl,nl,
   told,!.
  
put_explanation3(F,MMfile) :-
% need to close explan info file:
   tell(F),
   told,
% and read from it:
   see(F),
   put_explan(MMfile),
   nl,!.


put_explan(MMfile) :-
   read(Z),
   put_expl(Z,MMfile),!.

put_expl(end_of_file,_) :-
   seen,!.
put_expl(h(X),MMfile) :-
   tell_explanation_file,
   nl,
   put_ex_out(X),
   tell(MMfile),
   nl,
   put_ex_out(X),
   tell(user),
   nl,
   put_ex_out(X),
   put_explan(MMfile).
put_expl(v(X),MMfile) :-
   tell_explanation_file,
   nl,
   put_ex_out(X),
   tell(MMfile),
   nl,
   put_ex_out(X),
   tell(user),
   nl,
   put_ex_out(X),
   put_explan(MMfile).
put_expl(l(X),MMfile) :-
   tell_explanation_file,
   nl,
   put_ex_out(X),
   tell(MMfile),
   nl,
   put_ex_out(X),
   tell(user),
   nl,
   put_ex_out(X),
   put_explan(MMfile).

put_ex_out([]) :- !.

%  Round reals to integers ..
put_ex_out([X|Y]) :-
  float(X),
  X > 10.0,
  X1 is round(X),
     write(X1),
   put_ex_out(Y),!.
put_ex_out([[X|Y]|Z]) :-
   name(C,[X|Y]),
   write(C), 
   put_ex_out(Z),!.
put_ex_out([X|Y]) :-
   write(X), 
   put_ex_out(Y),!.

/* UTILIIES */

if_then(A,B) :- call(A),call(B),!.
if_then(_,_).
if_then_else(A,B,_) :- call(A),call(B),!.
if_then_else(_,_,C) :- call(C),!.

/* arg1 - arg2 = arg3 */
 
list_take(R,[E|R1],R2):-
        removeL(E,R,RR),
        list_take(RR,R1,R2),!.
list_take(R,[_|R1],R2):-
        list_take(R,R1,R2),!.
list_take(A,[],A) :- !.
removeL(El,[El|T],T) :- !.
removeL(E1,[X|T1],[X|T2]) :- removeL(E1,T1,T2).
/* This procedure changes a list to a set */
 
list_to_set([],[]) :- !.
list_to_set([L|T],S) :- member(L,T),!,list_to_set(T,S),!.
list_to_set([L|T],[L|T1]) :- list_to_set(T,T1),!.


 

/******************************************************/
ex_test :- 
    empty_temp_files,
    SS3 = 5,
    Profile2 = profASD456,
    ex_outh(["segment no: ",SS3," of profile ",Profile2]),
    ex_outh(["hello "," there1"]),
    ex_outv(["vert "," conflict1"]),
    ex_outl(["lat "," conflict"]),
    ex_outv(["vert ","conflict2"]),
    ex_outh(["hello "," there2"]),
    ex_outh(["by-ee"]).
ex_test1 :-  the_Segment(X,R,T,P) belongs_to X,
             the_Segment(Y,A,S,D) belongs_to Y,
             put_explanation(the_Segment(X,R,T,P),the_Segment(Y,A,S,D)).

