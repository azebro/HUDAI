/********************************************************************/

% built_in(call(_)).
% 
% built_in(!).
% built_in(number(_)).
% built_in(_=_).
% built_in(_<_).
% built_in(_>_).
% built_in(_ is _).
% built_in(_=.._).
% built_in(write(_)).
% built_in(nl).
% built_in(_ == _).
% built_in(_ =< _).
% built_in(_ >= _).
% built_in(not__(_)).
% built_in(\+(_)).
% built_in(ground_not__(_)).

/********************************************************************/



/* rule_counter([1,1,1,1,2,3,1,1,1, 2], 
         [potential(1,7),
          potential(2,2),
          potential(3,1)
         ]).
*/

% rule_counter([],[]).
% 
% rule_counter([H|T],[potential(H,N)|Rest]):-
% 
% 	del(H,T,L),
% 	count(H,T,NT),
% 	N is NT + 1,
% 	rule_counter(L,Rest).

/********************************************************************/
