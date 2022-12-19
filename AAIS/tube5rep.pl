
/* tube5.pl */

/* more sophisticated representation for tube station facts */

c(bank,moorgate,northern).
c(moorgate,bank,northern).
c(moorgate,old_street,northern).
c(old_street,moorgate,northern).
c(old_street,angel,northern).
c(angel,old_street,northern).
c(kings_cross,angel,northern).
c(angel,kings_cross,northern).


c(holborn,chancery_lane,central).
c(chancery_lane,holborn,central).
c(chancery_lane,st_pauls,central).
c(st_pauls,chancery_lane,central).
c(bank,st_pauls,central).
c(st_pauls,bank,central).


online(Station,Line) :- c(Station,_,Line).

/* rules about the underground network */

/* if Station1 and Station2 are on Line1
   then the sameline rule will succeed */

sameline(Station1,Station2,Line1) :-
	online(Station1,Line1),
	online(Station2,Line1).


/* if Line1 and Line2 both pass through
   Station1 then interchange will succeed   */

interchange(Line1,Line2,Station1) :-
	online(Station1,Line1),
	online(Station1,Line2),
        \+ ( Line1 = Line2 ).


route(Station1,Station2,_) :-
	sameline(Station1,Station2,Line1),
	nl,write('use '),write(Line1),write(' direct'),nl.

route(Station1,Station2,StationX) :-
	online(Station1,Line1),
	interchange(Line1,Line2,StationX),
	sameline(Station2,StationX,Line2),
	nl,write('take  '),write(Line1),write(' '),
	nl,write('change at '),write(StationX),
	nl,write('then take '),write(Line2),write(' ').


t1(X) :- route(holborn,angel,X).


/* utility procedure */

member(El,[El | Rest] ).
member(El,[_  | Rest] ) :- member(El,Rest).



