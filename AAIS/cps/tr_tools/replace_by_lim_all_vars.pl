

% break down 'and's...
replace_one_label_by_limit_av(N, Labelled_body, New_body, ListAntes):-
 \+ Labelled_body =.. [';',X,Y],
    Labelled_body =.. [',',X,Y],
   replace_one_label_by_limit_av(N, X, Z1, ListAntes),
   replace_one_label_by_limit_av(N, Y, Z2, ListAntes),
   New_body =.. [',',Z1, Z2],!.


% break down 'or's...
replace_one_label_by_limit_av(N, Labelled_body, New_body,ListAntes):-
    Labelled_body =.. [';', X, Y],
  
   replace_one_label_by_limit_av(N, X, Z1, ListAntes),
   replace_one_label_by_limit_av(N, Y, Z2, ListAntes),
   New_body =.. [';', Z1, Z2],!.

% pass if not assertTL
replace_one_label_by_limit_av(N, Labelled_body, Labelled_body,ListAntes ):-
 \+ Labelled_body =.. [';',X,Y],
 \+ Labelled_body =.. [',',X,Y],
% new
  \+ (Labelled_body = assertLT(N, Bodies, Listvar)  ),!.
 
replace_one_label_by_limit_av(N, Labelled_body, New_body,[Ante|ListAntes] ):-
 \+ Labelled_body =.. [';',X,Y],
 \+ Labelled_body =.. [',',X,Y], 
  Labelled_body = assertLT(N, Bodies, Listvar),
 make_list_into_disjunction(ListAntes, Ante, New_body ),!.


replace_one_label_by_limit_av(N, Labelled_body, New_body,[Ante|ListAntes]) :-
  Labelled_body =.. [',', assertLT(N, Bodies, Listvar), RestBody],
%  Labelled_body =.. [',',  write_list_to_file(N, Var), RestBody],
  make_list_into_disjunction(ListAntes, Ante, TempBody),
  New_body  =.. [',', (TempBody), RestBody],!.
 
make_list_into_disjunction([], Body, Body) :- !.

make_list_into_disjunction([Ante|RestAntes], Body, NewBody):-
   Temp_body =.. [';', Ante, Body],
   make_list_into_disjunction(RestAntes, Temp_body, NewBody),!.

