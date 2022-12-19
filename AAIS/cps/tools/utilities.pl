

% UTILITIES

% 1. number clauses 
% 2. cf_blame_input_file  ---> cf_profile_pairs_file
% 3. cf_blame_input_file, cf_tests_executable_file
%            ---> REDUCED cf_tests_executable_file

% NB ALL FACTS ARE SHIELDED!!!!!!!!!!!!!



/* This predicate will read a prolog file and transform clauses of the form

head :- body

to the following  form:     

clause_impress(Head, Tail, Clause_ID_no, Shield_status).     

e.g.

 p(X,Y) :- q(X).
 q(a).


yields  output in the foll possible form:

 clause_impress( p(X,Y), q(X), 105, unshielded).

 clause_impress( q(a), true, 106, unshielded).


The predicate 
read_ef_and_number_clauses(Input_file,Output_file, Init_num, Clause_status).

reads Input_file and numbers the clauses starting from Init_num. Each clause in the file is given the specified Clause_status

*/

% NB ALL FACTS ARE SHIELDED!!!!!!!!!!!!!

read_ef_and_number_clauses(Input_file,Output_file, Init_num, Clause_status) :-

	see_seen_see(Input_file),  % open  Input_file for reading predicates
	tell_told_tell(Output_file), % open Output_file 
        nl,write('revisable_clauses([ ]).'),nl,nl,
	read(String),	 % 'read ahead' 1st string
        number_and_status_of_clause(String, Init_num, Clause_status, Input_file,  Output_file), 
        seen, 	% close input
        told,!. % close output
%%eof
number_and_status_of_clause(end_of_file, _, _, _, _) .
 

%%intended to ignore command type predicates 
%%only works because put first.
number_and_status_of_clause((:- Body), Clause_num, Clause_status,Input_file, Output_file )  :-
       read(Next_string),
number_and_status_of_clause(Next_string,   Clause_num, Clause_status,Input_file, Output_file ).


%% numbers Heads of predicates with Bodies
number_and_status_of_clause((Head :- Body),  Clause_num, Clause_status,Input_file,  Output_file )  :- 
   write('clause_impress( ') ,
    write(Head) ,
      write(', ('),
      write(Body) ,
      write('),'),
     write(Clause_num),
       write(','),
        write( Clause_status),
    write('). '),

     nl, nl,
    read(Next_string),
    Next_num is Clause_num + 1,
    number_and_status_of_clause(Next_string, Next_num  , Clause_status,Input_file, Output_file ).

%% lists Heads of predicates without Bodies
number_and_status_of_clause((Head ),  Clause_num, Clause_status,Input_file,  Output_file )  :- 
   write('clause_impress( ') ,
    write(Head) ,
      write(', true, ') ,
         write(Clause_num),
           write(','),
        write( shielded),
    write('). '),

     nl, nl,
    read(Next_string),
    Next_num is Clause_num + 1,
  number_and_status_of_clause(Next_string, Next_num   , Clause_status, Input_file,  Output_file  ). 


/******************** new tools TLMc 4/98 *********************/

% 2. cf_blame_input_file  ---> cf_profile_pairs_file


translate_blame_into_profile_pairs :-
    cf_blame_input_file(BlameF),
    consult(BlameF),
    list_of_pos(X),   
    cf_profile_pairs_file(Prof_pairs),
    tell(Prof_pairs),
    nl,nl,
    write('pairs_of_profiles( ['),nl,
    write_the_list_to_Prof_pairs(X),
    write(' ]).'),
    told,!.
write_the_list_to_Prof_pairs([]).
write_the_list_to_Prof_pairs([profiles_are_in_oceanic_conflict(_,P,_,Q)]) :-
        write(P),write(','),write(Q),nl.
write_the_list_to_Prof_pairs(
    [profiles_are_in_oceanic_conflict(_,P,_,Q) |Y] ) :- 
    write(P),write(','),write(Q),write(','),nl,
    write_the_list_to_Prof_pairs(Y).

/******************** new tools TLMc 4/98 *********************/

% 3. cf_blame_input_file, cf_tests_executable_file
%            ---> REDUCED cf_tests_executable_file

% NB this overwrites BIG executable file with SMALL one.
record_required_profiles_using_blame_file :-
    cf_blame_input_file(BlameF),
    consult(BlameF),
    list_of_pos(X),
    cf_tests_executable_file(TESTS),
    consult(TESTS),
    tell(TESTS),
%    tell('test.tmp'),
    write_prototype_header__,
    collect_set_of_profile_names(X,Z),
    remove_duplicates(Z,Y),
    write_required_profiles(Y),
    tell(TESTS),
    told,!.

collect_set_of_profile_names([],[]).
collect_set_of_profile_names(
    [profiles_are_in_oceanic_conflict(_,P,_,Q) |Y], [P,Q|Z] ) :-
    collect_set_of_profile_names(Y,Z),!.


write_required_profiles([]).
% meets mnps 
write_required_profiles([X|Y]) :-
    the_Aircraft_on_profile(X,Air),
    the_Type_of(Air,Typ),
    meets_mnps(Air),
    nl,write(the_Aircraft_on_profile(X,Air)),write('.'),nl,nl,
    write(the_Type_of(Air,Typ)),write('.'),nl,nl,
    write(meets_mnps(Air)),write('.'),nl,nl,
    write_out_all_the_segments(X),
    write_required_profiles(Y),!.
% dosen't meet mnps
write_required_profiles([X|Y]) :-
    the_Aircraft_on_profile(X,Air),
    the_Type_of(Air,Typ),
    nl,write(the_Aircraft_on_profile(X,Air)),write('.'),nl,nl,
    write(the_Type_of(Air,Typ)),write('.'),nl,nl,
    write(meets_mnps(Air)),write('.'),nl,nl,
    write_out_all_the_segments(X),
    write_required_profiles(Y),!.

write_out_all_the_segments(X) :-
    Z belongs_to X,
    write(Z),write(' belongs_to '),write(X),write('.'),nl,nl,
    fail.
write_out_all_the_segments(_) :- !.

%%% Weeds out non-revisable clauses from a list
% Used in tr_tools/main.pl

weed_out_unrevisable(L,W) :-
    revisable_clauses(LR),
    LR = [_|_],
    weed_out_unrevisable2(L,LR,W),!.
weed_out_unrevisable(L,L) :-
    nl,write('??? No revisable clauses recorded - so assume all'),nl,!.

weed_out_unrevisable2([ ],_,[ ]) :- !.
weed_out_unrevisable2([X|T],LR,[X|T1]) :-
    member(X,LR),
    weed_out_unrevisable2(T,LR,T1),!.
weed_out_unrevisable2([_|T],LR,T1) :-
    weed_out_unrevisable2(T,LR,T1),!.
    

% remove_duplicates
% ------------------
% IS IN SICSTUS LIBRARY
% remove_duplicates(A,B) :-
%         remove_duplicates(A,[],B) .
% remove_duplicates(A,A) .
%  
% remove_duplicates([],L,L) .
% remove_duplicates([A|B],L_in,L_out) :-
%         member(A,L_in) ,
%         remove_duplicates(B,L_in,L_out) .
% remove_duplicates([A|B],L_in,L_out) :-
%         append(L_in,[A],L_tmp) ,
%         remove_duplicates(B,L_tmp,L_out) .


