
read_in_state :- 
		initial(I), compile(I).

% 1. test with occ_link(hepton_south, V).
occ_link(L, V) :- 
       		init(_, _, _, DYN, _, _, _, _),
		member( equals(occupancy(L),V),DYN).

% 2. test with junction_name_end(hepton_south, J).
junction_name_end(L, J) :- 
       		init(_, _, _, _, STATICS, _, _, _),
		member( equals(turnrate(Stage,L,_),_), STATICS),
		member( contains(J, Stage), STATICS). 

% 3. test with stage_len(fox_stage0, SL).
stage_len(S, SL) :- 
       		init(_, _, _, _, _, PLAN, _, _),
		member(equals(defaultgreentime(S),SL), PLAN).

% 4. test with list_of_stages(fox, SList).
list_of_stages(J, SList) :- 
       		init(_, _, _, _, STATICS, _, _, _),
                get_stages(J,STATICS,  SList).
get_stages(_, [ ], [ ]).
get_stages(J, [contains(J,S)  | RestSTATICS],   [S | RestS] ) :-     		
		get_stages(J, RestSTATICS,  RestS),!.
get_stages(J, [ _ | RestSTATICS],   RestS ) :-      		
		get_stages(J, RestSTATICS,  RestS),!.

% 5. test with cyc_length(fox, CL).
cyc_length(J, CL) :- 
		init(_, _, _, _, STATICS, PLAN, _, _),
		get_cyc_length(J, PLAN, STATICS, 0,    CL).
get_cyc_length(_, [], _, CL,    CL).
get_cyc_length(J, [equals(defaultgreentime(S),SL) | RS], STATICS, CLx, CL) :-
		member( contains(J, S), STATICS),
     		member(equals(interlimit(S),V), STATICS),
                CLx1 is CLx + SL + V,
   		get_cyc_length(J,RS,STATICS, CLx1, CL),!.
get_cyc_length(J, [_ | RestS], STATICS, CLx, CL) :- 
		get_cyc_length(J, RestS, STATICS, CLx, CL),!.
 

% 6.  test with 
% total_flow_rate(hepton_south,fox_stage1, X).
% total_flow_rate(station_west,vocation_stage0, X).

total_flow_rate(L,S, FL) :-
      		init(_, _, _, _, STATICS, _, _, _),
		get_total_flow_rate(L,S,STATICS,0,  FL).

get_total_flow_rate(_,_, [], FL,    FL).
get_total_flow_rate(L,S, [ equals(turnrate(S,L,_),V) | RestS], FLx, FL) :-
                FLx1 is FLx + V,
   		get_total_flow_rate(L,S, RestS, FLx1, FL),!.
get_total_flow_rate(L,S, [_ | RestS], FLx, FL) :- 
		get_total_flow_rate(L,S, RestS, FLx, FL),!.


% 7. test with
% total_flow_out_cycle(station_west, FL).
% total_flow_out_cycle(hepton_south, FL).

total_flow_out_cycle(L, FL) :-
                junction_name_end(L, J),
		list_of_stages(J, SList),
                acculmulate_flow(L,SList, FL).

acculmulate_flow(L, [S | SR], FL) :-
		total_flow_rate(L,S, TFR),
                stage_len(S, STL),
                Stage_Flow is STL*TFR,
                acculmulate_flow(L,SR, FL1),
                FL is FL1 + Stage_Flow,
		!.
acculmulate_flow(_,[], 0). 


% 8. test with average_flow_out(hepton_south, X).
average_flow_out(L, AV) :-
		junction_name_end(L, J),
		cyc_length(J, CL),
		total_flow_out_cycle(L, FL),
		AV is FL/CL,
                !.
		
% 9. Week 10 / Q3: ADJUST_PLAN
% test with:
%
adjust_default_plan :-
                init(_, _, _, _, STATICS, PLAN, _, _),
                adjust_plan(station_west, PLAN,STATICS,  PLAN1),
                nl,write(PLAN1).

adjust_plan(BL, PLAN,STATICS,  PLAN1) :-
                occ_link(BL, OV),
% so we can test it in the initial state:
                OV > -20,
                junction_name_end(BL,J),
                list_of_stages(J,SList),
                member(S,SList),
% find any stage with Flow Out > 0 - in coursework there is only one with flow out > 0
                total_flow_rate(BL,S, FL),
                FL > 0,
% rest is taken from the "maximise" solution - Week 10
                member(equals(maxgreentime(S),MV),  STATICS),
                adjust_plan(BL, PLAN, STATICS, PLAN1)

% if code above fails .. return same plan.
adjust_plan(_, PLAN,_,  PLAN).
