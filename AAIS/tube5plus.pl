
/* tube5.pl */

/* more sophisticated representation for tube station facts */


line(northern, 	 [london_bridge,
			bank,
			moorgate,
			old_street,
			angel,
			kings_cross,
			euston,
			camdon_town ]  ).

line(circle,	 [euston_square,
			kings_cross,
			farringdon,
			barbican,
			moorgate,
			liverpool_street ]  ).

line(central,	[ holborn,
			chancery_lane,
			st_pauls,
			bank,
			liverpool_street,
			bethnal_green ]   ).

line(piccadilly,[leicester_square,
			covent_garden,
			holborn,
			russel_square,
			kings_cross,
			caledonian_road ] ).


online(Station,Line) :- line(Line,Stationlist),
                        member(Station,Stationlist).

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


/* if we can travel direct from Station1
   to station2 then direct will succeed   */

direct(Station1,Station2) :-
	sameline(Station1,Station2,_).

/* this procedure writes to the screen
   simple routes between Station1 and
   Station2.                           */


route(Station1,Station2,_) :-
	sameline(Station1,Station2,Line1),
	nl,write('use '),write(Line1),write(' direct'),nl,
	nl,write('cost is '),
        cost(Station1,Station2,X),write(X),
        line(Line1,SL),
        position(Station1,SL,P1),
        position(Station2,SL,P2),
        P is abs(P2 - P1),
	nl,write('number of stops is '),
        write(P).

route(Station1,Station2,StationX) :-
	online(Station1,Line1),
	interchange(Line1,Line2,StationX),
	sameline(Station2,StationX,Line2),
	nl,write('take  '),write(Line1),write(' '),
	nl,write('change at '),write(StationX),
	nl,write('then take '),write(Line2),write(' '),
	nl,write('cost is '),
        cost(Station1,Station2,X),write(X),
        line(Line1,SL1),
        line(Line2,SL2),
        position(Station1,SL1,P1),
        position(StationX,SL1,PX),
        PI is abs(P1-PX),
        position(Station2,SL2,P2),
        position(StationX,SL2,PX1),
        PJ is abs(P2-PX1),
        P is PI+PJ,
	nl,write('number of stops is '),
        write(P).

position(X,[X|_],1). 
position(X,[_|Y],POS) :- 
       position(X,Y,POS1),
       POS is POS1+1,!.

/*  This procedure specifies that the cost of travel
    between two stations is 4 pounds if they are both in the central
     zone, or is 6 pounds otherwise.        */


cost(Station1,Station2,4) :-
		zone(Station1,centre),
		zone(Station2,centre).

cost(Station1,Station2,6).

zone(bank,centre).
zone(moorgate,centre).
zone(finsbury_park,centre).
zone(kings_cross,centre).
zone(angel,centre).
zone(barbican,centre).




t1(X) :- route(holborn,angel,X).


/* utility procedure */

member(El,[El | Rest] ).
member(El,[_  | Rest] ) :- member(El,Rest).



