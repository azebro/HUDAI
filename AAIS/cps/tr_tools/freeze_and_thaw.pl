/* Here is an example of the need to freeze variables and how it can
be done using my code. remove_dups(L, R) removes duplicate elements
from the list L. However it does not work properly if L contains
variables. */

example(Variables, List, Result):-
 freeze(Variables, L_frozen_vars, List, L2),
 remove_dups(L2, L3),
 thaw(Variables, L_frozen_vars, L3, Result).

%example([X], [a, b, a, X, X], Result). 
%example([X, X], [a, b, a, X, X], Result). 
%example([X, Y], [a, b, a, X, X, c, Y], Result).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% freeze(L_vars, L_frozen_vars, Structure, Result)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% freeze([X,Y], L_frozen_vars, p(X, f(X,Y)), Result).

freeze([], [], X, X).

freeze([Variable | T], [Constant | T2], Structure, Result):-
 create_constant_from_var(Variable, Constant),
 term_substitute(Variable, Constant, Structure, S_new),
 freeze(T, T2, S_new, Result).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% thaw(L_vars, L_frozen_vars, Structure, Result)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

thaw([], [], X, X).

thaw([Variable | T], [Constant | T2], Structure, Result):-
 term_substitute(Constant, Variable, Structure, S_new),
 thaw(T, T2, S_new, Result).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% create_constant_from_var(Variable, Constant)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_constant_from_var(Variable, Constant):-
 var(Variable),
 write_var_to_file_as_constant(Variable),
 read_file(Constant),
 nonvar(Constant).

/********************************************************************/

read_file(Variable_new):-
	open(var_file_tmp, read, Var_stream),
	read(Var_stream, Variable_new),
	close(Var_stream).

write_var_to_file_as_constant(Variable):-
	open(var_file_tmp, write, Var_stream),
	write(Var_stream, 'constant'),
	write(Var_stream, Variable),
        write(Var_stream, '.'),
	close(Var_stream).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% term_substitute(Old, New, OldTerm, NewTerm)
%%
%% NewTerm is the result of replacing all occurrences of Old
%% in OldTerm by New.
%%
%% Adapted from Sterling & Shapiro's substitute (see pp167-174).
%% NB use of == rather than matching allows variables to be 
%% replaced by constants.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% term_substitute(cat, dog, owns(jane, cat), X).
% term_substitute(brown, black, owns(jane, cat(2,brown,male)), X).
% term_substitute('V', cat, owns(jane, 'V'), X).

% term_substitute(a, b, a(a(a), a(c(a))), X).
% NB Old is a/0 (and NOT a/1), so X = a(a(b),a(c(b)))

% term_substitute(cat, V, owns(jane, cat), X).
% term_substitute('V', V, owns(jane, 'V'), X).

% term_substitute(V, cat, owns(jane, V), X). 
% term_substitute(V, 'V', owns(jane, V), X). 

% term_substitute(a(V), a('V'), (a(a(a)), a(V), a(c(a))), X).

% term_substitute(V, 'V', owns(jane, V, W), X). 

% term_substitute(V, 'V', .(a, []), X).
% term_substitute(V, 'V', .(V, []), X).
% term_substitute(V, 'V', [V], X).
% term_substitute(V, 'V', [V, V], X).

term_substitute(Old, New, OldTerm, New):- 
 Old == OldTerm.

term_substitute(Old, New, Term, Term):- 
 atomic(Term), 
 \+ Term == Old.

term_substitute(Old, New, Term, Term):- 
 var(Term), 
 \+ Term == Old.

term_substitute(Old, New, Term, Term1):-
 compound(Term),
 functor(Term, F, N),
 functor(Term1, F, N),
 term_substitute(N, Old, New, Term, Term1).

term_substitute(N, Old, New, Term, Term1):-
 N > 0,
 arg(N, Term, Arg),
 term_substitute(Old, New, Arg, Arg1),
 arg(N, Term1, Arg1),
 N1 is N - 1,
 term_substitute(N1, Old, New, Term, Term1).

term_substitute(0, Old, New, Term, Term1).
