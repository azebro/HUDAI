:- unknown(_,fail).
:- multifile the_Aircraft_on_profile/2.
:- dynamic the_Aircraft_on_profile/2.
:- prolog_flag(compiling, _, fastcode).

profiles_are_in_oceanic_conflict(Segment1,Profile1,Segment2,Profile2):-
    Segment1 belongs_to Profile1,
    Segment2 belongs_to Profile2,
    segments_are_in_oceanic_conflict(Segment1,Segment2),
    !.

segments_are_in_oceanic_conflict(Segment1,Segment2):-
    are_in_vertical_oceanic_conflict(Segment1,Segment2),
    are_in_lateral_and_longitudinal_oceanic_conflict(Segment1,Segment2),
    !.

are_in_vertical_oceanic_conflict(Segment1,Segment2):-
    the_min_entry_Flight_level_of(Segment1,Flight_level3),
    Flight_level1=Flight_level3,
    the_max_entry_Flight_level_of(Segment2,Flight_level4),
    Flight_level2=Flight_level4,
    Flight_level1 is_at_or_above Flight_level2,
    the_Val_in_feet_of(Flight_level1,Val1),
    the_Val_in_feet_of(Flight_level2,Val2),
    Val3 is Val1-Val2,
    Val3<2000,
    !.

are_in_vertical_oceanic_conflict(Segment1,Segment2):-
    the_min_entry_Flight_level_of(Segment1,Flight_level3),
    Flight_level1=Flight_level3,
    the_max_entry_Flight_level_of(Segment2,Flight_level4),
    Flight_level2=Flight_level4,
    Flight_level2 is_above Flight_level1,
    the_Val_in_feet_of(Flight_level2,Val1),
    the_Val_in_feet_of(Flight_level1,Val2),
    Val3 is Val1-Val2,
    Val3<2000,
    !.

are_in_lateral_and_longitudinal_oceanic_conflict(Segment1,Segment2):-
    the_entry_4D_pt_of(Segment1,Four_D_pt1),
    the_2D_pt_of_4D_pt(Four_D_pt1,Two_D_pt3),
    Two_D_pt1=Two_D_pt3,
    the_entry_4D_pt_of(Segment2,Four_D_pt2),
    the_2D_pt_of_4D_pt(Four_D_pt2,Two_D_pt4),
    Two_D_pt2=Two_D_pt4,
    the_nm_linear_dist_Val_between_2D_pts(Two_D_pt1,Two_D_pt2,Val1),
    Val1<100,
    !.

the_min_entry_Flight_level_of(Segment,Flight_level1):-
    the_entry_Flight_level_range_of(Segment,Flight_level_range1),
    the_min_Flight_level_of_fl_range(Flight_level_range1,Flight_level1),
    !.

the_min_Flight_level_of_fl_range(fl_range(Flight_level1,Flight_level2),Flight_level1):-
    Flight_level1 is_at_or_below Flight_level2,
    !.

the_min_Flight_level_of_fl_range(fl_range(Flight_level1,Flight_level2),Flight_level2):-
    Flight_level2 is_at_or_below Flight_level1,
    !.

the_max_entry_Flight_level_of(Segment,Flight_level1):-
    the_entry_Flight_level_range_of(Segment,Flight_level_range1),
    the_max_Flight_level_of_fl_range(Flight_level_range1,Flight_level1),
    !.

the_max_Flight_level_of_fl_range(fl_range(Flight_level1,Flight_level2),Flight_level1):-
    Flight_level1 is_at_or_above Flight_level2,
    !.

the_max_Flight_level_of_fl_range(fl_range(Flight_level1,Flight_level2),Flight_level2):-
    Flight_level2 is_at_or_above Flight_level1,
    !.

Flight_level1 is_at_or_below Flight_level2:-
    the_Val_in_100s_of_feet_of(Flight_level1,Val1),
    the_Val_in_100s_of_feet_of(Flight_level2,Val2),
    Val1=<Val2,
    !.

Flight_level1 is_above Flight_level2:-
    the_Val_in_100s_of_feet_of(Flight_level1,Val1),
    the_Val_in_100s_of_feet_of(Flight_level2,Val2),
    Val1>Val2,
    !.

Flight_level1 is_at_or_above Flight_level2:-
    the_Val_in_100s_of_feet_of(Flight_level1,Val1),
    the_Val_in_100s_of_feet_of(Flight_level2,Val2),
    Val1>=Val2,
    !.

the_Val_in_100s_of_feet_of(fl(Int_0_to_1000),Int_0_to_1000).

the_entry_Flight_level_range_of(Segment,Flight_level_range1):-
    the_entry_4D_pt_of(Segment,Four_D_pt1),
    the_Flight_level_range_of_4D_pt(Four_D_pt1,Flight_level_range1),
    !.

the_entry_4D_pt_of(the_Segment(Profile,Four_D_pt1,Four_D_pt2,Val),Four_D_pt1).

the_Flight_level_range_of_4D_pt(Four_D_pt,Flight_level_range1):-
    the_3D_pt_of(Four_D_pt,Three_D_pt1),
    the_Flight_level_range_of_3D_pt(Three_D_pt1,Flight_level_range1),
    !.

the_Flight_level_range_of_3D_pt(threeD_pt(Two_D_pt,Flight_level_range),Flight_level_range).

Flight_level1 is_above Flight_level2:-
    the_Val_in_100s_of_feet_of(Flight_level1,Val1),
    the_Val_in_100s_of_feet_of(Flight_level2,Val2),
    Val1>Val2,
    !.

the_Val_in_feet_of(fl(Int_0_to_1000),Val1):-
    Val1 is 100*Int_0_to_1000,
    !.

the_nm_linear_dist_Val_between_2D_pts(Two_D_pt1,Two_D_pt2,Val6):-
    the_lat_Val_in_arc_mins_of(Two_D_pt1,Val1),
    the_lat_Val_in_arc_mins_of(Two_D_pt2,Val2),
    the_long_Val_in_arc_mins_of(Two_D_pt1,Val3),
    the_long_Val_in_arc_mins_of(Two_D_pt2,Val4),
    the_long_arc_mins_dist_Val_between(Val3,Val4,Val5),
    Val6 is sqrt(exp(Val1-Val2,2)+exp(Val5,2)),
    !.

the_long_arc_mins_dist_Val_between(Val1,Val2,Val5):-
    0=<Val1,
    Val1<21600,
    0=<Val2,
    Val2<21600,
    the_long_arc_mins_eastward_Val_from(Val1,Val2,Val3),
    the_long_arc_mins_westward_Val_from(Val1,Val2,Val4),
    Val5 is min(Val3,Val4),
    !.

the_long_arc_mins_eastward_Val_from(Val1,Val2,Val3):-
    0=<Val1,
    Val1<21600,
    0=<Val2,
    Val2<21600,
    Val3 is max(Val2-Val1,round(Val2+(21600-Val1))mod 21600),
    !.

the_long_arc_mins_westward_Val_from(Val1,Val2,Val3):-
    0=<Val1,
    Val1<21600,
    0=<Val2,
    Val2<21600,
    the_long_arc_mins_eastward_Val_from(Val2,Val1,Val3),
    !.

the_lat_Val_in_arc_mins_of(Two_D_pt,Val1):-
    the_Lat_of_2D_pt(Two_D_pt,Lat1),
    the_total_Val_in_arc_mins_of_lat(Lat1,Val1),
    !.

the_long_Val_in_arc_mins_of(Two_D_pt,Val1):-
    the_Long_of_2D_pt(Two_D_pt,Long1),
    the_total_Val_in_arc_mins_of_long(Long1,Val1),
    !.

the_total_Val_in_arc_mins_of_lat(lat_N(Int_0_to_90),Val1):-
    Val1 is Int_0_to_90*60,
    !.

the_total_Val_in_arc_mins_of_lat(lat_S(Int_0_to_90),Val1):-
    Int_0_to_90*60-Val1,
    !.

the_total_Val_in_arc_mins_of_lat(lat_N(Int_0_to_89,Int_0_to_59),Val1):-
    Val1 is Int_0_to_89*60+Int_0_to_59,
    !.

the_total_Val_in_arc_mins_of_lat(lat_S(Int_0_to_89,Int_0_to_59),Val1):-
    Val1 is-(Int_0_to_89*60)-Int_0_to_59,
    !.

the_total_Val_in_arc_mins_of_long(long_E(Int_0_to_180),Val1):-
    Val1 is Int_0_to_180*60,
    !.

the_total_Val_in_arc_mins_of_long(long_W(Int_0_to_180),Val1):-
    Val1 is(21600-Int_0_to_180*60)mod 21600,
    !.

the_total_Val_in_arc_mins_of_long(long_E(Int_0_to_179,Int_0_to_59),Val1):-
    Val1 is Int_0_to_179*60+Int_0_to_59,
    !.

the_total_Val_in_arc_mins_of_long(long_W(Int_0_to_179,Int_0_to_59),Val1):-
    Val1 is(21600-(Int_0_to_179*60-Int_0_to_59))mod 21600,
    !.

the_Lat_of_2D_pt(twoD_pt(Lat,Long),Lat).

the_Long_of_2D_pt(twoD_pt(Lat,Long),Long).

the_2D_pt_of_3D_pt(threeD_pt(Two_D_pt,Flight_level_range),Two_D_pt).

the_2D_pt_of_4D_pt(Four_D_pt,Two_D_pt1):-
    the_3D_pt_of(Four_D_pt,Three_D_pt1),
    the_2D_pt_of_3D_pt(Three_D_pt1,Two_D_pt1),
    !.

the_3D_pt_of(fourD_pt(Three_D_pt,Time),Three_D_pt).

is_the_max_flight_level_for(fl(1000),shanwick).

is_the_min_flight_level_for(fl(55),shanwick).

are_vertices_for(twoD_pt(lat_N(61),long_W(30)),twoD_pt(lat_N(61),long_W(10)),shanwick).

are_vertices_for(twoD_pt(lat_N(61),long_W(10)),twoD_pt(lat_N(54,34),long_W(10)),shanwick).

are_vertices_for(twoD_pt(lat_N(54,34),long_W(10)),twoD_pt(lat_N(54),long_W(15)),shanwick).

are_vertices_for(twoD_pt(lat_N(54),long_W(15)),twoD_pt(lat_N(49),long_W(15)),shanwick).

are_vertices_for(twoD_pt(lat_N(49),long_W(15)),twoD_pt(lat_N(48,30),long_W(8)),shanwick).

are_vertices_for(twoD_pt(lat_N(48,30),long_W(8)),twoD_pt(lat_N(45),long_W(8)),shanwick).

are_vertices_for(twoD_pt(lat_N(45),long_W(8)),twoD_pt(lat_N(45),long_W(30)),shanwick).

are_vertices_for(twoD_pt(lat_N(45),long_W(30)),twoD_pt(lat_N(61),long_W(30)),shanwick).

is_the_max_flight_level_for(fl(1000),oceanic).

is_the_min_flight_level_for(fl(55),oceanic).

are_vertices_for(twoD_pt(lat_N(61),long_W(30)),twoD_pt(lat_N(61),long_W(10)),oceanic).

are_vertices_for(twoD_pt(lat_N(61),long_W(10)),twoD_pt(lat_N(54,34),long_W(10)),oceanic).

are_vertices_for(twoD_pt(lat_N(54,34),long_W(10)),twoD_pt(lat_N(54),long_W(15)),oceanic).

are_vertices_for(twoD_pt(lat_N(54),long_W(15)),twoD_pt(lat_N(49),long_W(15)),oceanic).

are_vertices_for(twoD_pt(lat_N(49),long_W(15)),twoD_pt(lat_N(48,30),long_W(8)),oceanic).

are_vertices_for(twoD_pt(lat_N(48,30),long_W(8)),twoD_pt(lat_N(45),long_W(8)),oceanic).

are_vertices_for(twoD_pt(lat_N(45),long_W(8)),twoD_pt(lat_N(45),long_W(30)),oceanic).

are_vertices_for(twoD_pt(lat_N(45),long_W(30)),twoD_pt(lat_N(61),long_W(30)),oceanic).

is_the_max_flight_level_for(fl(400),mnps).

is_the_min_flight_level_for(fl(275),mnps).

is_a_turbo_type(ac6t).

is_a_piston_type(ac56).

is_a_turbo_type(atla).

is_a_jet_type(b52).

is_a_jet_type(b707).

is_a_jet_type(b727).

is_a_jet_type(b737).

is_a_jet_type(b73s).

is_a_jet_type(b747).

is_a_jet_type(b74f).

is_a_jet_type(b74s).

is_a_jet_type(b757).

is_a_jet_type(b767).

is_a_jet_type(ba11).

is_a_turbo_type(ba31).

is_a_turbo_type(ba32).

is_a_jet_type(ba46).

is_a_turbo_type(be20).

is_a_turbo_type(be30).

is_a_turbo_type(c2).

is_a_jet_type(c5a).

is_a_jet_type(c9).

is_a_turbo_type(c12).

is_a_jet_type(ca20a).

is_a_jet_type(c21).

is_a_turbo_type(c130).

is_a_jet_type(c135).

is_a_jet_type(c137).

is_a_jet_type(c140).

is_a_jet_type(c141).

is_a_piston_type(c404).

is_a_turbo_type(c441).

is_a_jet_type(c500).

is_a_jet_type(conc).

is_a_jet_type(cl60).

is_a_jet_type(cl65).

is_a_jet_type(da20).

is_a_jet_type(da50).

is_a_jet_type(da90).

is_a_jet_type(dc8).

is_a_jet_type(dc8s).

is_a_jet_type(dc86).

is_a_jet_type(dc9).

is_a_jet_type(dc10).

is_a_turbo_type(dh4).

is_a_turbo_type(dh5).

is_a_turbo_type(dh7).

is_a_turbo_type(dh8).

is_a_jet_type(ea30).

is_a_jet_type(ea31).

is_a_jet_type(ea32).

is_a_jet_type(ea33).

is_a_jet_type(ea34).

is_a_jet_type(e3a).

is_a_jet_type(e4a).

is_a_jet_type(e6).

is_a_jet_type(f111).

is_a_jet_type(f4).

is_a_jet_type(f14).

is_a_jet_type(f15).

is_a_jet_type(f16).

is_a_jet_type(f18).

is_a_jet_type(fk28).

is_a_jet_type(g2).

is_a_jet_type(g3).

is_a_jet_type(g4).

is_a_jet_type(har).

is_a_jet_type(hs25).

is_a_turbo_type(hs74).

is_a_jet_type(il62).

is_a_jet_type(il86).

is_a_jet_type(kc10).

is_a_jet_type(kc35).

is_a_jet_type(l101).

is_a_jet_type(l329).

is_a_jet_type(lr35).

is_a_jet_type(lr55).

is_a_jet_type(md11).

is_a_jet_type(md80).

is_a_jet_type(mrc).

is_a_jet_type(n265).

is_a_turbo_type(nd16).

is_a_jet_type(nim).

is_a_turbo_type(p140).

is_a_turbo_type(p3).

is_a_turbo_type(p3c).

is_a_piston_type(pa30).

is_a_piston_type(pa31).

is_a_piston_type(pa34).

is_a_turbo_type(pa42).

is_a_piston_type(pa60).

is_a_jet_type(tu34).

is_a_jet_type(t39).

is_a_jet_type(vc10).

is_a_jet_type(vctr).

is_a_jet_type(u2).

is_a_jet_type(typ1).

is_a_jet_type(typ2).

is_a_jet_type(typ3).

is_a_turbo_type(typ4).

is_a_piston_type(typ5).

is_a_jet_type(typ6).

is_a_turbo_type(typ7).

is_a_jet_type(c5).

is_a_jet_type(an4).

is_a_prox_airfield_pt(twoD_pt(lat_N(67,1),long_W(50,41))).

is_a_prox_airfield_pt(twoD_pt(lat_N(63,59),long_W(22,36))).

is_a_prox_airfield_pt(twoD_pt(lat_N(63,59),long_W(22,36))).

is_a_prox_airfield_pt(twoD_pt(lat_N(63,45),long_W(68,33))).

is_a_prox_airfield_pt(twoD_pt(lat_N(44,53),long_W(63,31))).

is_a_prox_airfield_pt(twoD_pt(lat_N(48,33),long_W(58,33))).

is_a_prox_airfield_pt(twoD_pt(lat_N(45,41),long_W(74,2))).

is_a_prox_airfield_pt(twoD_pt(lat_N(45,19),long_W(75,40))).

is_a_prox_airfield_pt(twoD_pt(lat_N(46,48),long_W(71,24))).

is_a_prox_airfield_pt(twoD_pt(lat_N(48,56),long_W(54,34))).

is_a_prox_airfield_pt(twoD_pt(lat_N(53,19),long_W(60,26))).

is_a_prox_airfield_pt(twoD_pt(lat_N(47,37),long_W(52,45))).

is_a_prox_airfield_pt(twoD_pt(lat_N(43,41),long_W(79,38))).

is_a_prox_airfield_pt(twoD_pt(lat_N(45,28),long_W(73,45))).

is_a_prox_airfield_pt(twoD_pt(lat_N(50,54),long_E(4,32))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,12),long_E(2,52))).

is_a_prox_airfield_pt(twoD_pt(lat_N(49,57),long_E(6,34))).

is_a_prox_airfield_pt(twoD_pt(lat_N(49,59),long_E(6,42))).

is_a_prox_airfield_pt(twoD_pt(lat_N(50,2),long_E(8,34))).

is_a_prox_airfield_pt(twoD_pt(lat_N(49,57),long_E(7,16))).

is_a_prox_airfield_pt(twoD_pt(lat_N(48,22),long_E(7,50))).

is_a_prox_airfield_pt(twoD_pt(lat_N(49,26),long_E(7,36))).

is_a_prox_airfield_pt(twoD_pt(lat_N(53,46),long_E(8,40))).

is_a_prox_airfield_pt(twoD_pt(lat_N(50,2),long_E(8,34))).

is_a_prox_airfield_pt(twoD_pt(lat_N(53,38),long_E(9,59))).

is_a_prox_airfield_pt(twoD_pt(lat_N(50,52),long_E(7,9))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,17),long_E(6,45))).

is_a_prox_airfield_pt(twoD_pt(lat_N(48,41),long_E(9,12))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,55),long_E(8,18))).

is_a_prox_airfield_pt(twoD_pt(lat_N(52,28),long_E(9,41))).

is_a_prox_airfield_pt(twoD_pt(lat_N(54,34),long_W(6,13))).

is_a_prox_airfield_pt(twoD_pt(lat_N(52,27),long_W(1,45))).

is_a_prox_airfield_pt(twoD_pt(lat_N(53,21),long_W(2,16))).

is_a_prox_airfield_pt(twoD_pt(lat_N(50,26),long_W(5,0))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,30),long_W(1,59))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,9),long_W(1,45))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,24),long_W(3,21))).

is_a_prox_airfield_pt(twoD_pt(lat_N(53,21),long_W(2,53))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,53),long_W(0,22))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,9),long_W(0,11))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,28),long_W(0,27))).

is_a_prox_airfield_pt(twoD_pt(lat_N(53,52),long_W(1,39))).

is_a_prox_airfield_pt(twoD_pt(lat_N(55,2),long_W(1,41))).

is_a_prox_airfield_pt(twoD_pt(lat_N(52,50),long_W(1,19))).

is_a_prox_airfield_pt(twoD_pt(lat_N(57,12),long_W(2,12))).

is_a_prox_airfield_pt(twoD_pt(lat_N(55,57),long_W(4,26))).

is_a_prox_airfield_pt(twoD_pt(lat_N(55,57),long_W(3,22))).

is_a_prox_airfield_pt(twoD_pt(lat_N(55,30),long_W(4,35))).

is_a_prox_airfield_pt(twoD_pt(lat_N(58,13),long_W(6,20))).

is_a_prox_airfield_pt(twoD_pt(lat_N(55,29),long_W(5,41))).

is_a_prox_airfield_pt(twoD_pt(lat_N(57,36),long_W(3,33))).

is_a_prox_airfield_pt(twoD_pt(lat_N(56,22),long_W(2,51))).

is_a_prox_airfield_pt(twoD_pt(lat_N(57,43),long_W(3,20))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,53),long_W(0,14))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,56),long_W(1,15))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,17),long_W(0,46))).

is_a_prox_airfield_pt(twoD_pt(lat_N(52,25),long_E(0,34))).

is_a_prox_airfield_pt(twoD_pt(lat_N(52,22),long_E(0,29))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,41),long_W(1,47))).

is_a_prox_airfield_pt(twoD_pt(lat_N(52,5),long_E(1,24))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,45),long_W(1,35))).

is_a_prox_airfield_pt(twoD_pt(lat_N(52,22),long_W(0,13))).

is_a_prox_airfield_pt(twoD_pt(lat_N(53,18),long_W(0,33))).

is_a_prox_airfield_pt(twoD_pt(lat_N(52,18),long_E(4,46))).

is_a_prox_airfield_pt(twoD_pt(lat_N(50,55),long_E(5,46))).

is_a_prox_airfield_pt(twoD_pt(lat_N(52,10),long_E(4,25))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,58),long_E(4,27))).

is_a_prox_airfield_pt(twoD_pt(lat_N(51,53),long_W(8,30))).

is_a_prox_airfield_pt(twoD_pt(lat_N(53,26),long_W(6,15))).

is_a_prox_airfield_pt(twoD_pt(lat_N(53,55),long_W(8,49))).

is_a_prox_airfield_pt(twoD_pt(lat_N(52,47),long_W(8,55))).

is_a_prox_airfield_pt(twoD_pt(lat_N(49,37),long_E(6,12))).

is_a_prox_airfield_pt(twoD_pt(lat_N(60,17),long_E(5,13))).

is_a_prox_airfield_pt(twoD_pt(lat_N(58,53),long_E(5,38))).

is_a_prox_airfield_pt(twoD_pt(lat_N(38,49),long_W(76,52))).

is_a_prox_airfield_pt(twoD_pt(lat_N(39,11),long_W(76,40))).

is_a_prox_airfield_pt(twoD_pt(lat_N(41,56),long_W(72,41))).

is_a_prox_airfield_pt(twoD_pt(lat_N(44,48),long_W(68,50))).

is_a_prox_airfield_pt(twoD_pt(lat_N(41,23),long_W(71,8))).

is_a_prox_airfield_pt(twoD_pt(lat_N(42,56),long_W(78,44))).

is_a_prox_airfield_pt(twoD_pt(lat_N(39,11),long_W(76,40))).

is_a_prox_airfield_pt(twoD_pt(lat_N(39,8),long_W(75,28))).

is_a_prox_airfield_pt(twoD_pt(lat_N(40,42),long_W(74,10))).

is_a_prox_airfield_pt(twoD_pt(lat_N(38,57),long_W(77,24))).

is_a_prox_airfield_pt(twoD_pt(lat_N(43,6),long_W(78,57))).

is_a_prox_airfield_pt(twoD_pt(lat_N(40,38),long_W(73,46))).

is_a_prox_airfield_pt(twoD_pt(lat_N(36,56),long_W(76,17))).

is_a_prox_airfield_pt(twoD_pt(lat_N(43,54),long_W(69,57))).

is_a_prox_airfield_pt(twoD_pt(lat_N(44,39),long_W(73,28))).

is_a_prox_airfield_pt(twoD_pt(lat_N(39,52),long_W(75,15))).

is_a_prox_airfield_pt(twoD_pt(lat_N(43,5),long_W(70,49))).

is_a_prox_airfield_pt(twoD_pt(lat_N(41,43),long_W(71,25))).

is_a_prox_airfield_pt(twoD_pt(lat_N(40,51),long_W(74,4))).

is_a_prox_airfield_pt(twoD_pt(lat_N(40,1),long_W(74,36))).

is_a_prox_airfield_pt(twoD_pt(lat_N(41,18),long_E(2,5))).

is_a_prox_airfield_pt(twoD_pt(lat_N(38,52),long_E(1,21))).

is_a_prox_airfield_pt(twoD_pt(lat_N(40,28),long_W(3,33))).

is_a_prox_airfield_pt(twoD_pt(lat_N(36,41),long_W(4,30))).

is_a_prox_airfield_pt(twoD_pt(lat_N(39,33),long_E(2,44))).

is_a_prox_airfield_pt(twoD_pt(lat_N(42,54),long_W(8,25))).

is_a_prox_airfield_pt(twoD_pt(lat_N(40,29),long_W(3,27))).

is_a_prox_airfield_pt(twoD_pt(lat_N(37,25),long_W(5,54))).

is_a_prox_airfield_pt(twoD_pt(lat_N(44,52),long_W(0,42))).

is_a_prox_airfield_pt(twoD_pt(lat_N(45,44),long_E(5,5))).

is_a_prox_airfield_pt(twoD_pt(lat_N(43,40),long_E(7,13))).

is_a_prox_airfield_pt(twoD_pt(lat_N(48,58),long_E(2,27))).

is_a_prox_airfield_pt(twoD_pt(lat_N(48,43),long_E(2,23))).

is_a_prox_airfield_pt(twoD_pt(lat_N(49,1),long_E(2,33))).

is_a_prox_airfield_pt(twoD_pt(lat_N(48,26),long_W(4,25))).

is_a_prox_airfield_pt(twoD_pt(lat_N(47,46),long_W(3,26))).

is_a_prox_airfield_pt(twoD_pt(lat_N(47,14),long_W(1,36))).

is_a_prox_airfield_pt(twoD_pt(lat_N(50,33),long_E(3,5))).

is_a_prox_airfield_pt(twoD_pt(lat_N(47,35),long_E(7,32))).

is_a_prox_airfield_pt(twoD_pt(lat_N(45,38),long_E(8,44))).

is_a_prox_airfield_pt(twoD_pt(lat_N(45,12),long_E(7,39))).

is_a_prox_airfield_pt(twoD_pt(lat_N(44,24),long_E(8,51))).

is_a_prox_airfield_pt(twoD_pt(lat_N(36,58),long_W(25,10))).

is_a_prox_airfield_pt(twoD_pt(lat_N(37,0),long_W(7,58))).

is_a_prox_airfield_pt(twoD_pt(lat_N(38,46),long_W(27,6))).

is_a_prox_airfield_pt(twoD_pt(lat_N(38,46),long_W(9,8))).

is_a_prox_airfield_pt(twoD_pt(lat_N(46,16),long_E(6,7))).

is_a_prox_airfield_pt(twoD_pt(lat_N(47,27),long_E(8,33))).

is_a_prox_airfield_pt(twoD_pt(lat_N(36,9),long_W(5,21))).

