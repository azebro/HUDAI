/* Tools for processing Prolog clauses.
Margaret West 13/12/96, 20.12/93


You also need all the patt files for them to work properly. 
*/

/* This predicate will read a prolog file and list each predicate + its arity.
to an output file. Duplicates are removed.

NB output file and input file names are carried by read and write
preds - this is not strictly neccy.
*/

/* eg
read_ef_and_write_preds_to_output('old_spec.pl.efpc', file_out).

reads ef file and lists each predicate and its arity to file_out.
*/
read_ef_and_write_preds_to_output(Input_file,Output_file) :-
	see_seen_see(Input_file),  % open  Input_file for reading predicates

	read(String),	 % 'read ahead' 1st string
        read_ef_and_list_predicates(String,Input_file, [], Listin),
        seen, 	% close input
       remove_dups(Listin, Listout),%remove duplicate preds
       reverse(Listout, Revlist),
	tell_told_tell(Output_file), % open Output_file 
       write_from_list_to_output(Revlist, Output_file),

     told,!. % close output

/* This predicate will read a prolog file and write clause
heads  to a file which declares each as dynamic.

eg of input 
 p(X,Y) :- q(X).
 q(a).
yields  output
:- dynamic p/2.
:- dynamic q/1.
*/         

read_ef_and_declare_preds_dynamic_to_file(Input_file,Output_file) :-
	see_seen_see(Input_file),  % open  Input_file for reading predicates

	read(String),	 % 'read ahead' 1st string
        read_ef_and_list_predicates(String,Input_file, [], Listin),
        seen, 	% close input
       remove_dups(Listin, Listout),%remove duplicate preds
       reverse(Listout, Revlist),
	tell_told_tell(Output_file), % open Output_file 
       write_from_list_and_declare_dynamic_to_output(Revlist, Output_file),

     told,!. % close output

/* This predicate will read a prolog file and write a list of clause
heads  to a file in the form:

list_of_cps_predicates(L) :-
L = [

pred(Head1, Arity1),
pred(Head2, Arity2),
...
    ].


eg of input 
 p(X,Y) :- q(X).
 q(a).
yields  output
list_of_cps_predicates(L) :-
L = [

pred(p,2),
pred(q,1)
 ].

*/         
read_ef_and_list_preds_to_file(Input_file,Output_file) :-
	see_seen_see(Input_file),  % open  Input_file for reading predicates
   
	read(String),	 % 'read ahead' 1st string
        read_ef_and_list_predicates(String,Input_file, [], Listin),
        seen, 	% close input
       remove_dups(Listin, Listout),%remove duplicate preds
       reverse(Listout, Revlist),
	tell_told_tell(Output_file), % open Output_file
             write('list_of_cps_predicates(L) :- '), nl, nl, 
            write('L = ['), nl, nl, 
       write_list_preds_to_file(Revlist, Output_file),
       write('].'),
     told,!. % close output

/* predicate read_ef_and_list_predicates reads preds from file
and yields list 
*/
%%eof passes completed list to output list
 read_ef_and_list_predicates(end_of_file, _, L, L) .


%%intended to ignore command type predicates -- not very robust yet
%%only works because put first.
read_ef_and_list_predicates((:- Body), Input_file, 
                        Input_list, Output_list )  :- 
     read(Next_string),
    read_ef_and_list_predicates(Next_string,Input_file, 
        Input_list, Output_list), !. 

%% lists Heads of predicates with Bodies
read_ef_and_list_predicates((Head :- Body), Input_file, Input_list,
       Output_list )  :- 
    functor(Head, Name, Arity),
    
    read(Next_string),
   read_ef_and_list_predicates(Next_string,Input_file, [ap(Name,
    Arity)|Input_list], Output_list), !.


%% lists Heads of predicates without Bodies
read_ef_and_list_predicates((Head), Input_file, Input_list, Output_list )  :-
    functor(Head, Name, Arity),
      read(Next_string),
  read_ef_and_list_predicates(Next_string,Input_file, [ap(Name,
Arity)|Input_list], Output_list), !.


  write_from_list_to_output([Head|Ls], Output_file) :-
            write(Head) ,
            nl,     
   write_from_list_to_output(Ls, Output_file), !.

write_from_list_to_output([], _).

write_list_preds_to_file([ap(Name,Arity)|Ls],
               Output_file) :- 
              write('pred( ') ,
              write(Name),
               write(','),
                 write(Arity) ,
                write('),'),
                  nl,     
   write_list_preds_to_file(Ls, Output_file), !.

write_list_preds_to_file([], _).

write_from_list_and_declare_dynamic_to_output([ap(Name,Arity)|Ls],
               Output_file) :- 
              write(':- dynamic ') ,
              write(Name),
    write('/'),
    write(Arity) ,
    write('.'),
     nl,     
   write_from_list_and_declare_dynamic_to_output(Ls, Output_file), !.

write_from_list_and_declare_dynamic_to_output([], _).

/* reads from ef file and declares each predicate shielded */
/*
eg of input 
 p(X,Y) :- q(X).
 q(a).
yields  output
shielded ( p ( _292,_320 )).
shielded (q(_605 )).
*/         
read_ef_and_declare_shielded_to_output(Input_file,Output_file) :-

	see_seen_see(Input_file),  % open  Input_file for reading predicates
	tell_told_tell(Output_file), % open Output_file 
	read(String),	 % 'read ahead' 1st string
        declare_shielded_to_output_file(String,Input_file, Output_file),
        seen, 	% close input
        told,!. % close output
%%eof
declare_shielded_to_output_file(end_of_file, _, _) .
 

%%intended to ignore command type predicates -- not very robust yet
%%only works because put first.
declare_shielded_to_output_file((:- Body), Input_file, Output_file )  :-
       read(Next_string),
    declare_shielded_to_output_file(Next_string,Input_file, Output_file), !.

%% lists Heads of predicates with Bodies
declare_shielded_to_output_file((Head :- Body), Input_file, Output_file )  :-
   write('shielded( ') ,
       write(Head) ,
    write('). '),

     nl, nl,
    read(Next_string),
    declare_shielded_to_output_file(Next_string,Input_file, Output_file), !.


%% lists Heads of predicates without Bodies

declare_shielded_to_output_file((Head), Input_file, Output_file )  :-
  write('shielded( ') ,
       write(Head) ,
       write('). '),

     nl,
    read(Next_string),
    declare_shielded_to_output_file(Next_string,Input_file, Output_file), !.


/* This version of remove_dups retains original order of list but is
inefficient */

% remove_dups([X|Xs], [X|Ys]) :-  del(X, Xs, Xs1),
%           remove_dups( Xs1,  Ys).
% 
% remove_dups([], []).

/* del(X, Y, Z) deletes all occurences of X from Y yielding Z */
% del( X, [X|Xs], Ys) :- del( X, Xs, Ys).
% 
% del( Z, [X|Xs], [X|Ys]) :- not__(X  = Z), 
%       
%                         del( Z, Xs, Ys).
% 
% del( X, [], []).
/* reverse(Xs, Ys) reverses  list Xs yielding Ys */
%  
% reverse(Xs, Ys) :- rev(Xs, [], Ys).
% 
% rev([X|Xs], Acc, Ys) :- rev(Xs, [X| Acc], Ys).
% 
% rev([], Ys, Ys).

/* test 


 remove_dups([a,a,a,a,b,c,a,a,a, b], X).

 X = [a,b,c] ? 
*/
