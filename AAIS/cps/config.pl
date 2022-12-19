/*******************************************************************/

/* Configuration File for the MSL tools environment

-----------------------

Sicstus Prolog.

-- Use this file to configure what kind of support / environment
   run you require.

-- All configuration facts should be prefixed with
   'cf_' to identify them in other files.

functions:

*/
/*******************************************************************/
/* FUNCTIONS ....  */

/* PATT: Translate msl spec file to Prolog? */
cf_translate_spec_into_prolog(                   no).

/* PATT: Translate msl tests file to Prolog? */
cf_translate_tests_into_prolog(                  no).

/* PATT: Translate msl queries file to Prolog? */
cf_translate_queries_into_prolog(                no).

/* PATT: Translate msl file into Structured English? */
cf_translate_spec_into_structured_english(       no).

/*BLAME: envelope tests prolog file ready for 
   blame_assignment? */
cf_translate_tests_exec_form_into_enveloped_form(no).

/*BLAME: envelope spec prolog file ready for 
   blame_assignment? */
cf_translate_spec_exec_form_into_enveloped_form(no).

/* TESTS: Run a test batch; 
          mode = clearance OR pairwise */

cf_run_tests(clearance, explanation, no).
% cf_run_tests(pairwise, explanation,              no).

/* TESTS: clearance mode, cf_clear_with_last(N), NB N > no. of tests */
cf_clear_with_last(       10).

/* THEORY_REVISION stuff */
cf_THEORY_REVISION(                              no).
/* NB EXTRA data files needed as well as pl and env of spec/tests:
  pred_decs.pl  : all predicates defined as dynamic .. TR may change them 
  oracle.pl     : tests.pl enveloped with expected result and run like queries
*/

/********************* FILE NAMES *******************************/

/* GRAMMAR FILE FOR SPECIFICATION */
cf_meta_model_file('tools/pgrammar.pl').

/* TF FILE: - msfol: file of spec + fis */
cf_specification_source_file('spec.msl').

/* TF FILE: - msfol: file of test profiles for input to a test run */
cf_case_batch_file('tests.msl').

/* TF FILE: - msfol: file of queries */
cf_test_queries_file('queries.msl').

/********- THESE SHOULD ALL BE CONSISTENT ***/
/* EF FILE: - prolog: target file for spec in exec form*/
cf_spec_executable_file('spec.pl'). 

/* EF ENVELOPED FILE: - prolog: spec in enveloped form for Blame fn */
cf_spec_exec_enveloped_file('spec.env').

/***** cf_tests_executable_file MUST CONTAIN DEFS OF REST ***/
/* EF FILE: - prolog: file of tests and target for pl generation*/
cf_tests_executable_file('tests.pl'). 

/* file for INPUT to TR: NOTE the DEFNS MUST BE IN TESTS.pl above */
cf_theory_refinement_TR_oracle('oracle.pl').

/* EF FILE: - prolog: file of queries and target for pl generation*/
cf_query_executable_file('queries.pl').

/* EF ENVELOPED FILE: - prolog: tests in enveloped form for Blame fn */
cf_enveloped_tests_file('tests.env').

/****************************************************/

/* VF FILE: - English: target for vf generation*/
cf_spec_in_structured_english_file('spec.vf'). 

/* pairwise mode, file of profile pair ids is:- */
cf_profile_pairs_file('input_profs.pl').

/* test output files: */
cf_test_log_file('results_tests/main_results').

/* driver for blame assignment */
cf_blame_input_file('results_tests/test_results_blame').

/* output diretory for visualisation data */
cf_display_input_file('results_for_MM/').

/* Temporary and explanation files */

temp_file1('results_tests/temp1').
temp_file2('results_tests/temp2').
temp_file3('results_tests/temp3').
cf_explanation_tests_file('results_tests/explain').

cf_tr_trace(trace).

/* Variable Code files */

cf_blame_assigment_code('tools/blame_ass_neg7.98.pl').

cf_theory_refinement_input_file('oracle.tmp').

/* file containing declarations of predicates */
cf_spec_pred_decs('tools/pred_decs.pl').


