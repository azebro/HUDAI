
			   /* utilities */

/************* replaced by is_list

list([_|_]).

*********************************/

/***************************** library version used
append([],L,L).
append([H|T],L,[H|Z]) :- append(T,L,Z).

***************************************/


/********************************************************************/
/* These versions of remove_dups retain original order of list but are
inefficient */

/*tests
remove_dups([a,a,a,a,b,c,a,a,a, b], X).
 
X = [a,b,c] ?
 
remove_dups([1,1,1,1,2,3,1,1,1, 2], X).
 
X = [1,2,3] ?

%% this version will unify variables

remove_dups([X,Y,X,Z], A).


A = [X],
Y = X,
Z = X ? 
yes


 
*/
 
remove_dups([X|Xs], [X|Ys]) :-  del(X, Xs, Xs1),
          remove_dups( Xs1,  Ys).
 
remove_dups([], []).
 
/********************************************************************/
 
/* del(X, Y, Z) deletes all occurences of X from Y yielding Z */
del( X, [X|Xs], Ys) :- del( X, Xs, Ys).
 
del( Z, [X|Xs], [X|Ys]) :- \+(X  = Z),
 
                        del( Z, Xs, Ys).
 
del( _, [], []).
 
/********************************************************************/
/* 
remove_dups_vars(X, Y ) deletes all duplicate terms of X  yielding Y 
-- difft from remove_dups in that different variables are different
 */

/*test
remove_dups_vars([a,a,a,a,b,c,a,a,a, b], X).

X = [a,b,c] ? 

remove_dups_vars([1,1,1,1,2,3,1,1,1, 2], X).
 
X = [1,2,3] ? 

%% does not unify vars

remove_dups_vars([X,Y,X,Z], A).


A = [X,Y,Z] ? 
yes


*/

remove_dups_vars([X|Xs], [X|Ys]) :-  del_var(X, Xs, Xs1),
          remove_dups_vars( Xs1,  Ys).

remove_dups_vars([], []).


/* del_var(X, Y, Z) deletes all occurences of X from Y yielding Z 
-- difft from del in that different variables are different */



% del_var(a, [a,b,a], [b]).
% del_var(1, [1,1,1,1,2,3,1,1,1, 2], [2,3,2]).
% del_var(A, [A,B,A], [B]).

del_var( Z, [X|Xs], Ys) :- 
 Z==X,
 del_var( X, Xs, Ys).

del_var( Z, [X|Xs], [X|Ys]) :- 
 \+(X  == Z), 
 del_var( Z, Xs, Ys).

del_var( _, [], []).



/********************************************************************/

/* count(Item, List, Count) counts the number of occurrences of Item
in the List.

count(1, [1,1,1,1,2,3,1,1,1, 2], 7).
count(2, [1,1,1,1,2,3,1,1,1, 2], 2).

 */

count(_,[],0).

count(H,[H|T],N):- 
	count(H,T,NT),
	N is NT + 1.

count(X,[H|T],N):- 
	\+(X=H),
	count(X,T,N).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% partition(Divider, List1, List2, List3)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

partition(Divider, [H | T], [H | S1], S2):-

    H =< Divider,

    partition(Divider, T, S1, S2).

partition(Divider, [H | T], S1, [H | S2]):-

    H > Divider,

    partition(Divider, T, S1, S2).

partition(_, [], [], []).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% qsort(List1, List2)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

qsort( [], [] ).

qsort( [H | T], Slist ):-

    partition( H, T, L1, L2 ),

    qsort( L1, Slist1 ),

    qsort( L2, Slist2 ),

    append( Slist1, [H | Slist2], Slist ).

/* provides for a more generic partition and sort relying on ordinality 
of variables  */ 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% gpartition(Divider, List1, List2, List3)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gpartition(Divider, [H | T], [H | S1], S2):-

    is_less_eq(H , Divider),

    gpartition(Divider, T, S1, S2).

gpartition(Divider, [H | T], S1, [H | S2]):-

    is_greater(H , Divider),

    gpartition(Divider, T, S1, S2).

gpartition(_, [], [], []).

/* generic quick sort */

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% gqsort(List1, List2)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gqsort( [], [] ).

gqsort( [H | T], Slist ):-

    gpartition( H, T, L1, L2 ),

    gqsort( L1, Slist1 ),

    gqsort( L2, Slist2 ),

    append( Slist1, [H | Slist2], Slist ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% list_length
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

list_length([], 0).
list_length([_|Tail], N):- list_length(Tail, N1), N is 1 + N1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% set_difference
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%set_difference([a, b, c, c, a], [a, b, d], [c, c]).
%set_difference([A, B, C, C, A], [A, B, D], [C, C]).

set_difference(X, [], X).

set_difference(A, [H | T], Diff):-
 del(H, A, B),
 set_difference(B, T, Diff).

/* ******************************** defined in patt files
see_seen_see(+File).

Open File for reading, close it, and open it again for reading. The
use of this procedure ensures that reading from File will always begin
from the start of the file. (If 'see(File)' is used and execution of
the program is aborted and then restarted before 'seen' is called,
reading from File will recommence from the point where it was when
execution was aborted.)
---------------------------------------------------------------------


see_seen_see(File):-
	see(File),
	seen,
	see(File), !.

***
tell_told_tell(+File).

Open File for writing, close it, and open it again for writing. The
use of this procedure ensures that writing to File will always begin
from the start of the file. (If 'tell(File)' is used and execution of
the program is aborted and then restarted before 'told' is called,
writing to File will recommence from the point where it was when
execution was aborted.)
--------------------------------------------------------------------


tell_told_tell(File):-
	tell(File),
	told,
	tell(File), !.

**********************************/
