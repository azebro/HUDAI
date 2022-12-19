
/* tube5.pl */

/* more sophisticated representation for tube station facts */



n(bank,moorgate,northern).
n(moorgate,old_street,northern).
n(old_street,angel,northern).
n(angel,kings_cross,northern).

s(kings_cross,angel,northern).
s(angel,old_street,northern).
s(old_street,moorgate,northern).
s(moorgate,bank,northern).


n(holborn,chancery_lane,central).
n(chancery_lane,st_pauls,central).
n(st_pauls,bank,central).

s(bank,st_pauls,central).
s(st_pauls,chancery_lane,central).
s(chancery_lane,holborn,central).

online(Station,Line) :- n(Station,_,Line).
online(Station,Line) :- n(_,Station,Line).
online(Station,Line) :- s(Station,_,Line).
online(Station,Line) :- s(_,Station,Line).

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
	nl,write("use "),write(Line1),write(" direct"),nl. 

route(Station1,Station2,StationX) :-
	online(Station1,Line1),
	interchange(Line1,Line2,StationX),
	sameline(Station2,StationX,Line2),
	nl,write("take  "),write(Line1),write(" "),
	nl,write("change at "),write(StationX),
	nl,write("then take "),write(Line2),write(" "),
        count(Station1,StationX,Line1,C),
        count(StationX,Station2,Line2,C1),nl,write(C),nl,write(C1).

count(X,Y,L,N) :- count_up(X,Y,L,N),!.
count(X,Y,L,N) :- count_down(X,Y,L,N),!.

count_up(X,Y,L,1) :- n(X,Y,L),!.
count_up(X,Y,L,N) :- n(X,Z,L), count_up(Z,Y,L,N1),N is N1+1,!.
count_down(X,Y,L,1) :- s(Y,X,L),!.
count_down(X,Y,L,N) :- s(Z,X,L), count_down(Z,Y,L,N1),N is N1+1,!.


t1(X) :- route(holborn,angel,X).


/* utility procedure */

member(El,[El | Rest] ).
member(El,[_  | Rest] ) :- member(El,Rest).



