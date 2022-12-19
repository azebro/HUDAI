
/* FAROAS-IMPRESS ENVIRONMENT BOOT FILE */
/* VERSION 2.3 TLMc            */

/* compile or consult?? */
 
introduce(X) :- compile(X).
% introduce(X) :- consult(X).


/* Input Configuration File */
:- introduce('config.pl').

% Sicstus specific bits -
:- introduce('tools/psics.pl').
:- introduce('tools/ppatt.pl').


% grammar file
:- cf_meta_model_file(X),introduce(X).
:- introduce('tools/ptf2vf.pl').
:- introduce('tools/pefp.pl').
:- introduce('tools/pquefp.pl').  
:- introduce('tools/ptstharn.pl').
:- introduce('tools/utilities.pl').
:- introduce('tr_tools/mmw_tr_utils.pl').


start :- execute0.
execute0 :- execute01.
   
% TRANSLATE SPEC+FIS MSL INTO PROLOG
execute01 :-
   cf_translate_spec_into_prolog(yes),
   tell(user),nl,nl,
   cf_specification_source_file(F),
   cf_spec_executable_file(F1),nl,
   write(' Translating file '),write(F),
   write(' into Prolog '),nl,
   translate_to_efp_clauses([F],F1,_, Errors,_, _),   
   execute1(Errors),!.
execute01 :- execute10.
   
execute1(error_found) :-
   cf_specification_source_file(F),
   nl,write('Task aborting - look in '),
   write(F),write('.work for fail clauses'),nl,!.
execute1(no_errors_found) :-
   cf_spec_executable_file(F1),
   write(' Translation succesful, output file is '),
   write(F1),nl,nl,
   execute10.

% TRANSLATE SPEC INTO STRUCTURED ENGLISH
execute10 :-
   cf_translate_spec_into_structured_english(yes),
   cf_specification_source_file(F),
   cf_spec_in_structured_english_file(F1),nl,
   write(' Translating file '),write(F),
   write(' into structured English'),nl,
   translate_to_vf(F,F1,_,_),
   write(' Translation succesful, output file is '),
   write(F1),
   execute2.
execute10 :-
   execute2.


% TRANSLATE TESTS INTO PROLOG
execute2 :-
   cf_translate_tests_into_prolog(yes),
   tell(user),nl,nl,
   cf_case_batch_file(F),
   cf_tests_executable_file(F1),nl,
   write(' Translating file '),write(F),
   write(' into Prolog '),nl,
   translate_to_efp_clauses([F],F1,_, Errors,_, _),
   execute3(Errors),!.
execute2 :- execute29.
execute3(error_found) :-
   cf_case_batch_file(F),
   nl,write('Task aborting - look in '),
   write(F),write('.work for fail'),!.
execute3(no_errors_found) :-
   cf_tests_executable_file(F1),
   write(' Translation succesful, output file is '),
   write(F1),nl,nl,
   execute29.



% TRANSLATE QUERIES INTO PROLOG
execute29 :-
   cf_translate_queries_into_prolog(yes),
   tell(user),nl,nl,
   cf_test_queries_file(F),
   cf_query_executable_file(F1),nl,
   write(' Translating file '),write(F),
   write(' into Prolog '),nl,
 
   cf_specification_source_file(F2),
   translate_to_efp_clauses([F2], file_out,
         Temp, Error_flag1,
         Evaluable_fn_list, Eqsort_list), !,
    (Error_flag1 = errors_found, !,
     Error_flag2 = errors_found
         ;
     see_seen_see(F),   % open TF_query_file for reading
     tell_told_tell(F1), % open EF_output_chan for writing
     read_wffs_and_gen_queries(Evaluable_fn_list, Eqsort_list,
                   Error_flag1 , Error_flag2),
     seen,                  % close TF_query_file
     told),
 
   execute35(Error_flag2),!.
 
execute29 :- execute30.
execute35(error_found) :-
   cf_test_queries_file(F),
   nl,write('Task aborting - look in '),
   write(F),write('.work for fail'),!.
execute35(no_errors_found) :-
   cf_query_executable_file(F1),
   write(' Translation succesful, output file is '),
   write(F1),nl,nl,
   execute30.


% ENVELOPE CODE
% NB ..code starts at 1, tests at 100000 and new clauses in
% tr stuff at 1000000.
execute30 :-
   cf_translate_spec_exec_form_into_enveloped_form(yes),
   cf_spec_executable_file(F1),
   cf_spec_exec_enveloped_file(F2),
   write(' Translating file '),write(F1),
   write(' into Enveloped Prolog '),nl,
   read_ef_and_number_clauses(F1,F2,1,unshielded),
   write(' Translation succesful, output file is '),
   write(F2),nl,nl,
   write('****** NB ******'),nl,
   write(' you must specify shielding and revisables in this file'),nl,nl,
   execute301.

execute30 :-
   execute301.

% ENVELOPE TESTS
execute301 :- 
   cf_translate_tests_exec_form_into_enveloped_form(yes),
   cf_tests_executable_file(F1),
   cf_enveloped_tests_file(F2),
   write(' Translating file '),write(F1),
   write(' into Enveloped Prolog '),nl,
   read_ef_and_number_clauses(F1,F2,100001,shielded),
   write(' Translation succesful, output file is '),
   write(F2),nl,nl,
   execute300.

execute301 :-
   execute300.

% RUN TEST HARNESS
execute300 :-
   cf_run_tests(Mode, EXP,    yes),
   write(' Inputting specification and test files: '),nl,
   cf_spec_executable_file(F) ,
   cf_tests_executable_file(F1), 
   write('      '),write(F),nl,
   write('      '),write(F1),nl,nl,
   introduce(F),introduce(F1),nl,nl,
   write(' Starting tests with '),write(EXP),write(' facility'),nl,nl,
if_then_else(Mode = clearance,
                test_in_clearance_mode,
                if_then_else(Mode = query,
                             test_in_query_mode,
                             test_in_pairwise_checking_mode)),halt.

execute300 :- execute4.

% RUN BLAME ASSIGNMENT
% ONLY IN LINUX VERSION
execute4 :- 
   cf_run_tests(_,_,no),
   cf_blame_assignment(yes),

% input test harness and blame code
   cf_blame_assigment_code(FF1),
   introduce(FF1),
   cf_blame_input_file(FF),
   introduce(FF),

%  put command together
   cf_spec_exec_enveloped_file(Fa),
   cf_spec_executable_file(Fb),
   cf_enveloped_tests_file(Fc),
   cf_tests_executable_file(Fd),

   name('cat ',Ls), name(' > temp_file.pl',Ls1),
   name(Fa,FaN), name(Fb,FbN), name(Fc,FcN), name(Fd,FdN),
   append_lists_together([Ls,FbN,[32],FaN,[32],FcN,[32],FdN,Ls1],BigL),
   name(Command,BigL),
   execute_shell(Command),

   nl,write(' Inputting revisable specification and test files: '),nl,
   introduce('temp_file.pl'),
   execute_shell('rm temp_file.pl'),
   
   list_of_pos(List_of_instances),
   blame_module(List_of_instances,Blame_assignment),
   write(Blame_assignment).

blame_module(List_of_instances,Blame_assignment) :-
   blame_assign_f_pos(List_of_instances,Blame_assignment).
blame_module(List_of_instances,Blame_assignment) :-
   nl,nl,write('blame assigment has failed'),nl.

execute4 :- 
   cf_run_tests(_,_,yes),
   cf_blame_assignment(yes),
   nl,
   write(' ERROR - tests and blame algorithm cannot be run together'),
   nl,
   execute5.
execute4 :- 
   execute5.

execute5 :-
   cf_produce_input_profs_from_test_results_blame(  yes),
   translate_blame_into_profile_pairs,halt.
execute5 :-
   cf_record_required_profiles_using_blame_file(yes ),
   record_required_profiles_using_blame_file,halt.

execute5 :-
   cf_THEORY_REVISION(yes),
     introduce('tr_tools/tools'),
     introduce('tr_tools/mmw_blame_ass_fn_1.pl'),
     introduce('tr_tools/blame_utils.pl'),
     introduce('tr_tools/perform_cri.pl'),
     introduce('tr_tools/mmw_operators3.pl'),
     introduce('tr_tools/freeze_and_thaw.pl'),
     introduce('tr_tools/main.pl'),
     introduce('tr_tools/label_limits_all_vars.pl'),
     introduce('tr_tools/replace_by_lim_all_vars.pl'),
 
% This is the new one for false positives:
   cf_blame_assigment_code(FF1),
     introduce(FF1),

   cf_theory_refinement_TR_oracle(F16),
     introduce(F16), %% instances with oracle class'ion.
%% theory and instances file
%  put command together

   cf_spec_pred_decs(Fx),
   cf_spec_exec_enveloped_file(Fa),
   cf_spec_executable_file(Fb),
   cf_enveloped_tests_file(Fc),
   cf_tests_executable_file(Fd),
 
   name('cat ',Ls), name(' > temp_file.pl',Ls1),
   name(Fx,FxN),name(Fa,FaN), name(Fb,FbN), name(Fc,FcN), name(Fd,FdN),
   append_lists_together([Ls,FxN,[32],FbN,[32],FaN,[32],FcN,[32],FdN,Ls1],BigL),
   name(Command,BigL),
%   execute_shell(Command),
nl,write('Execute the Windows equivalent of '), nl, 
write(Command), nl,
nl, write('*** then type startREV to start theory refinement ***'),nl,nl.

startREV :-
   nl,write(' Inputting revisable specification and test files: '),nl,
   introduce('temp_file.pl'),
%   execute_shell('rm temp_file.pl'),
   startTR,
nl,write('NOW execute the Windows equivalent of '), nl, 
write('rm temp_file.pl'), nl.


% nl, write('*** type startTR to start theory refinement ***'),nl,nl.

% this has already been read in - for use in just blame assign.
execute5 :- execute51.
execute51 :-
   cf_translate_Raw_NATS_test_data_into_msl(        no),
   cf_translate_spec_into_prolog(                   no),
   cf_translate_tests_into_prolog(                  no),
   cf_translate_queries_into_prolog(                no),
   cf_translate_spec_into_structured_english(       no),
   cf_produce_input_profs_from_test_results_blame(  no),
   cf_record_required_profiles_using_blame_file(    no),
   cf_translate_tests_exec_form_into_enveloped_form(no),
   cf_translate_spec_exec_form_into_enveloped_form( no),
   cf_blame_assignment(                             no),
   cf_run_tests(_, _,                               no),
   cf_THEORY_REVISION(                              no),
   nl,write('************************************************************'),
   nl,write('You have to change config.pl to choose the function you want'),
   nl,write('************************************************************'),
   nl,nl,halt.
execute51 :- halt.


/* concatentes list of lists */

append_lists_together(X,Z) :-
     reverse(X,X1),append_lists_together1(X1,[],Z).
append_lists_together1([],[],[]).
append_lists_together1([X],I,O) :-
    append(X,I,O),!.
append_lists_together1([X|T],I,O) :-
    append(X,I,I1),
    append_lists_together1(T,I1,O),!.

/* execute shell command */

execute_shell(C) :-
   nl, write('Executing: '),nl,write(C), nl,
   shell(C).
% odd but make it always succeed
execute_shell(_).


