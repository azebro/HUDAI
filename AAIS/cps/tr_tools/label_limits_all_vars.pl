/*
new code splits labelling:
(1) collects all limit vars for clause
add_label_after_each_limit_av/6
(2) writes list of these to file for each limit var occurence
add_label_for_write_vars
*/

add_label_after_each_limit_av(limitvar(N), Body, New_body, limitvar(N1), 
Inbodies, Outbodies, Listvarin, Listvarout):- 
 \+ Body =.. [';',X,Y],
    Body =.. [',',X,Y],
   add_label_after_each_limit_av(limitvar(N), X, Z1, limitvar(N2),
                                  Inbodies,Tempbodies,Listvarin,Templist),
   add_label_after_each_limit_av(limitvar(N2), Y, Z2, limitvar(N1),
                                  Tempbodies,Outbodies,Templist, Listvarout),
   New_body =.. [',',Z1, Z2].

add_label_after_each_limit_av(limitvar(N), Body, New_body, limitvar(N1),
                              Inbodies, Outbodies,Listvarin, Listvarout):-
    Body =.. [';', X, Y],
  
   add_label_after_each_limit_av(limitvar(N), X, Z1, limitvar(N2),
                                  Inbodies,Tempbodies,Listvarin,Templist),
   add_label_after_each_limit_av(limitvar(N2), Y, Z2, limitvar(N1),
                                  Tempbodies,Outbodies,Templist, Listvarout),
   New_body =.. [';', Z1, Z2].


add_label_after_each_limit_av(limitvar(N), Body, Body, limitvar(N), 
                            Inbodies,Inbodies,Listvarin, Listvarin ):-
 \+ Body =.. [';',X,Y],
 \+ Body =.. [',',X,Y],
     \+  has_limit(Body, _).
 
add_label_after_each_limit_av(limitvar(N), Body, New_body, limitvar(N1), 
                         Inbodies,[Body|Inbodies],Listvarin,[Var|Listvarin]):-
 \+ Body =.. [';',X,Y],
 \+ Body =.. [',',X,Y],
    has_limit(Body, Var),
     N1 is N + 1,
  add_antecedents_to_body( [ limitvar(N1) ], Body, New_body ),  
        nl, write('old body and new body'),nl,
        write(Body),nl,
        write(New_body),nl.


/* writes list of these to file for each limit var occurence
body has already been labelled  */
   
 add_label_for_write_vars( Body, New_body , 
                              Bodies,Listvar, N, N1 )   :-
    \+ Body =.. [';',X,Y],
    Body =.. [',',X,Y],
   add_label_for_write_vars(X, Z1, Bodies,Listvar,N,N2),
   add_label_for_write_vars( Y, Z2, Bodies,Listvar,N2,N1),
   New_body =.. [',',Z1, Z2].

add_label_for_write_vars( Body, New_body,Bodies,Listvar, N,  N1):-
    Body =.. [';', X, Y],
  
   add_label_for_write_vars( X, Z1,Bodies,Listvar, N,  N2),
   add_label_for_write_vars( Y, Z2, Bodies,Listvar, N2, N1),
   New_body =.. [';', Z1, Z2].


add_label_for_write_vars( Body, Body, Bodies,Listvar,N,  N):-
 \+ Body =.. [';',X,Y],
 \+ Body =.. [',',X,Y],
     \+  (Body = limitvar(N)).
 
add_label_for_write_vars( Body, New_body,  Bodies,Listvar, N, N1):-
 \+ Body =.. [';',X,Y],
 \+ Body =.. [',',X,Y],
    Body = limitvar(N),
      N1 is N + 1,
% mod tlm 8/3/99
   New_body =.. [',', limitvar(N),assertLT(N,Bodies,Listvar)].
   

assertLT(N,B,V) :- assert(limitval(N,V)),assert(limitbods(N,B)),!.

write_to_file(N, ListVar) :- write(limitval(N, ListVar)), write('.'), nl.
write_list_to_file(N, [H|T]) :-                                         
                     write('limitval('),
     write(N), write(', ['), write(H), write_list(T), write(']).'), nl.


     write_list([]).
   
     write_list([H|T]) :-
     write(','), write(H),   write_list(T).

     
has_limit(X, Var) :-
 X =.. [Name_ante,  Var, Limit],
 limits_clause( Name_ante ),!.
%  nonvar(Limit)!,.
 
