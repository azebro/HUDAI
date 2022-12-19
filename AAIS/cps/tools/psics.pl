/* ****************************************************************************
This file contains predicates required to run the FAROAS system under 
Sicstus Prolog. 
---------------------------------------------------------------------------- */

/* General directives. */
%% :- unknown(_,fail).  

:- use_module(library(system)).
:- use_module(library(lists)).

:- prolog_flag(compiling, _, fastcode).  /* produces fast 'native code' */
:- prolog_flag(single_var_warnings, _, off).
% :- multifile the_Aircraft_on_profile/2.
% :- dynamic the_Aircraft_on_profile/2.

/* ****************************************************************************
I/O predicates.
---------------------------------------------------------------------------- */

writeq__(X):- 
	writeq(X).	/* writes with quotes around atoms */

env_write__(X):-
	write(Var), !.	% Dummy for now.

env_read__(Term, Var_env):-
	read_term(Term, [variable_names(Var_env)]).
	

/* ****************************************************************************
Other system-related predicates.
---------------------------------------------------------------------------- */
 
not__(Goal):-
	\+(Goal).

% 'ground not' is a library predicate (not) in Quintus, but needs to be defined in
% Sicstus

ground_not__(Goal):-
	ground(Goal),
	\+(Goal), !.

ground_not__(Goal):-
%	tell(user),
%write('.'),
%told,
	\+(Goal), !.

/* ****************************************************************************
Arithmetic predicates.
---------------------------------------------------------------------------- */

power_functor_name__(exp).

	
/* ****************************************************************************
Miscellaneous predicates.
---------------------------------------------------------------------------- */

write_prototype_header__:-
        write(':- unknown(_,fail).'),
        nl,
write(':- multifile the_Aircraft_on_profile/2.'),
       nl,
write(':- dynamic the_Aircraft_on_profile/2.'),
       nl,
 
 
        write(':- prolog_flag(compiling, _, fastcode).'),
        nl,
        nl, !.


	

