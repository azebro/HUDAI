
/* Code solving Week 7 Tutorial Qs 2a and 2b */



/* state_data(Street, list of s(Stage,TurnRate, InterLength,MaxLen, MinLen) ) */

stage_data( main_street, [s(s1,0.6,0,70,50), s(s2,0.6,0,5,5),  s(s3,1.1,5,40,15),  s(s4,0.0,15,40,20) ] ).

current_length( main_street, [c(s1,55), c(s2,5),  c(s3,20),  c(s4,20) ] ).

/* finds the cycle length of signals at the end of Street */
cycle_length(Street,CL) :-
        stage_data(Street, D),
        current_length(Street, D1),
        add_length(D,D1,CL),!.

add_length([s(_,_,L,_,_)|R], [c(_,L1)|R1], CL) :-
        add_length(R,R1,Add1),
        CL is L+L1+Add1,!.
add_length([],[],0).

/* finds the average flow out of the end of Street */
average_flow_out(Street,AF) :-
        stage_data(Street, D),
        current_length(Street, D1),
        add_length(D,D1,CL),
        total_flow_out(D,D1,FL),
        AF is FL/CL,!.

total_flow_out([s(_,F,_,_,_)|R],[c(_,L)|R1],FL) :-
        total_flow_out(R,R1,FLT),
        FT is F*L,
        FL is FLT + FT,!.
total_flow_out([],[],0).

