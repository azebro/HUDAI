:- unknown(_,fail).
:- multifile the_Aircraft_on_profile/2.
:- dynamic the_Aircraft_on_profile/2.
:- dynamic clause_impress/4.
:- prolog_flag(compiling, _, fastcode).

/* undefined predicates in current version of cps */
:- dynamic is_wholly_outside_oca/1.
:- dynamic  the_linear_tracks_of_cross/2.

:- dynamic is_a_min_long_sep_value_in_mins_entered_via_the_mst_command/2.

:- dynamic if_are_on_profiles_which_diverge_then_longitudinal_separation_is_at_least_5_mins_where_lateral_separation_of_60nm_is_achieved/2.


:- dynamic is_at_or_is_east_of_the_eastern_Shanwick_OCA_boundary/1.
:- dynamic is_east_of_the_eastern_Shanwick_OCA_boundary/1.

/* defined in current version */


:- dynamic profiles_are_in_oceanic_conflict/4.
:- dynamic segments_are_in_oceanic_conflict/2.
:- dynamic are_subject_to_oceanic_cpr/2.
:- dynamic oceanic_separation_rules_are_applicable_to/1.
:- dynamic starts_at_or_after_first_recognised_pt_for_oceanic_cpr/1.
:- dynamic ends_at_or_before_last_recognised_pt_for_oceanic_cpr/1.
:- dynamic are_in_vertical_oceanic_conflict/2.
:- dynamic are_in_lateral_and_longitudinal_oceanic_conflict/2.
:- dynamic box_conflict_exists_between_linear_tracks_of_at_some_time_at_or_between/4.
:- dynamic box_conflict_exists_between_linear_tracks_of_at/3.
:- dynamic the_overlap_window_start_Time_for/3.
:- dynamic the_overlap_window_end_Time_for/3.
:- dynamic is_within_conflict_box_of/2.
:- dynamic the_required_lateral_half_box_dimension_Val_for_wrt/3.
:- dynamic the_required_longitudinal_half_box_dimension_Val_for_wrt/3.
:- dynamic the_time_gap_Val_in_mins_between/3.
:- dynamic the_min_vertical_sep_Val_in_feet_required_for/5.
:- dynamic the_min_lateral_sep_Val_in_nm_required_for/3.
:- dynamic steep/1.
:- dynamic are_deemed_to_be_laterally_separated/2.
:- dynamic are_westerly_and_deemed_to_be_laterally_separated/2.
:- dynamic are_easterly_and_deemed_to_be_laterally_separated/2.
:- dynamic the_min_longitudinal_sep_Val_in_mins_required_for/3.
:- dynamic the_prox_airfield_long_sep_adjustment_Val_in_mins_required_for/3.
:- dynamic reduced_separation_conditions_apply_to/2.
:- dynamic the_basic_min_longitudinal_sep_Val_in_mins_required_for/3.
:- dynamic both_are_flown_in_level_flight/2.
:- dynamic one_or_both_of_is_not_flown_in_level_flight/2.
:- dynamic are_cruise_climbed/2.
:- dynamic are_not_cruise_climbed/2.
:- dynamic or_cruise_climbed/2.
:- dynamic both_are_at_or_below/3.
:- dynamic both_are_above/3.
:- dynamic one_or_both_are_at_or_below/3.
:- dynamic one_or_both_are_above/3.
:- dynamic is_flown_in_level_flight/1.
:- dynamic both_are_flown_at_supersonic_speed/2.
:- dynamic one_or_both_of_are_flown_at_subsonic_speed/2.
:- dynamic both_are_flown_at_subsonic_speed/2.
:- dynamic one_or_both_of_are_flown_at_supersonic_speed/2.
:- dynamic both_are_flown_at_the_same_mach_number/2.
:- dynamic both_are_flown_at_the_same_mach_number_in_level_flight/2.
:- dynamic are_jets/2.
:- dynamic meet_mnps/2.
:- dynamic one_or_both_do_not_meet_mnps/2.
:- dynamic both_aircraft_on_are_grounded_at_prox_airfields_at_time_of_current_conflict_probe/2.
:- dynamic only_one_of_the_aircraft_on_is_grounded_at_a_prox_airfield_at_time_of_current_conflict_probe/2.
:- dynamic neither_of_the_aircraft_on_is_grounded_at_prox_airfields_at_time_of_current_conflict_probe/2.
:- dynamic aircraft_on_is_grounded_at_a_prox_airfield_at_time_of_current_conflict_probe/1.
:- dynamic are_wholly_or_partly_in_the_mnps_airspace/2.
:- dynamic one_or_both_of_is_wholly_outside_the_mnps_airspace/2.
:- dynamic are_wholly_within_the_mnps_airspace/2.
:- dynamic one_or_both_of_finish_at_or_after/3.
:- dynamic both_finish_before/3.
:- dynamic is_in_overlap_time_window_for/3.
:- dynamic min_flight_level_of_upper_segment_of_is_above_max_flight_level_of_lower_segment_by_less_than_required_min_vert_sep/2.
:- dynamic abs_magnitude_of_lat_over_long_gradient_of_exceeds/2.
:- dynamic position_on_linear_track_of_at_is/3.
:- dynamic is_on_linear_track_or_extended_linear_track_of_at_the_intersection_with_longitude_coord/3.
:- dynamic the_lat_Val_on_linear_track_of_at/3.
:- dynamic is_on_linear_track_or_extended_linear_track_of_at_the_intersection_with_latitude_coord/3.
:- dynamic are_separated_by_at_least_one_degree/2.
:- dynamic the_linear_tracks_of_continuously_diverge_to_provide_at_least_120NM_separation_by_20_degrees_west/2.
:- dynamic the_linear_tracks_of_are_separated_by_at_least_120NM_at_20_degrees_west/2.
:- dynamic is_a_2D_pt_west_of_the_eastern_Shanwick_OCA_boundary/1.
:- dynamic is_at_the_last_recognised_pt_for_oceanic_cpr_of/2.
:- dynamic are_laterally_separated_at_the_eastern_Shanwick_OCA_boundary/2.
:- dynamic are_not_cleared_to_the_same_last_recognised_pt/2.
:- dynamic the_linear_tracks_of_diverge_continuously/2.
:- dynamic the_linear_tracks_of_diverge/2.
:- dynamic is_on_the_linear_track_of/2.
:- dynamic are_after_a_common_pt_from_which_profile_tracks_are_same_or_diverging_thereafter_and_at_which_both_aircraft_have_already_reported_by/3.
:- dynamic the_preceding_aircraft_on_or_on_is_not_faster_by_or_more/3.
:- dynamic the_aircraft_on_segment1_precedes_the_aircraft_on_segment2/2.
:- dynamic the_preceding_aircraft_on_or_on_is_faster_by/3.
:- dynamic the_preceding_aircraft_on_or_on_is_faster_by_at_least/3.
:- dynamic the_preceding_aircraft_on_or_on_is_faster_by_at_least_mach_but_not_more_than/4.
:- dynamic are_after_a_common_pt_from_which_profile_tracks_are_same_thereafter/2.
:- dynamic are_after_a_common_pt_from_which_profile_tracks_are_diverging_thereafter/2.
:- dynamic the_linear_tracks_of_are_the_same/2.
:- dynamic are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_same_or_diverging_thereafter/2.
:- dynamic are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_same_thereafter/2.
:- dynamic are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_diverging_thereafter/2.
:- dynamic is_on_the_Shanwick_OCA_boundary/1.
:- dynamic is_on_the_eastern_boundary_of_the_Shanwick_OCA/1.
:- dynamic is_on_the_western_boundary_of_the_Shanwick_OCA/1.
:- dynamic is_on_the_northern_boundary_of_the_Shanwick_OCA/1.
:- dynamic is_on_the_southern_boundary_of_the_Shanwick_OCA/1.
:- dynamic are_laterally_separated/2.
:- dynamic is_not_in_lateral_conflict_with/2.
:- dynamic the_long_arc_mins_dist_Val_between/3.
:- dynamic the_long_arc_mins_eastward_Val_from/3.
:- dynamic the_long_arc_mins_westward_Val_from/3.
:- dynamic same_Lat/2.
:- dynamic the_total_Val_in_arc_mins_of_lat/2.
:- dynamic is_north_of/2.
:- dynamic is_at_or_north_of/2.
:- dynamic is_south_of/2.
:- dynamic is_at_or_south_of/2.
:- dynamic same_Long/2.
:- dynamic the_total_Val_in_arc_mins_of_long/2.
:- dynamic the_arc_mins_eastward_Val_from/3.
:- dynamic the_arc_mins_westward_Val_from/3.
:- dynamic is_east_of/2.
:- dynamic is_west_of/2.
:- dynamic is_at_or_west_of/2.
:- dynamic same_Flight_level/2.
:- dynamic the_Val_in_100s_of_feet_of/2.
:- dynamic the_Val_in_feet_of/2.
:- dynamic is_at_or_above/2.
:- dynamic is_at_or_below/2.
:- dynamic is_above/2.
:- dynamic is_below/2.
:- dynamic time_of_current_conflict_probe/1.
:- dynamic same_Time/2.
:- dynamic non_negative_integer/1.
:- dynamic the_total_Val_in_mins_of/2.
:- dynamic is_at_or_later_than/2.
:- dynamic is_at_or_earlier_than/2.
:- dynamic is_earlier_than/2.
:- dynamic is_later_than/2.
:- dynamic the_next_integer_Time_in_mins_after/2.
:- dynamic same_Flight_level_range/2.
:- dynamic the_max_Flight_level_of_fl_range/2.
:- dynamic the_min_Flight_level_of_fl_range/2.
:- dynamic same_2D_pt/2.
:- dynamic the_Lat_of_2D_pt/2.
:- dynamic the_Long_of_2D_pt/2.
:- dynamic the_nm_linear_dist_Val_between_2D_pts/3.
:- dynamic same_3D_pt/2.
:- dynamic the_2D_pt_of_3D_pt/2.
:- dynamic the_Flight_level_range_of_3D_pt/2.
:- dynamic same_4D_pt/2.
:- dynamic the_3D_pt_of/2.
:- dynamic the_Time_of/2.
:- dynamic the_2D_pt_of_4D_pt/2.
:- dynamic the_Flight_level_range_of_4D_pt/2.
:- dynamic the_Lat_of_4D_pt/2.
:- dynamic the_Long_of_4D_pt/2.
:- dynamic the_entry_Segment_of/2.
:- dynamic the_first_4D_pt_of/2.
:- dynamic is_wholly_or_partly_in_the_mnps_airspace/1.
:- dynamic is_wholly_outside_the_mnps_airspace/1.
:- dynamic is_wholly_within_the_mnps_airspace/1.
:- dynamic is_wholly_or_partly_in_oca/1.
:- dynamic the_first_recognised_4D_pt_for_oceanic_cpr_of/2.
:- dynamic the_last_recognised_4D_pt_for_oceanic_cpr_of/2.
:- dynamic the_exit_Segment_of/2.
:- dynamic same_Segment/2.
:- dynamic the_Profile_containing/2.
:- dynamic the_entry_4D_pt_of/2.
:- dynamic the_exit_4D_pt_of/2.
:- dynamic the_machno_Val_on/2.
:- dynamic time_periods_overlap/2.
:- dynamic flight_level_ranges_overlap/2.
:- dynamic lies_in_flight_level_range_of/2.
:- dynamic the_entry_Time_of/2.
:- dynamic the_exit_Time_of/2.
:- dynamic belong_to_profiles_for_different_aircraft/2.
:- dynamic the_entry_Flight_level_range_of/2.
:- dynamic the_exit_Flight_level_range_of/2.
:- dynamic one_or_both_start_later_than/3.
:- dynamic is_westerly/1.
:- dynamic is_easterly/1.
:- dynamic the_entry_Lat_of/2.
:- dynamic the_exit_Lat_of/2.
:- dynamic the_entry_Long_of/2.
:- dynamic the_exit_Long_of/2.
:- dynamic the_most_northerly_Lat_of/2.
:- dynamic the_most_southerly_Lat_of/2.
:- dynamic the_max_Flight_level_of_segment/2.
:- dynamic the_min_Flight_level_of_segment/2.
:- dynamic the_lat_over_long_gradient_Val_of/2.
:- dynamic the_most_westerly_Long_of/2.
:- dynamic the_most_easterly_Long_of/2.
:- dynamic finishes_at_or_earlier_than_starts/2.
:- dynamic the_entry_Linear_track_pt_of/2.
:- dynamic the_exit_Linear_track_pt_of/2.
:- dynamic the_nm_linear_track_length_Val_of/2.
:- dynamic the_lat_length_Val_in_arc_mins_of/2.
:- dynamic the_long_length_Val_in_arc_mins_of/2.
:- dynamic regular/1.
:- dynamic irregular/1.
:- dynamic is_cruise_climbed/1.
:- dynamic is_during_time_period_of/2.
:- dynamic the_offset_const_Val_for_linear_track_of/2.
:- dynamic the_average_lat_Val_in_arc_mins_of/2.
:- dynamic the_entry_lat_Val_in_arc_mins_of/2.
:- dynamic the_exit_lat_Val_in_arc_mins_of/2.
:- dynamic the_entry_time_Val_in_mins_of/2.
:- dynamic the_exit_time_Val_in_mins_of/2.
:- dynamic the_entry_long_Val_in_arc_mins_of/2.
:- dynamic the_exit_long_Val_in_arc_mins_of/2.
:- dynamic the_time_to_fly_Val_in_mins_of/2.
:- dynamic the_Aircraft_on_segment/2.
:- dynamic the_entry_2D_pt_of/2.
:- dynamic the_exit_2D_pt_of/2.
:- dynamic the_earlier_Segment_of/3.
:- dynamic the_later_Segment_of/3.
:- dynamic the_max_entry_Flight_level_of/2.
:- dynamic the_min_entry_Flight_level_of/2.
:- dynamic the_max_exit_Flight_level_of/2.
:- dynamic the_min_exit_Flight_level_of/2.
:- dynamic same_Linear_track_pt/2.
:- dynamic the_Segment_of/2.
:- dynamic the_total_time_Val_in_mins_at/2.
:- dynamic the_lat_Val_in_arc_mins_of/2.
:- dynamic the_long_Val_in_arc_mins_of/2.
:- dynamic the_segment_entry_lat_Val_in_arc_mins_for/2.
:- dynamic the_segment_exit_lat_Val_in_arc_mins_for/2.
:- dynamic the_segment_entry_long_Val_in_arc_mins_for/2.
:- dynamic the_segment_exit_long_Val_in_arc_mins_for/2.
:- dynamic the_nm_linear_dist_Val_between_linear_track_pts/3.
:- dynamic the_segment_entry_time_Val_in_mins_for/2.
:- dynamic the_segment_exit_time_Val_in_mins_for/2.
:- dynamic same_Airspace/2.
:- dynamic overlaps_with_the_flight_level_range_of_airspace/2.
:- dynamic is_within_lateral_and_longitudinal_boundaries_of_airspace/2.
:- dynamic are_vertices_for/3.
:- dynamic is_the_max_flight_level_for/2.
:- dynamic is_the_min_flight_level_for/2.
:- dynamic is_a_piston_type/1.
:- dynamic is_a_jet_type/1.
:- dynamic is_a_turbo_type/1.
:- dynamic is_a_prox_airfield_pt/1.


list_of_cps_predicates(L) :- 

L = [
/* undefined predicates in current version of cps 

pred(is_wholly_outside_oca,1),
pred( the_linear_tracks_of_cross,2),

pred(is_a_min_long_sep_value_in_mins_entered_via_the_mst_command,2),

pred(if_are_on_profiles_which_diverge_then_longitudinal_separation_is_at_least_5_mins_where_lateral_separation_of_60nm_is_achieved,2),


pred(is_at_or_is_east_of_the_eastern_Shanwick_OCA_boundary,1),
pred(is_east_of_the_eastern_Shanwick_OCA_boundary,1),
*/
/* defined in current version  */
/* built in */
pred(=,2),
pred(<,2),
pred(>,2),
pred( is ,2),
pred( == ,2),
pred( =< ,2),
pred( >= ,2),

/* user defined - all commented out except sub and supersonic

pred( profiles_are_in_oceanic_conflict,4),
pred( segments_are_in_oceanic_conflict,2),
pred( are_subject_to_oceanic_cpr,2),
pred( oceanic_separation_rules_are_applicable_to,1),
pred( starts_at_or_after_first_recognised_pt_for_oceanic_cpr,1),
pred( ends_at_or_before_last_recognised_pt_for_oceanic_cpr,1),
pred( are_in_vertical_oceanic_conflict,2),
pred( are_in_lateral_and_longitudinal_oceanic_conflict,2),
pred( box_conflict_exists_between_linear_tracks_of_at_some_time_at_or_between,4),
pred( box_conflict_exists_between_linear_tracks_of_at,3),
pred( the_overlap_window_start_Time_for,3),
pred( the_overlap_window_end_Time_for,3),
pred( is_within_conflict_box_of,2),
pred( the_required_lateral_half_box_dimension_Val_for_wrt,3),
pred( the_required_longitudinal_half_box_dimension_Val_for_wrt,3),
pred( the_time_gap_Val_in_mins_between,3),
pred( the_min_vertical_sep_Val_in_feet_required_for,5),
pred( the_min_lateral_sep_Val_in_nm_required_for,3),
pred( steep,1),
pred( are_deemed_to_be_laterally_separated,2),
pred( are_westerly_and_deemed_to_be_laterally_separated,2),
pred( are_easterly_and_deemed_to_be_laterally_separated,2),
pred( the_min_longitudinal_sep_Val_in_mins_required_for,3),
pred( the_prox_airfield_long_sep_adjustment_Val_in_mins_required_for,3),
pred( reduced_separation_conditions_apply_to,2),
pred( the_basic_min_longitudinal_sep_Val_in_mins_required_for,3),
pred( both_are_flown_in_level_flight,2),
pred( one_or_both_of_is_not_flown_in_level_flight,2),
pred( are_cruise_climbed,2),
pred( are_not_cruise_climbed,2),
pred( or_cruise_climbed,2),
 */
pred( both_are_at_or_below,3),
pred( both_are_above,3),
pred( one_or_both_are_at_or_below,3),
pred( one_or_both_are_above,3),
pred( is_flown_in_level_flight,1)
/*
pred( both_are_flown_at_supersonic_speed,2),
pred( one_or_both_of_are_flown_at_subsonic_speed,2),
pred( both_are_flown_at_subsonic_speed,2),
pred( one_or_both_of_are_flown_at_supersonic_speed,2),
pred( both_are_flown_at_the_same_mach_number,2),
pred( both_are_flown_at_the_same_mach_number_in_level_flight,2),
pred( are_jets,2),
pred( meet_mnps,2),
pred( one_or_both_do_not_meet_mnps,2),
pred( both_aircraft_on_are_grounded_at_prox_airfields_at_time_of_current_conflict_probe,2),
pred( only_one_of_the_aircraft_on_is_grounded_at_a_prox_airfield_at_time_of_current_conflict_probe,2),
pred( neither_of_the_aircraft_on_is_grounded_at_prox_airfields_at_time_of_current_conflict_probe,2),
pred( aircraft_on_is_grounded_at_a_prox_airfield_at_time_of_current_conflict_probe,1),
pred( are_wholly_or_partly_in_the_mnps_airspace,2),
pred( one_or_both_of_is_wholly_outside_the_mnps_airspace,2),
pred( are_wholly_within_the_mnps_airspace,2),
pred( one_or_both_of_finish_at_or_after,3),
pred( both_finish_before,3),
pred( is_in_overlap_time_window_for,3),
pred( min_flight_level_of_upper_segment_of_is_above_max_flight_level_of_lower_segment_by_less_than_required_min_vert_sep,2),
pred( abs_magnitude_of_lat_over_long_gradient_of_exceeds,2),
pred( position_on_linear_track_of_at_is,3),
pred( is_on_linear_track_or_extended_linear_track_of_at_the_intersection_with_longitude_coord,3),
pred( the_lat_Val_on_linear_track_of_at,3),
pred( is_on_linear_track_or_extended_linear_track_of_at_the_intersection_with_latitude_coord,3),
pred( are_separated_by_at_least_one_degree,2),
pred( the_linear_tracks_of_continuously_diverge_to_provide_at_least_120NM_separation_by_20_degrees_west,2),
pred( the_linear_tracks_of_are_separated_by_at_least_120NM_at_20_degrees_west,2),
pred( is_a_2D_pt_west_of_the_eastern_Shanwick_OCA_boundary,1),
pred( is_at_the_last_recognised_pt_for_oceanic_cpr_of,2),
pred( are_laterally_separated_at_the_eastern_Shanwick_OCA_boundary,2),
pred( are_not_cleared_to_the_same_last_recognised_pt,2),
pred( the_linear_tracks_of_diverge_continuously,2),
pred( the_linear_tracks_of_diverge,2),
pred( is_on_the_linear_track_of,2),
pred( are_after_a_common_pt_from_which_profile_tracks_are_same_or_diverging_thereafter_and_at_which_both_aircraft_have_already_reported_by,3),
pred( the_preceding_aircraft_on_or_on_is_not_faster_by_or_more,3),
pred( the_aircraft_on_segment1_precedes_the_aircraft_on_segment2,2),
pred( the_preceding_aircraft_on_or_on_is_faster_by,3),
pred( the_preceding_aircraft_on_or_on_is_faster_by_at_least,3),
pred( the_preceding_aircraft_on_or_on_is_faster_by_at_least_mach_but_not_more_than,4),
pred( are_after_a_common_pt_from_which_profile_tracks_are_same_thereafter,2),
pred( are_after_a_common_pt_from_which_profile_tracks_are_diverging_thereafter,2),
pred( the_linear_tracks_of_are_the_same,2),
pred( are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_same_or_diverging_thereafter,2),
pred( are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_same_thereafter,2),
pred( are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_diverging_thereafter,2),
pred( is_on_the_Shanwick_OCA_boundary,1),
pred( is_on_the_eastern_boundary_of_the_Shanwick_OCA,1),
pred( is_on_the_western_boundary_of_the_Shanwick_OCA,1),
pred( is_on_the_northern_boundary_of_the_Shanwick_OCA,1),
pred( is_on_the_southern_boundary_of_the_Shanwick_OCA,1),
pred( are_laterally_separated,2),
pred( is_not_in_lateral_conflict_with,2),
pred( the_long_arc_mins_dist_Val_between,3),
pred( the_long_arc_mins_eastward_Val_from,3),
pred( the_long_arc_mins_westward_Val_from,3),
pred( same_Lat,2),
pred( the_total_Val_in_arc_mins_of_lat,2),
pred( is_north_of,2),
pred( is_at_or_north_of,2),
pred( is_south_of,2),
pred( is_at_or_south_of,2),
pred( same_Long,2),
pred( the_total_Val_in_arc_mins_of_long,2),
pred( the_arc_mins_eastward_Val_from,3),
pred( the_arc_mins_westward_Val_from,3),
pred( is_east_of,2),
pred( is_west_of,2),
pred( is_at_or_west_of,2),
pred( same_Flight_level,2),
pred( the_Val_in_100s_of_feet_of,2),
pred( the_Val_in_feet_of,2),
pred( is_at_or_above,2),
pred( is_at_or_below,2),
pred( is_above,2),
pred( is_below,2),
pred( time_of_current_conflict_probe,1),
pred( same_Time,2),
pred( non_negative_integer,1),
pred( the_total_Val_in_mins_of,2),
pred( is_at_or_later_than,2),
pred( is_at_or_earlier_than,2),
pred( is_earlier_than,2),
pred( is_later_than,2),
pred( the_next_integer_Time_in_mins_after,2),
pred( same_Flight_level_range,2),
pred( the_max_Flight_level_of_fl_range,2),
pred( the_min_Flight_level_of_fl_range,2),
pred( same_2D_pt,2),
pred( the_Lat_of_2D_pt,2),
pred( the_Long_of_2D_pt,2),
pred( the_nm_linear_dist_Val_between_2D_pts,3),
pred( same_3D_pt,2),
pred( the_2D_pt_of_3D_pt,2),
pred( the_Flight_level_range_of_3D_pt,2),
pred( same_4D_pt,2),
pred( the_3D_pt_of,2),
pred( the_Time_of,2),
pred( the_2D_pt_of_4D_pt,2),
pred( the_Flight_level_range_of_4D_pt,2),
pred( the_Lat_of_4D_pt,2),
pred( the_Long_of_4D_pt,2),
pred( the_entry_Segment_of,2),
pred( the_first_4D_pt_of,2),
pred( is_wholly_or_partly_in_the_mnps_airspace,1),
pred( is_wholly_outside_the_mnps_airspace,1),
pred( is_wholly_within_the_mnps_airspace,1),
pred( is_wholly_or_partly_in_oca,1),
pred( the_first_recognised_4D_pt_for_oceanic_cpr_of,2),
pred( the_last_recognised_4D_pt_for_oceanic_cpr_of,2),
pred( the_exit_Segment_of,2),
pred( same_Segment,2),
pred( the_Profile_containing,2),
pred( the_entry_4D_pt_of,2),
pred( the_exit_4D_pt_of,2),
pred( the_machno_Val_on,2),
pred( time_periods_overlap,2),
pred( flight_level_ranges_overlap,2),
pred( lies_in_flight_level_range_of,2),
pred( the_entry_Time_of,2),
pred( the_exit_Time_of,2),
pred( belong_to_profiles_for_different_aircraft,2),
pred( the_entry_Flight_level_range_of,2),
pred( the_exit_Flight_level_range_of,2),
pred( one_or_both_start_later_than,3),
pred( is_westerly,1),
pred( is_easterly,1),
pred( the_entry_Lat_of,2),
pred( the_exit_Lat_of,2),
pred( the_entry_Long_of,2),
pred( the_exit_Long_of,2),
pred( the_most_northerly_Lat_of,2),
pred( the_most_southerly_Lat_of,2),
pred( the_max_Flight_level_of_segment,2),
pred( the_min_Flight_level_of_segment,2),
pred( the_lat_over_long_gradient_Val_of,2),
pred( the_most_westerly_Long_of,2),
pred( the_most_easterly_Long_of,2),
pred( finishes_at_or_earlier_than_starts,2),
pred( the_entry_Linear_track_pt_of,2),
pred( the_exit_Linear_track_pt_of,2),
pred( the_nm_linear_track_length_Val_of,2),
pred( the_lat_length_Val_in_arc_mins_of,2),
pred( the_long_length_Val_in_arc_mins_of,2),
pred( regular,1),
pred( irregular,1),
pred( is_cruise_climbed,1),
pred( is_during_time_period_of,2),
pred( the_offset_const_Val_for_linear_track_of,2),
pred( the_average_lat_Val_in_arc_mins_of,2),
pred( the_entry_lat_Val_in_arc_mins_of,2),
pred( the_exit_lat_Val_in_arc_mins_of,2),
pred( the_entry_time_Val_in_mins_of,2),
pred( the_exit_time_Val_in_mins_of,2),
pred( the_entry_long_Val_in_arc_mins_of,2),
pred( the_exit_long_Val_in_arc_mins_of,2),
pred( the_time_to_fly_Val_in_mins_of,2),
pred( the_Aircraft_on_segment,2),
pred( the_entry_2D_pt_of,2),
pred( the_exit_2D_pt_of,2),
pred( the_earlier_Segment_of,3),
pred( the_later_Segment_of,3),
pred( the_max_entry_Flight_level_of,2),
pred( the_min_entry_Flight_level_of,2),
pred( the_max_exit_Flight_level_of,2),
pred( the_min_exit_Flight_level_of,2),
pred( same_Linear_track_pt,2),
pred( the_Segment_of,2),
pred( the_total_time_Val_in_mins_at,2),
pred( the_lat_Val_in_arc_mins_of,2),
pred( the_long_Val_in_arc_mins_of,2),
pred( the_segment_entry_lat_Val_in_arc_mins_for,2),
pred( the_segment_exit_lat_Val_in_arc_mins_for,2),
pred( the_segment_entry_long_Val_in_arc_mins_for,2),
pred( the_segment_exit_long_Val_in_arc_mins_for,2),
pred( the_nm_linear_dist_Val_between_linear_track_pts,3),
pred( the_segment_entry_time_Val_in_mins_for,2),
pred( the_segment_exit_time_Val_in_mins_for,2),
pred( same_Airspace,2),
pred( overlaps_with_the_flight_level_range_of_airspace,2),
pred( is_within_lateral_and_longitudinal_boundaries_of_airspace,2),
pred( are_vertices_for,3),
pred( is_the_max_flight_level_for,2),
pred( is_the_min_flight_level_for,2),
pred( is_a_piston_type,1),
pred( is_a_jet_type,1),
pred( is_a_turbo_type,1),
pred( is_a_prox_airfield_pt,1)
*/
].


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


revisable_clauses([3,4 ]).

clause_impress( profiles_are_in_oceanic_conflict(_2037,_2071,_2105,_2139), (_2037 belongs_to _2071,_2105 belongs_to _2139,segments_are_in_oceanic_conflict(_2037,_2105),!),1,unshielded). 

clause_impress( segments_are_in_oceanic_conflict(_3163,_3197), (are_in_vertical_oceanic_conflict(_3163,_3197),are_in_lateral_and_longitudinal_oceanic_conflict(_3163,_3197),!),2,unshielded). 

clause_impress( are_in_vertical_oceanic_conflict(_4022,_4056), (the_min_entry_Flight_level_of(_4022,_4153),_4202=_4153,the_max_entry_Flight_level_of(_4056,_4338),_4387=_4338,_4202 is_at_or_above _4387,the_Val_in_feet_of(_4202,_4605),the_Val_in_feet_of(_4387,_4692),_4723 is _4605-_4692,_4723<2000,!),3,unshielded). 

clause_impress( are_in_vertical_oceanic_conflict(_6023,_6057), (the_min_entry_Flight_level_of(_6023,_6154),_6203=_6154,the_max_entry_Flight_level_of(_6057,_6339),_6388=_6339,_6388 is_above _6203,the_Val_in_feet_of(_6388,_6606),the_Val_in_feet_of(_6203,_6693),_6724 is _6606-_6693,_6724<2000,!),4,unshielded). 

clause_impress( are_in_lateral_and_longitudinal_oceanic_conflict(_8024,_8058), (the_entry_4D_pt_of(_8024,_8149),the_2D_pt_of_4D_pt(_8149,_8240),_8281=_8240,the_entry_4D_pt_of(_8058,_8403),the_2D_pt_of_4D_pt(_8403,_8494),_8535=_8494,the_nm_linear_dist_Val_between_2D_pts(_8281,_8535,_8683),_8683<100,!),5,unshielded). 

clause_impress( the_min_entry_Flight_level_of(_9755,_9799), (the_entry_Flight_level_range_of(_9755,_9906),the_min_Flight_level_of_fl_range(_9906,_9799),!),6,unshielded). 

clause_impress( the_min_Flight_level_of_fl_range(fl_range(_10698,_10742),_10698), (_10698 is_at_or_below _10742,!),7,unshielded). 

clause_impress( the_min_Flight_level_of_fl_range(fl_range(_11578,_11622),_11622), (_11622 is_at_or_below _11578,!),8,unshielded). 

clause_impress( the_max_entry_Flight_level_of(_12434,_12478), (the_entry_Flight_level_range_of(_12434,_12585),the_max_Flight_level_of_fl_range(_12585,_12478),!),9,unshielded). 

clause_impress( the_max_Flight_level_of_fl_range(fl_range(_13377,_13421),_13377), (_13377 is_at_or_above _13421,!),10,unshielded). 

clause_impress( the_max_Flight_level_of_fl_range(fl_range(_14257,_14301),_14301), (_14301 is_at_or_above _14257,!),11,unshielded). 

clause_impress( _15113 is_at_or_below _15159, (the_Val_in_100s_of_feet_of(_15113,_15243),the_Val_in_100s_of_feet_of(_15159,_15330),_15243=<_15330,!),12,unshielded). 

clause_impress( _16153 is_above _16199, (the_Val_in_100s_of_feet_of(_16153,_16283),the_Val_in_100s_of_feet_of(_16199,_16370),_16283>_16370,!),13,unshielded). 

clause_impress( _17193 is_at_or_above _17239, (the_Val_in_100s_of_feet_of(_17193,_17323),the_Val_in_100s_of_feet_of(_17239,_17410),_17323>=_17410,!),14,unshielded). 

clause_impress( the_Val_in_100s_of_feet_of(fl(_18257),_18257), true, 15,shielded). 

clause_impress( the_entry_Flight_level_range_of(_18752,_18808), (the_entry_4D_pt_of(_18752,_18897),the_Flight_level_range_of_4D_pt(_18897,_18808),!),16,unshielded). 

clause_impress( the_entry_4D_pt_of(the_Segment(_19671,_19709,_19747,_19771),_19709), true, 17,shielded). 

clause_impress( the_Flight_level_range_of_4D_pt(_20303,_20359), (the_3D_pt_of(_20303,_20454),the_Flight_level_range_of_3D_pt(_20454,_20359),!),18,unshielded). 

clause_impress( the_Flight_level_range_of_3D_pt(threeD_pt(_21232,_21286),_21286), true, 19,shielded). 

clause_impress( _21804 is_above _21850, (the_Val_in_100s_of_feet_of(_21804,_21934),the_Val_in_100s_of_feet_of(_21850,_22021),_21934>_22021,!),20,unshielded). 

clause_impress( the_Val_in_feet_of(fl(_22868),_22899), (_22899 is 100*_22868,!),21,unshielded). 

clause_impress( the_nm_linear_dist_Val_between_2D_pts(_23706,_23742,_23768), (the_lat_Val_in_arc_mins_of(_23706,_23849),the_lat_Val_in_arc_mins_of(_23742,_23928),the_long_Val_in_arc_mins_of(_23706,_24007),the_long_Val_in_arc_mins_of(_23742,_24086),the_long_arc_mins_dist_Val_between(_24007,_24086,_24181),_23768 is sqrt(exp(_23849-_23928,2)+exp(_24181,2)),!),22,unshielded). 

clause_impress( the_long_arc_mins_dist_Val_between(_25444,_25470,_25496), (0=<_25444,_25444<21600,0=<_25470,_25470<21600,the_long_arc_mins_eastward_Val_from(_25444,_25470,_25753),the_long_arc_mins_westward_Val_from(_25444,_25470,_25848),_25496 is min(_25753,_25848),!),23,unshielded). 

clause_impress( the_long_arc_mins_eastward_Val_from(_27033,_27059,_27085), (0=<_27033,_27033<21600,0=<_27059,_27059<21600,_27085 is max(_27059-_27033,round(_27059+(21600-_27033))mod 21600),!),24,unshielded). 

clause_impress( the_long_arc_mins_westward_Val_from(_28703,_28729,_28755), (0=<_28703,_28703<21600,0=<_28729,_28729<21600,the_long_arc_mins_eastward_Val_from(_28729,_28703,_28755),!),25,unshielded). 

clause_impress( the_lat_Val_in_arc_mins_of(_29943,_29969), (the_Lat_of_2D_pt(_29943,_30048),the_total_Val_in_arc_mins_of_lat(_30048,_29969),!),26,unshielded). 

clause_impress( the_long_Val_in_arc_mins_of(_30770,_30796), (the_Long_of_2D_pt(_30770,_30877),the_total_Val_in_arc_mins_of_long(_30877,_30796),!),27,unshielded). 

clause_impress( the_total_Val_in_arc_mins_of_lat(lat_N(_31619),_31650), (_31650 is _31619*60,!),28,unshielded). 

clause_impress( the_total_Val_in_arc_mins_of_lat(lat_S(_32469),_32500), (_32469*60-_32500,!),29,unshielded). 

clause_impress( the_total_Val_in_arc_mins_of_lat(lat_N(_33325,_33365),_33396), (_33396 is _33325*60+_33365,!),30,unshielded). 

clause_impress( the_total_Val_in_arc_mins_of_lat(lat_S(_34340,_34380),_34411), (_34411 is-(_34340*60)-_34380,!),31,unshielded). 

clause_impress( the_total_Val_in_arc_mins_of_long(long_E(_35388),_35419), (_35419 is _35388*60,!),32,unshielded). 

clause_impress( the_total_Val_in_arc_mins_of_long(long_W(_36242),_36273), (_36273 is(21600-_36242*60)mod 21600,!),33,unshielded). 

clause_impress( the_total_Val_in_arc_mins_of_long(long_E(_37254,_37294),_37325), (_37325 is _37254*60+_37294,!),34,unshielded). 

clause_impress( the_total_Val_in_arc_mins_of_long(long_W(_38273,_38313),_38344), (_38344 is(21600-(_38273*60-_38313))mod 21600,!),35,unshielded). 

clause_impress( the_Lat_of_2D_pt(twoD_pt(_39442,_39468),_39442), true, 36,shielded). 

clause_impress( the_Long_of_2D_pt(twoD_pt(_39960,_39986),_39986), true, 37,shielded). 

clause_impress( the_2D_pt_of_3D_pt(threeD_pt(_40490,_40544),_40490), true, 38,shielded). 

clause_impress( the_2D_pt_of_4D_pt(_41046,_41082), (the_3D_pt_of(_41046,_41177),the_2D_pt_of_3D_pt(_41177,_41082),!),39,unshielded). 

clause_impress( the_3D_pt_of(fourD_pt(_41939,_41965),_41939), true, 40,shielded). 

clause_impress( is_the_max_flight_level_for(fl(1000),shanwick), true, 41,shielded). 

clause_impress( is_the_min_flight_level_for(fl(55),shanwick), true, 42,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(61),long_W(30)),twoD_pt(lat_N(61),long_W(10)),shanwick), true, 43,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(61),long_W(10)),twoD_pt(lat_N(54,34),long_W(10)),shanwick), true, 44,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(54,34),long_W(10)),twoD_pt(lat_N(54),long_W(15)),shanwick), true, 45,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(54),long_W(15)),twoD_pt(lat_N(49),long_W(15)),shanwick), true, 46,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(49),long_W(15)),twoD_pt(lat_N(48,30),long_W(8)),shanwick), true, 47,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(48,30),long_W(8)),twoD_pt(lat_N(45),long_W(8)),shanwick), true, 48,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(45),long_W(8)),twoD_pt(lat_N(45),long_W(30)),shanwick), true, 49,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(45),long_W(30)),twoD_pt(lat_N(61),long_W(30)),shanwick), true, 50,shielded). 

clause_impress( is_the_max_flight_level_for(fl(1000),oceanic), true, 51,shielded). 

clause_impress( is_the_min_flight_level_for(fl(55),oceanic), true, 52,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(61),long_W(30)),twoD_pt(lat_N(61),long_W(10)),oceanic), true, 53,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(61),long_W(10)),twoD_pt(lat_N(54,34),long_W(10)),oceanic), true, 54,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(54,34),long_W(10)),twoD_pt(lat_N(54),long_W(15)),oceanic), true, 55,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(54),long_W(15)),twoD_pt(lat_N(49),long_W(15)),oceanic), true, 56,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(49),long_W(15)),twoD_pt(lat_N(48,30),long_W(8)),oceanic), true, 57,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(48,30),long_W(8)),twoD_pt(lat_N(45),long_W(8)),oceanic), true, 58,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(45),long_W(8)),twoD_pt(lat_N(45),long_W(30)),oceanic), true, 59,shielded). 

clause_impress( are_vertices_for(twoD_pt(lat_N(45),long_W(30)),twoD_pt(lat_N(61),long_W(30)),oceanic), true, 60,shielded). 

clause_impress( is_the_max_flight_level_for(fl(400),mnps), true, 61,shielded). 

clause_impress( is_the_min_flight_level_for(fl(275),mnps), true, 62,shielded). 

clause_impress( is_a_turbo_type(ac6t), true, 63,shielded). 

clause_impress( is_a_piston_type(ac56), true, 64,shielded). 

clause_impress( is_a_turbo_type(atla), true, 65,shielded). 

clause_impress( is_a_jet_type(b52), true, 66,shielded). 

clause_impress( is_a_jet_type(b707), true, 67,shielded). 

clause_impress( is_a_jet_type(b727), true, 68,shielded). 

clause_impress( is_a_jet_type(b737), true, 69,shielded). 

clause_impress( is_a_jet_type(b73s), true, 70,shielded). 

clause_impress( is_a_jet_type(b747), true, 71,shielded). 

clause_impress( is_a_jet_type(b74f), true, 72,shielded). 

clause_impress( is_a_jet_type(b74s), true, 73,shielded). 

clause_impress( is_a_jet_type(b757), true, 74,shielded). 

clause_impress( is_a_jet_type(b767), true, 75,shielded). 

clause_impress( is_a_jet_type(ba11), true, 76,shielded). 

clause_impress( is_a_turbo_type(ba31), true, 77,shielded). 

clause_impress( is_a_turbo_type(ba32), true, 78,shielded). 

clause_impress( is_a_jet_type(ba46), true, 79,shielded). 

clause_impress( is_a_turbo_type(be20), true, 80,shielded). 

clause_impress( is_a_turbo_type(be30), true, 81,shielded). 

clause_impress( is_a_turbo_type(c2), true, 82,shielded). 

clause_impress( is_a_jet_type(c5a), true, 83,shielded). 

clause_impress( is_a_jet_type(c9), true, 84,shielded). 

clause_impress( is_a_turbo_type(c12), true, 85,shielded). 

clause_impress( is_a_jet_type(ca20a), true, 86,shielded). 

clause_impress( is_a_jet_type(c21), true, 87,shielded). 

clause_impress( is_a_turbo_type(c130), true, 88,shielded). 

clause_impress( is_a_jet_type(c135), true, 89,shielded). 

clause_impress( is_a_jet_type(c137), true, 90,shielded). 

clause_impress( is_a_jet_type(c140), true, 91,shielded). 

clause_impress( is_a_jet_type(c141), true, 92,shielded). 

clause_impress( is_a_piston_type(c404), true, 93,shielded). 

clause_impress( is_a_turbo_type(c441), true, 94,shielded). 

clause_impress( is_a_jet_type(c500), true, 95,shielded). 

clause_impress( is_a_jet_type(conc), true, 96,shielded). 

clause_impress( is_a_jet_type(cl60), true, 97,shielded). 

clause_impress( is_a_jet_type(cl65), true, 98,shielded). 

clause_impress( is_a_jet_type(da20), true, 99,shielded). 

clause_impress( is_a_jet_type(da50), true, 100,shielded). 

clause_impress( is_a_jet_type(da90), true, 101,shielded). 

clause_impress( is_a_jet_type(dc8), true, 102,shielded). 

clause_impress( is_a_jet_type(dc8s), true, 103,shielded). 

clause_impress( is_a_jet_type(dc86), true, 104,shielded). 

clause_impress( is_a_jet_type(dc9), true, 105,shielded). 

clause_impress( is_a_jet_type(dc10), true, 106,shielded). 

clause_impress( is_a_turbo_type(dh4), true, 107,shielded). 

clause_impress( is_a_turbo_type(dh5), true, 108,shielded). 

clause_impress( is_a_turbo_type(dh7), true, 109,shielded). 

clause_impress( is_a_turbo_type(dh8), true, 110,shielded). 

clause_impress( is_a_jet_type(ea30), true, 111,shielded). 

clause_impress( is_a_jet_type(ea31), true, 112,shielded). 

clause_impress( is_a_jet_type(ea32), true, 113,shielded). 

clause_impress( is_a_jet_type(ea33), true, 114,shielded). 

clause_impress( is_a_jet_type(ea34), true, 115,shielded). 

clause_impress( is_a_jet_type(e3a), true, 116,shielded). 

clause_impress( is_a_jet_type(e4a), true, 117,shielded). 

clause_impress( is_a_jet_type(e6), true, 118,shielded). 

clause_impress( is_a_jet_type(f111), true, 119,shielded). 

clause_impress( is_a_jet_type(f4), true, 120,shielded). 

clause_impress( is_a_jet_type(f14), true, 121,shielded). 

clause_impress( is_a_jet_type(f15), true, 122,shielded). 

clause_impress( is_a_jet_type(f16), true, 123,shielded). 

clause_impress( is_a_jet_type(f18), true, 124,shielded). 

clause_impress( is_a_jet_type(fk28), true, 125,shielded). 

clause_impress( is_a_jet_type(g2), true, 126,shielded). 

clause_impress( is_a_jet_type(g3), true, 127,shielded). 

clause_impress( is_a_jet_type(g4), true, 128,shielded). 

clause_impress( is_a_jet_type(har), true, 129,shielded). 

clause_impress( is_a_jet_type(hs25), true, 130,shielded). 

clause_impress( is_a_turbo_type(hs74), true, 131,shielded). 

clause_impress( is_a_jet_type(il62), true, 132,shielded). 

clause_impress( is_a_jet_type(il86), true, 133,shielded). 

clause_impress( is_a_jet_type(kc10), true, 134,shielded). 

clause_impress( is_a_jet_type(kc35), true, 135,shielded). 

clause_impress( is_a_jet_type(l101), true, 136,shielded). 

clause_impress( is_a_jet_type(l329), true, 137,shielded). 

clause_impress( is_a_jet_type(lr35), true, 138,shielded). 

clause_impress( is_a_jet_type(lr55), true, 139,shielded). 

clause_impress( is_a_jet_type(md11), true, 140,shielded). 

clause_impress( is_a_jet_type(md80), true, 141,shielded). 

clause_impress( is_a_jet_type(mrc), true, 142,shielded). 

clause_impress( is_a_jet_type(n265), true, 143,shielded). 

clause_impress( is_a_turbo_type(nd16), true, 144,shielded). 

clause_impress( is_a_jet_type(nim), true, 145,shielded). 

clause_impress( is_a_turbo_type(p140), true, 146,shielded). 

clause_impress( is_a_turbo_type(p3), true, 147,shielded). 

clause_impress( is_a_turbo_type(p3c), true, 148,shielded). 

clause_impress( is_a_piston_type(pa30), true, 149,shielded). 

clause_impress( is_a_piston_type(pa31), true, 150,shielded). 

clause_impress( is_a_piston_type(pa34), true, 151,shielded). 

clause_impress( is_a_turbo_type(pa42), true, 152,shielded). 

clause_impress( is_a_piston_type(pa60), true, 153,shielded). 

clause_impress( is_a_jet_type(tu34), true, 154,shielded). 

clause_impress( is_a_jet_type(t39), true, 155,shielded). 

clause_impress( is_a_jet_type(vc10), true, 156,shielded). 

clause_impress( is_a_jet_type(vctr), true, 157,shielded). 

clause_impress( is_a_jet_type(u2), true, 158,shielded). 

clause_impress( is_a_jet_type(typ1), true, 159,shielded). 

clause_impress( is_a_jet_type(typ2), true, 160,shielded). 

clause_impress( is_a_jet_type(typ3), true, 161,shielded). 

clause_impress( is_a_turbo_type(typ4), true, 162,shielded). 

clause_impress( is_a_piston_type(typ5), true, 163,shielded). 

clause_impress( is_a_jet_type(typ6), true, 164,shielded). 

clause_impress( is_a_turbo_type(typ7), true, 165,shielded). 

clause_impress( is_a_jet_type(c5), true, 166,shielded). 

clause_impress( is_a_jet_type(an4), true, 167,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(67,1),long_W(50,41))), true, 168,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(63,59),long_W(22,36))), true, 169,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(63,59),long_W(22,36))), true, 170,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(63,45),long_W(68,33))), true, 171,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(44,53),long_W(63,31))), true, 172,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(48,33),long_W(58,33))), true, 173,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(45,41),long_W(74,2))), true, 174,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(45,19),long_W(75,40))), true, 175,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(46,48),long_W(71,24))), true, 176,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(48,56),long_W(54,34))), true, 177,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(53,19),long_W(60,26))), true, 178,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(47,37),long_W(52,45))), true, 179,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(43,41),long_W(79,38))), true, 180,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(45,28),long_W(73,45))), true, 181,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(50,54),long_E(4,32))), true, 182,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,12),long_E(2,52))), true, 183,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(49,57),long_E(6,34))), true, 184,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(49,59),long_E(6,42))), true, 185,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(50,2),long_E(8,34))), true, 186,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(49,57),long_E(7,16))), true, 187,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(48,22),long_E(7,50))), true, 188,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(49,26),long_E(7,36))), true, 189,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(53,46),long_E(8,40))), true, 190,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(50,2),long_E(8,34))), true, 191,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(53,38),long_E(9,59))), true, 192,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(50,52),long_E(7,9))), true, 193,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,17),long_E(6,45))), true, 194,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(48,41),long_E(9,12))), true, 195,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,55),long_E(8,18))), true, 196,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(52,28),long_E(9,41))), true, 197,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(54,34),long_W(6,13))), true, 198,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(52,27),long_W(1,45))), true, 199,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(53,21),long_W(2,16))), true, 200,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(50,26),long_W(5,0))), true, 201,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,30),long_W(1,59))), true, 202,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,9),long_W(1,45))), true, 203,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,24),long_W(3,21))), true, 204,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(53,21),long_W(2,53))), true, 205,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,53),long_W(0,22))), true, 206,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,9),long_W(0,11))), true, 207,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,28),long_W(0,27))), true, 208,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(53,52),long_W(1,39))), true, 209,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(55,2),long_W(1,41))), true, 210,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(52,50),long_W(1,19))), true, 211,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(57,12),long_W(2,12))), true, 212,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(55,57),long_W(4,26))), true, 213,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(55,57),long_W(3,22))), true, 214,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(55,30),long_W(4,35))), true, 215,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(58,13),long_W(6,20))), true, 216,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(55,29),long_W(5,41))), true, 217,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(57,36),long_W(3,33))), true, 218,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(56,22),long_W(2,51))), true, 219,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(57,43),long_W(3,20))), true, 220,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,53),long_W(0,14))), true, 221,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,56),long_W(1,15))), true, 222,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,17),long_W(0,46))), true, 223,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(52,25),long_E(0,34))), true, 224,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(52,22),long_E(0,29))), true, 225,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,41),long_W(1,47))), true, 226,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(52,5),long_E(1,24))), true, 227,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,45),long_W(1,35))), true, 228,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(52,22),long_W(0,13))), true, 229,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(53,18),long_W(0,33))), true, 230,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(52,18),long_E(4,46))), true, 231,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(50,55),long_E(5,46))), true, 232,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(52,10),long_E(4,25))), true, 233,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,58),long_E(4,27))), true, 234,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(51,53),long_W(8,30))), true, 235,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(53,26),long_W(6,15))), true, 236,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(53,55),long_W(8,49))), true, 237,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(52,47),long_W(8,55))), true, 238,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(49,37),long_E(6,12))), true, 239,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(60,17),long_E(5,13))), true, 240,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(58,53),long_E(5,38))), true, 241,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(38,49),long_W(76,52))), true, 242,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(39,11),long_W(76,40))), true, 243,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(41,56),long_W(72,41))), true, 244,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(44,48),long_W(68,50))), true, 245,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(41,23),long_W(71,8))), true, 246,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(42,56),long_W(78,44))), true, 247,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(39,11),long_W(76,40))), true, 248,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(39,8),long_W(75,28))), true, 249,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(40,42),long_W(74,10))), true, 250,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(38,57),long_W(77,24))), true, 251,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(43,6),long_W(78,57))), true, 252,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(40,38),long_W(73,46))), true, 253,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(36,56),long_W(76,17))), true, 254,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(43,54),long_W(69,57))), true, 255,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(44,39),long_W(73,28))), true, 256,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(39,52),long_W(75,15))), true, 257,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(43,5),long_W(70,49))), true, 258,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(41,43),long_W(71,25))), true, 259,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(40,51),long_W(74,4))), true, 260,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(40,1),long_W(74,36))), true, 261,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(41,18),long_E(2,5))), true, 262,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(38,52),long_E(1,21))), true, 263,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(40,28),long_W(3,33))), true, 264,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(36,41),long_W(4,30))), true, 265,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(39,33),long_E(2,44))), true, 266,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(42,54),long_W(8,25))), true, 267,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(40,29),long_W(3,27))), true, 268,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(37,25),long_W(5,54))), true, 269,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(44,52),long_W(0,42))), true, 270,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(45,44),long_E(5,5))), true, 271,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(43,40),long_E(7,13))), true, 272,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(48,58),long_E(2,27))), true, 273,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(48,43),long_E(2,23))), true, 274,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(49,1),long_E(2,33))), true, 275,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(48,26),long_W(4,25))), true, 276,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(47,46),long_W(3,26))), true, 277,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(47,14),long_W(1,36))), true, 278,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(50,33),long_E(3,5))), true, 279,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(47,35),long_E(7,32))), true, 280,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(45,38),long_E(8,44))), true, 281,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(45,12),long_E(7,39))), true, 282,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(44,24),long_E(8,51))), true, 283,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(36,58),long_W(25,10))), true, 284,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(37,0),long_W(7,58))), true, 285,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(38,46),long_W(27,6))), true, 286,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(38,46),long_W(9,8))), true, 287,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(46,16),long_E(6,7))), true, 288,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(47,27),long_E(8,33))), true, 289,shielded). 

clause_impress( is_a_prox_airfield_pt(twoD_pt(lat_N(36,9),long_W(5,21))), true, 290,shielded). 

revisable_clauses([ ]).

clause_impress( the_Aircraft_on_profile(profile_KLM745_1,klm745), true, 100001,shielded). 

clause_impress( the_Type_of(klm745,b74f), true, 100002,shielded). 

clause_impress( meets_mnps(klm745), true, 100003,shielded). 

clause_impress( the_Segment(profile_KLM745_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(280),fl(280))),time(10,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(280),fl(280))),time(11,8,0)),0.86)belongs_to profile_KLM745_1, true, 100004,shielded). 

clause_impress( the_Segment(profile_KLM745_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(280),fl(280))),time(11,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(280),fl(280))),time(11,54,0)),0.86)belongs_to profile_KLM745_1, true, 100005,shielded). 

clause_impress( the_Segment(profile_KLM745_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(280),fl(280))),time(11,54,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(280),fl(280))),time(12,38,0)),0.86)belongs_to profile_KLM745_1, true, 100006,shielded). 

clause_impress( the_Segment(profile_KLM745_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(280),fl(280))),time(12,38,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(280),fl(280))),time(13,21,0)),0.86)belongs_to profile_KLM745_1, true, 100007,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DLH450_1,dlh450), true, 100008,shielded). 

clause_impress( the_Type_of(dlh450,b74f), true, 100009,shielded). 

clause_impress( meets_mnps(dlh450), true, 100010,shielded). 

clause_impress( the_Segment(profile_DLH450_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(10)),fl_range(fl(330),fl(330))),time(10,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(20)),fl_range(fl(330),fl(330))),time(11,28,0)),0.86)belongs_to profile_DLH450_1, true, 100011,shielded). 

clause_impress( the_Segment(profile_DLH450_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(20)),fl_range(fl(330),fl(330))),time(11,28,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(30)),fl_range(fl(330),fl(330))),time(12,10,0)),0.86)belongs_to profile_DLH450_1, true, 100012,shielded). 

clause_impress( the_Segment(profile_DLH450_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(30)),fl_range(fl(330),fl(330))),time(12,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(40)),fl_range(fl(330),fl(330))),time(12,44,0)),0.86)belongs_to profile_DLH450_1, true, 100013,shielded). 

clause_impress( the_Segment(profile_DLH450_1,fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(40)),fl_range(fl(330),fl(330))),time(12,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(50)),fl_range(fl(330),fl(330))),time(13,18,0)),0.86)belongs_to profile_DLH450_1, true, 100014,shielded). 

clause_impress( the_Segment(profile_DLH450_1,fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(50)),fl_range(fl(330),fl(330))),time(13,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(60)),fl_range(fl(330),fl(330))),time(13,53,0)),0.86)belongs_to profile_DLH450_1, true, 100015,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DAL11_1,dal11), true, 100016,shielded). 

clause_impress( the_Type_of(dal11,md11), true, 100017,shielded). 

clause_impress( meets_mnps(dal11), true, 100018,shielded). 

clause_impress( the_Segment(profile_DAL11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(330),fl(330))),time(10,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,8,0)),0.83)belongs_to profile_DAL11_1, true, 100019,shielded). 

clause_impress( the_Segment(profile_DAL11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(11,55,0)),0.83)belongs_to profile_DAL11_1, true, 100020,shielded). 

clause_impress( the_Segment(profile_DAL11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(11,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(12,40,0)),0.83)belongs_to profile_DAL11_1, true, 100021,shielded). 

clause_impress( the_Segment(profile_DAL11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(12,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(330),fl(330))),time(13,24,0)),0.83)belongs_to profile_DAL11_1, true, 100022,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DAL39_1,dal39), true, 100023,shielded). 

clause_impress( the_Type_of(dal39,l101), true, 100024,shielded). 

clause_impress( meets_mnps(dal39), true, 100025,shielded). 

clause_impress( the_Segment(profile_DAL39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(310),fl(310))),time(10,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,8,0)),0.83)belongs_to profile_DAL39_1, true, 100026,shielded). 

clause_impress( the_Segment(profile_DAL39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(11,56,0)),0.83)belongs_to profile_DAL39_1, true, 100027,shielded). 

clause_impress( the_Segment(profile_DAL39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(11,56,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(12,42,0)),0.83)belongs_to profile_DAL39_1, true, 100028,shielded). 

clause_impress( the_Segment(profile_DAL39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(12,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(310),fl(310))),time(13,25,0)),0.83)belongs_to profile_DAL39_1, true, 100029,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DLH444_1,dlh444), true, 100030,shielded). 

clause_impress( the_Type_of(dlh444,ea34), true, 100031,shielded). 

clause_impress( meets_mnps(dlh444), true, 100032,shielded). 

clause_impress( the_Segment(profile_DLH444_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(350),fl(350))),time(10,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(11,7,0)),0.82)belongs_to profile_DLH444_1, true, 100033,shielded). 

clause_impress( the_Segment(profile_DLH444_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(11,7,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(11,56,0)),0.82)belongs_to profile_DLH444_1, true, 100034,shielded). 

clause_impress( the_Segment(profile_DLH444_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(11,56,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(12,42,0)),0.82)belongs_to profile_DLH444_1, true, 100035,shielded). 

clause_impress( the_Segment(profile_DLH444_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(12,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(350),fl(350))),time(13,28,0)),0.82)belongs_to profile_DLH444_1, true, 100036,shielded). 

clause_impress( the_Aircraft_on_profile(profile_TSC113_1,tsc113), true, 100037,shielded). 

clause_impress( the_Type_of(tsc113,b757), true, 100038,shielded). 

clause_impress( meets_mnps(tsc113), true, 100039,shielded). 

clause_impress( the_Segment(profile_TSC113_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(340),fl(340))),time(10,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(340),fl(340))),time(11,5,0)),0.8)belongs_to profile_TSC113_1, true, 100040,shielded). 

clause_impress( the_Segment(profile_TSC113_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(340),fl(340))),time(11,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(340),fl(340))),time(11,58,0)),0.8)belongs_to profile_TSC113_1, true, 100041,shielded). 

clause_impress( the_Segment(profile_TSC113_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(340),fl(340))),time(11,58,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(340),fl(340))),time(12,49,0)),0.8)belongs_to profile_TSC113_1, true, 100042,shielded). 

clause_impress( the_Segment(profile_TSC113_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(340),fl(340))),time(12,49,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(340),fl(340))),time(13,39,0)),0.8)belongs_to profile_TSC113_1, true, 100043,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AFR594_1,afr594), true, 100044,shielded). 

clause_impress( the_Type_of(afr594,b747), true, 100045,shielded). 

clause_impress( meets_mnps(afr594), true, 100046,shielded). 

clause_impress( the_Segment(profile_AFR594_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46,0),long_W(8,45)),fl_range(fl(330),fl(330))),time(10,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(10)),fl_range(fl(340),fl(340))),time(10,51,0)),0.84)belongs_to profile_AFR594_1, true, 100047,shielded). 

clause_impress( the_Segment(profile_AFR594_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(10)),fl_range(fl(340),fl(340))),time(10,51,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(340),fl(340))),time(11,40,0)),0.84)belongs_to profile_AFR594_1, true, 100048,shielded). 

clause_impress( the_Segment(profile_AFR594_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(340),fl(340))),time(11,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(41),long_W(30)),fl_range(fl(340),fl(340))),time(12,38,0)),0.84)belongs_to profile_AFR594_1, true, 100049,shielded). 

clause_impress( the_Segment(profile_AFR594_1,fourD_pt(threeD_pt(twoD_pt(lat_N(41),long_W(30)),fl_range(fl(340),fl(340))),time(12,38,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(40)),fl_range(fl(340),fl(340))),time(13,41,0)),0.84)belongs_to profile_AFR594_1, true, 100050,shielded). 

clause_impress( the_Aircraft_on_profile(profile_LKR501_1,lkr501), true, 100051,shielded). 

clause_impress( the_Type_of(lkr501,dc10), true, 100052,shielded). 

clause_impress( meets_mnps(lkr501), true, 100053,shielded). 

clause_impress( the_Segment(profile_LKR501_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(310),fl(310))),time(10,48,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(11,11,0)),0.83)belongs_to profile_LKR501_1, true, 100054,shielded). 

clause_impress( the_Segment(profile_LKR501_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(11,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(11,59,0)),0.83)belongs_to profile_LKR501_1, true, 100055,shielded). 

clause_impress( the_Segment(profile_LKR501_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(11,59,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(12,45,0)),0.83)belongs_to profile_LKR501_1, true, 100056,shielded). 

clause_impress( the_Segment(profile_LKR501_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(12,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(310),fl(310))),time(13,30,0)),0.83)belongs_to profile_LKR501_1, true, 100057,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DAL125_1,dal125), true, 100058,shielded). 

clause_impress( the_Type_of(dal125,l101), true, 100059,shielded). 

clause_impress( meets_mnps(dal125), true, 100060,shielded). 

clause_impress( the_Segment(profile_DAL125_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(310),fl(310))),time(10,37,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(11,15,0)),0.83)belongs_to profile_DAL125_1, true, 100061,shielded). 

clause_impress( the_Segment(profile_DAL125_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(11,15,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(12,1,0)),0.83)belongs_to profile_DAL125_1, true, 100062,shielded). 

clause_impress( the_Segment(profile_DAL125_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(12,1,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(12,44,0)),0.83)belongs_to profile_DAL125_1, true, 100063,shielded). 

clause_impress( the_Segment(profile_DAL125_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(12,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(310),fl(310))),time(13,25,0)),0.83)belongs_to profile_DAL125_1, true, 100064,shielded). 

clause_impress( the_Aircraft_on_profile(profile_KLM621_1,klm621), true, 100065,shielded). 

clause_impress( the_Type_of(klm621,b767), true, 100066,shielded). 

clause_impress( meets_mnps(klm621), true, 100067,shielded). 

clause_impress( the_Segment(profile_KLM621_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(330),fl(330))),time(10,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(330),fl(330))),time(11,9,0)),0.79)belongs_to profile_KLM621_1, true, 100068,shielded). 

clause_impress( the_Segment(profile_KLM621_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(330),fl(330))),time(11,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(330),fl(330))),time(12,2,0)),0.79)belongs_to profile_KLM621_1, true, 100069,shielded). 

clause_impress( the_Segment(profile_KLM621_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(330),fl(330))),time(12,2,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(330),fl(330))),time(12,54,0)),0.79)belongs_to profile_KLM621_1, true, 100070,shielded). 

clause_impress( the_Segment(profile_KLM621_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(330),fl(330))),time(12,54,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(330),fl(330))),time(13,44,0)),0.79)belongs_to profile_KLM621_1, true, 100071,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AAL71_1,aal71), true, 100072,shielded). 

clause_impress( the_Type_of(aal71,b767), true, 100073,shielded). 

clause_impress( meets_mnps(aal71), true, 100074,shielded). 

clause_impress( the_Segment(profile_AAL71_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(330),fl(330))),time(10,35,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(11,14,0)),0.8)belongs_to profile_AAL71_1, true, 100075,shielded). 

clause_impress( the_Segment(profile_AAL71_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(11,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(12,2,0)),0.8)belongs_to profile_AAL71_1, true, 100076,shielded). 

clause_impress( the_Segment(profile_AAL71_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(12,2,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(12,46,0)),0.8)belongs_to profile_AAL71_1, true, 100077,shielded). 

clause_impress( the_Segment(profile_AAL71_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(12,46,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(330),fl(330))),time(13,29,0)),0.8)belongs_to profile_AAL71_1, true, 100078,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DAL119_1,dal119), true, 100079,shielded). 

clause_impress( the_Type_of(dal119,b767), true, 100080,shielded). 

clause_impress( meets_mnps(dal119), true, 100081,shielded). 

clause_impress( the_Segment(profile_DAL119_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(360),fl(360))),time(10,48,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(11,13,0)),0.81)belongs_to profile_DAL119_1, true, 100082,shielded). 

clause_impress( the_Segment(profile_DAL119_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(11,13,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(12,3,0)),0.81)belongs_to profile_DAL119_1, true, 100083,shielded). 

clause_impress( the_Segment(profile_DAL119_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(12,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(12,50,0)),0.81)belongs_to profile_DAL119_1, true, 100084,shielded). 

clause_impress( the_Segment(profile_DAL119_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(12,50,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(360),fl(360))),time(13,36,0)),0.81)belongs_to profile_DAL119_1, true, 100085,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AAL101_1,aal101), true, 100086,shielded). 

clause_impress( the_Type_of(aal101,b767), true, 100087,shielded). 

clause_impress( meets_mnps(aal101), true, 100088,shielded). 

clause_impress( the_Segment(profile_AAL101_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(330),fl(330))),time(10,46,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(11,12,0)),0.79)belongs_to profile_AAL101_1, true, 100089,shielded). 

clause_impress( the_Segment(profile_AAL101_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(11,12,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,4,0)),0.79)belongs_to profile_AAL101_1, true, 100090,shielded). 

clause_impress( the_Segment(profile_AAL101_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(12,52,0)),0.79)belongs_to profile_AAL101_1, true, 100091,shielded). 

clause_impress( the_Segment(profile_AAL101_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(12,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(330),fl(330))),time(13,40,0)),0.79)belongs_to profile_AAL101_1, true, 100092,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DLH436_1,dlh436), true, 100093,shielded). 

clause_impress( the_Type_of(dlh436,ea34), true, 100094,shielded). 

clause_impress( meets_mnps(dlh436), true, 100095,shielded). 

clause_impress( the_Segment(profile_DLH436_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(340),fl(340))),time(10,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(340),fl(340))),time(11,17,0)),0.83)belongs_to profile_DLH436_1, true, 100096,shielded). 

clause_impress( the_Segment(profile_DLH436_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(340),fl(340))),time(11,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(340),fl(340))),time(12,4,0)),0.83)belongs_to profile_DLH436_1, true, 100097,shielded). 

clause_impress( the_Segment(profile_DLH436_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(340),fl(340))),time(12,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(340),fl(340))),time(12,46,0)),0.83)belongs_to profile_DLH436_1, true, 100098,shielded). 

clause_impress( the_Segment(profile_DLH436_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(340),fl(340))),time(12,46,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(340),fl(340))),time(13,27,0)),0.83)belongs_to profile_DLH436_1, true, 100099,shielded). 

clause_impress( the_Aircraft_on_profile(profile_ULE709_1,ule709), true, 100100,shielded). 

clause_impress( the_Type_of(ule709,b767), true, 100101,shielded). 

clause_impress( meets_mnps(ule709), true, 100102,shielded). 

clause_impress( the_Segment(profile_ULE709_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(340),fl(340))),time(10,48,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(11,14,0)),0.8)belongs_to profile_ULE709_1, true, 100103,shielded). 

clause_impress( the_Segment(profile_ULE709_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(11,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(12,5,0)),0.8)belongs_to profile_ULE709_1, true, 100104,shielded). 

clause_impress( the_Segment(profile_ULE709_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(12,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(12,53,0)),0.8)belongs_to profile_ULE709_1, true, 100105,shielded). 

clause_impress( the_Segment(profile_ULE709_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(12,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(340),fl(340))),time(13,39,0)),0.8)belongs_to profile_ULE709_1, true, 100106,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AFR222_1,afr222), true, 100107,shielded). 

clause_impress( the_Type_of(afr222,ea34), true, 100108,shielded). 

clause_impress( meets_mnps(afr222), true, 100109,shielded). 

clause_impress( the_Segment(profile_AFR222_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46,0),long_W(8,45)),fl_range(fl(340),fl(340))),time(11,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(15)),fl_range(fl(340),fl(340))),time(12,5,0)),0.81)belongs_to profile_AFR222_1, true, 100110,shielded). 

clause_impress( the_Segment(profile_AFR222_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(15)),fl_range(fl(340),fl(340))),time(12,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(43),long_W(20)),fl_range(fl(340),fl(340))),time(12,35,0)),0.81)belongs_to profile_AFR222_1, true, 100111,shielded). 

clause_impress( the_Segment(profile_AFR222_1,fourD_pt(threeD_pt(twoD_pt(lat_N(43),long_W(20)),fl_range(fl(340),fl(340))),time(12,35,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(30)),fl_range(fl(340),fl(340))),time(13,34,0)),0.81)belongs_to profile_AFR222_1, true, 100112,shielded). 

clause_impress( the_Aircraft_on_profile(profile_KLM604_1,klm604), true, 100113,shielded). 

clause_impress( the_Type_of(klm604,b747), true, 100114,shielded). 

clause_impress( meets_mnps(klm604), true, 100115,shielded). 

clause_impress( the_Segment(profile_KLM604_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(20)),fl_range(fl(340),fl(340))),time(11,51,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(10)),fl_range(fl(340),fl(340))),time(12,25,0)),0.84)belongs_to profile_KLM604_1, true, 100116,shielded). 

clause_impress( the_Aircraft_on_profile(profile_N252C_1,n252c), true, 100117,shielded). 

clause_impress( the_Type_of(n252c,g4), true, 100118,shielded). 

clause_impress( meets_mnps(n252c), true, 100119,shielded). 

clause_impress( the_Segment(profile_N252C_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(10)),fl_range(fl(390),fl(390))),time(10,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(390),fl(390))),time(11,18,0)),0.8)belongs_to profile_N252C_1, true, 100120,shielded). 

clause_impress( the_Segment(profile_N252C_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(390),fl(390))),time(11,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(390),fl(390))),time(12,7,0)),0.8)belongs_to profile_N252C_1, true, 100121,shielded). 

clause_impress( the_Segment(profile_N252C_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(390),fl(390))),time(12,7,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(390),fl(390))),time(12,49,0)),0.8)belongs_to profile_N252C_1, true, 100122,shielded). 

clause_impress( the_Segment(profile_N252C_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(390),fl(390))),time(12,49,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(50)),fl_range(fl(390),fl(390))),time(13,31,0)),0.8)belongs_to profile_N252C_1, true, 100123,shielded). 

clause_impress( the_Aircraft_on_profile(profile_BAW9612_1,baw9612), true, 100124,shielded). 

clause_impress( the_Type_of(baw9612,b747), true, 100125,shielded). 

clause_impress( meets_mnps(baw9612), true, 100126,shielded). 

clause_impress( the_Segment(profile_BAW9612_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(330),fl(330))),time(10,56,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,20,0)),0.84)belongs_to profile_BAW9612_1, true, 100127,shielded). 

clause_impress( the_Segment(profile_BAW9612_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,20,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(12,8,0)),0.84)belongs_to profile_BAW9612_1, true, 100128,shielded). 

clause_impress( the_Segment(profile_BAW9612_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(12,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(12,52,0)),0.84)belongs_to profile_BAW9612_1, true, 100129,shielded). 

clause_impress( the_Segment(profile_BAW9612_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(12,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(330),fl(330))),time(13,36,0)),0.84)belongs_to profile_BAW9612_1, true, 100130,shielded). 

clause_impress( the_Aircraft_on_profile(profile_BAW9683_1,baw9683), true, 100131,shielded). 

clause_impress( the_Type_of(baw9683,dc10), true, 100132,shielded). 

clause_impress( meets_mnps(baw9683), true, 100133,shielded). 

clause_impress( the_Segment(profile_BAW9683_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(15)),fl_range(fl(280),fl(280))),time(11,0,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(280),fl(280))),time(11,25,0)),0.82)belongs_to profile_BAW9683_1, true, 100134,shielded). 

clause_impress( the_Segment(profile_BAW9683_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(280),fl(280))),time(11,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(280),fl(280))),time(12,21,0)),0.82)belongs_to profile_BAW9683_1, true, 100135,shielded). 

clause_impress( the_Segment(profile_BAW9683_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(280),fl(280))),time(12,21,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(280),fl(280))),time(13,22,0)),0.82)belongs_to profile_BAW9683_1, true, 100136,shielded). 

clause_impress( the_Segment(profile_BAW9683_1,fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(280),fl(280))),time(13,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(50)),fl_range(fl(280),fl(280))),time(14,25,0)),0.82)belongs_to profile_BAW9683_1, true, 100137,shielded). 

clause_impress( the_Aircraft_on_profile(profile_BAW9671_1,baw9671), true, 100138,shielded). 

clause_impress( the_Type_of(baw9671,dc10), true, 100139,shielded). 

clause_impress( meets_mnps(baw9671), true, 100140,shielded). 

clause_impress( the_Segment(profile_BAW9671_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(310),fl(310))),time(10,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,21,0)),0.82)belongs_to profile_BAW9671_1, true, 100141,shielded). 

clause_impress( the_Segment(profile_BAW9671_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,21,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(12,9,0)),0.82)belongs_to profile_BAW9671_1, true, 100142,shielded). 

clause_impress( the_Segment(profile_BAW9671_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(12,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(12,55,0)),0.82)belongs_to profile_BAW9671_1, true, 100143,shielded). 

clause_impress( the_Segment(profile_BAW9671_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(12,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(310),fl(310))),time(13,40,0)),0.82)belongs_to profile_BAW9671_1, true, 100144,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AAL137_1,aal137), true, 100145,shielded). 

clause_impress( the_Type_of(aal137,b767), true, 100146,shielded). 

clause_impress( meets_mnps(aal137), true, 100147,shielded). 

clause_impress( the_Segment(profile_AAL137_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(10)),fl_range(fl(310),fl(310))),time(10,35,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(20)),fl_range(fl(310),fl(310))),time(11,25,0)),0.8)belongs_to profile_AAL137_1, true, 100148,shielded). 

clause_impress( the_Segment(profile_AAL137_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(20)),fl_range(fl(310),fl(310))),time(11,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(30)),fl_range(fl(310),fl(310))),time(12,10,0)),0.8)belongs_to profile_AAL137_1, true, 100149,shielded). 

clause_impress( the_Segment(profile_AAL137_1,fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(30)),fl_range(fl(310),fl(310))),time(12,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(40)),fl_range(fl(310),fl(310))),time(12,49,0)),0.8)belongs_to profile_AAL137_1, true, 100150,shielded). 

clause_impress( the_Segment(profile_AAL137_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(40)),fl_range(fl(310),fl(310))),time(12,49,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(50)),fl_range(fl(310),fl(310))),time(13,26,0)),0.8)belongs_to profile_AAL137_1, true, 100151,shielded). 

clause_impress( the_Segment(profile_AAL137_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(50)),fl_range(fl(310),fl(310))),time(13,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(60)),fl_range(fl(310),fl(310))),time(14,8,0)),0.8)belongs_to profile_AAL137_1, true, 100152,shielded). 

clause_impress( the_Aircraft_on_profile(profile_VIR075_1,vir075), true, 100153,shielded). 

clause_impress( the_Type_of(vir075,ea34), true, 100154,shielded). 

clause_impress( meets_mnps(vir075), true, 100155,shielded). 

clause_impress( the_Segment(profile_VIR075_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(350),fl(350))),time(10,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(350),fl(350))),time(11,22,0)),0.82)belongs_to profile_VIR075_1, true, 100156,shielded). 

clause_impress( the_Segment(profile_VIR075_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(350),fl(350))),time(11,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(350),fl(350))),time(12,10,0)),0.82)belongs_to profile_VIR075_1, true, 100157,shielded). 

clause_impress( the_Segment(profile_VIR075_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(350),fl(350))),time(12,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(350),fl(350))),time(12,55,0)),0.82)belongs_to profile_VIR075_1, true, 100158,shielded). 

clause_impress( the_Segment(profile_VIR075_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(350),fl(350))),time(12,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(350),fl(350))),time(13,39,0)),0.82)belongs_to profile_VIR075_1, true, 100159,shielded). 

clause_impress( the_Aircraft_on_profile(profile_BAW285_1,baw285), true, 100160,shielded). 

clause_impress( the_Type_of(baw285,b74f), true, 100161,shielded). 

clause_impress( meets_mnps(baw285), true, 100162,shielded). 

clause_impress( the_Segment(profile_BAW285_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(10)),fl_range(fl(290),fl(290))),time(11,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(20)),fl_range(fl(290),fl(290))),time(12,4,0)),0.86)belongs_to profile_BAW285_1, true, 100163,shielded). 

clause_impress( the_Segment(profile_BAW285_1,fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(20)),fl_range(fl(290),fl(290))),time(12,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(66),long_W(30)),fl_range(fl(290),fl(290))),time(12,51,0)),0.86)belongs_to profile_BAW285_1, true, 100164,shielded). 

clause_impress( the_Segment(profile_BAW285_1,fourD_pt(threeD_pt(twoD_pt(lat_N(66),long_W(30)),fl_range(fl(290),fl(290))),time(12,51,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(68),long_W(40)),fl_range(fl(290),fl(290))),time(13,24,0)),0.86)belongs_to profile_BAW285_1, true, 100165,shielded). 

clause_impress( the_Segment(profile_BAW285_1,fourD_pt(threeD_pt(twoD_pt(lat_N(68),long_W(40)),fl_range(fl(290),fl(290))),time(13,24,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(69),long_W(50)),fl_range(fl(290),fl(290))),time(13,52,0)),0.86)belongs_to profile_BAW285_1, true, 100166,shielded). 

clause_impress( the_Aircraft_on_profile(profile_LTU900_1,ltu900), true, 100167,shielded). 

clause_impress( the_Type_of(ltu900,b767), true, 100168,shielded). 

clause_impress( meets_mnps(ltu900), true, 100169,shielded). 

clause_impress( the_Segment(profile_LTU900_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(15)),fl_range(fl(310),fl(310))),time(11,1,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(310),fl(310))),time(11,27,0)),0.81)belongs_to profile_LTU900_1, true, 100170,shielded). 

clause_impress( the_Segment(profile_LTU900_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(310),fl(310))),time(11,27,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(310),fl(310))),time(12,25,0)),0.81)belongs_to profile_LTU900_1, true, 100171,shielded). 

clause_impress( the_Segment(profile_LTU900_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(310),fl(310))),time(12,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(310),fl(310))),time(13,27,0)),0.81)belongs_to profile_LTU900_1, true, 100172,shielded). 

clause_impress( the_Segment(profile_LTU900_1,fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(310),fl(310))),time(13,27,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(50)),fl_range(fl(310),fl(310))),time(14,32,0)),0.81)belongs_to profile_LTU900_1, true, 100173,shielded). 

clause_impress( the_Aircraft_on_profile(profile_SWR126_1,swr126), true, 100174,shielded). 

clause_impress( the_Type_of(swr126,b747), true, 100175,shielded). 

clause_impress( meets_mnps(swr126), true, 100176,shielded). 

clause_impress( the_Segment(profile_SWR126_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(350),fl(350))),time(11,1,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(11,25,0)),0.84)belongs_to profile_SWR126_1, true, 100177,shielded). 

clause_impress( the_Segment(profile_SWR126_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(11,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(12,12,0)),0.84)belongs_to profile_SWR126_1, true, 100178,shielded). 

clause_impress( the_Segment(profile_SWR126_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(12,12,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(12,57,0)),0.84)belongs_to profile_SWR126_1, true, 100179,shielded). 

clause_impress( the_Segment(profile_SWR126_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(12,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(350),fl(350))),time(13,42,0)),0.84)belongs_to profile_SWR126_1, true, 100180,shielded). 

clause_impress( the_Aircraft_on_profile(profile_UAL961_1,ual961), true, 100181,shielded). 

clause_impress( the_Type_of(ual961,b777), true, 100182,shielded). 

clause_impress( meets_mnps(ual961), true, 100183,shielded). 

clause_impress( the_Segment(profile_UAL961_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(10)),fl_range(fl(350),fl(350))),time(11,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(20)),fl_range(fl(350),fl(350))),time(12,33,0)),0.84)belongs_to profile_UAL961_1, true, 100184,shielded). 

clause_impress( the_Segment(profile_UAL961_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(20)),fl_range(fl(350),fl(350))),time(12,33,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(65),long_W(30)),fl_range(fl(350),fl(350))),time(13,14,0)),0.84)belongs_to profile_UAL961_1, true, 100185,shielded). 

clause_impress( the_Segment(profile_UAL961_1,fourD_pt(threeD_pt(twoD_pt(lat_N(65),long_W(30)),fl_range(fl(350),fl(350))),time(13,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(66),long_W(40)),fl_range(fl(350),fl(350))),time(13,46,0)),0.84)belongs_to profile_UAL961_1, true, 100186,shielded). 

clause_impress( the_Segment(profile_UAL961_1,fourD_pt(threeD_pt(twoD_pt(lat_N(66),long_W(40)),fl_range(fl(350),fl(350))),time(13,46,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(67),long_W(50)),fl_range(fl(350),fl(350))),time(14,18,0)),0.84)belongs_to profile_UAL961_1, true, 100187,shielded). 

clause_impress( the_Aircraft_on_profile(profile_COA21_1,coa21), true, 100188,shielded). 

clause_impress( the_Type_of(coa21,dc10), true, 100189,shielded). 

clause_impress( meets_mnps(coa21), true, 100190,shielded). 

clause_impress( the_Segment(profile_COA21_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(310),fl(310))),time(10,50,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(11,28,0)),0.83)belongs_to profile_COA21_1, true, 100191,shielded). 

clause_impress( the_Segment(profile_COA21_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(11,28,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(12,14,0)),0.83)belongs_to profile_COA21_1, true, 100192,shielded). 

clause_impress( the_Segment(profile_COA21_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(12,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(12,57,0)),0.83)belongs_to profile_COA21_1, true, 100193,shielded). 

clause_impress( the_Segment(profile_COA21_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(12,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(310),fl(310))),time(13,38,0)),0.83)belongs_to profile_COA21_1, true, 100194,shielded). 

clause_impress( the_Aircraft_on_profile(profile_USA817_1,usa817), true, 100195,shielded). 

clause_impress( the_Type_of(usa817,b767), true, 100196,shielded). 

clause_impress( meets_mnps(usa817), true, 100197,shielded). 

clause_impress( the_Segment(profile_USA817_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(360),fl(360))),time(11,0,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(11,25,0)),0.8)belongs_to profile_USA817_1, true, 100198,shielded). 

clause_impress( the_Segment(profile_USA817_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(11,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(12,16,0)),0.8)belongs_to profile_USA817_1, true, 100199,shielded). 

clause_impress( the_Segment(profile_USA817_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(12,16,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(13,4,0)),0.8)belongs_to profile_USA817_1, true, 100200,shielded). 

clause_impress( the_Segment(profile_USA817_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(13,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(360),fl(360))),time(13,50,0)),0.8)belongs_to profile_USA817_1, true, 100201,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AFR004_1,afr004), true, 100202,shielded). 

clause_impress( the_Type_of(afr004,b747), true, 100203,shielded). 

clause_impress( meets_mnps(afr004), true, 100204,shielded). 

clause_impress( the_Segment(profile_AFR004_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(310),fl(310))),time(11,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(11,29,0)),0.84)belongs_to profile_AFR004_1, true, 100205,shielded). 

clause_impress( the_Segment(profile_AFR004_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(11,29,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(12,17,0)),0.84)belongs_to profile_AFR004_1, true, 100206,shielded). 

clause_impress( the_Segment(profile_AFR004_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(12,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,4,0)),0.84)belongs_to profile_AFR004_1, true, 100207,shielded). 

clause_impress( the_Segment(profile_AFR004_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(310),fl(310))),time(13,50,0)),0.84)belongs_to profile_AFR004_1, true, 100208,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AAL63_1,aal63), true, 100209,shielded). 

clause_impress( the_Type_of(aal63,b767), true, 100210,shielded). 

clause_impress( meets_mnps(aal63), true, 100211,shielded). 

clause_impress( the_Segment(profile_AAL63_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(15)),fl_range(fl(340),fl(340))),time(11,6,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(340),fl(340))),time(11,32,0)),0.8)belongs_to profile_AAL63_1, true, 100212,shielded). 

clause_impress( the_Segment(profile_AAL63_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(340),fl(340))),time(11,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(340),fl(340))),time(12,32,0)),0.8)belongs_to profile_AAL63_1, true, 100213,shielded). 

clause_impress( the_Segment(profile_AAL63_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(340),fl(340))),time(12,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(340),fl(340))),time(13,35,0)),0.8)belongs_to profile_AAL63_1, true, 100214,shielded). 

clause_impress( the_Segment(profile_AAL63_1,fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(340),fl(340))),time(13,35,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(50)),fl_range(fl(340),fl(340))),time(14,41,0)),0.8)belongs_to profile_AAL63_1, true, 100215,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AIH061_1,aih061), true, 100216,shielded). 

clause_impress( the_Type_of(aih061,b767), true, 100217,shielded). 

clause_impress( meets_mnps(aih061), true, 100218,shielded). 

clause_impress( the_Segment(profile_AIH061_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(340),fl(340))),time(11,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(340),fl(340))),time(11,28,0)),0.8)belongs_to profile_AIH061_1, true, 100219,shielded). 

clause_impress( the_Segment(profile_AIH061_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(340),fl(340))),time(11,28,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(340),fl(340))),time(12,18,0)),0.8)belongs_to profile_AIH061_1, true, 100220,shielded). 

clause_impress( the_Segment(profile_AIH061_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(340),fl(340))),time(12,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(340),fl(340))),time(13,4,0)),0.8)belongs_to profile_AIH061_1, true, 100221,shielded). 

clause_impress( the_Segment(profile_AIH061_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(340),fl(340))),time(13,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(340),fl(340))),time(13,50,0)),0.8)belongs_to profile_AIH061_1, true, 100222,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AFL344B_1,afl344b), true, 100223,shielded). 

clause_impress( the_Type_of(afl344b,il62), true, 100224,shielded). 

clause_impress( the_Segment(profile_AFL344B_1,fourD_pt(threeD_pt(twoD_pt(lat_N(51),long_W(40)),fl_range(fl(290),fl(290))),time(10,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(290),fl(290))),time(11,33,0)),0.8)belongs_to profile_AFL344B_1, true, 100225,shielded). 

clause_impress( the_Segment(profile_AFL344B_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(290),fl(290))),time(11,33,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(290),fl(290))),time(12,16,0)),0.8)belongs_to profile_AFL344B_1, true, 100226,shielded). 

clause_impress( the_Segment(profile_AFL344B_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(290),fl(290))),time(12,16,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(290),fl(290))),time(12,38,0)),0.8)belongs_to profile_AFL344B_1, true, 100227,shielded). 

clause_impress( the_Aircraft_on_profile(profile_SWR124_1,swr124), true, 100228,shielded). 

clause_impress( the_Type_of(swr124,md11), true, 100229,shielded). 

clause_impress( meets_mnps(swr124), true, 100230,shielded). 

clause_impress( the_Segment(profile_SWR124_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(10)),fl_range(fl(330),fl(330))),time(10,49,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(330),fl(330))),time(11,36,0)),0.82)belongs_to profile_SWR124_1, true, 100231,shielded). 

clause_impress( the_Segment(profile_SWR124_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(330),fl(330))),time(11,36,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(330),fl(330))),time(12,21,0)),0.82)belongs_to profile_SWR124_1, true, 100232,shielded). 

clause_impress( the_Segment(profile_SWR124_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(330),fl(330))),time(12,21,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(330),fl(330))),time(13,2,0)),0.82)belongs_to profile_SWR124_1, true, 100233,shielded). 

clause_impress( the_Segment(profile_SWR124_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(330),fl(330))),time(13,2,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(50)),fl_range(fl(330),fl(330))),time(13,43,0)),0.82)belongs_to profile_SWR124_1, true, 100234,shielded). 

clause_impress( the_Aircraft_on_profile(profile_BAW299_1,baw299), true, 100235,shielded). 

clause_impress( the_Type_of(baw299,b747), true, 100236,shielded). 

clause_impress( meets_mnps(baw299), true, 100237,shielded). 

clause_impress( the_Segment(profile_BAW299_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(330),fl(330))),time(10,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(11,34,0)),0.84)belongs_to profile_BAW299_1, true, 100238,shielded). 

clause_impress( the_Segment(profile_BAW299_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(11,34,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(12,21,0)),0.84)belongs_to profile_BAW299_1, true, 100239,shielded). 

clause_impress( the_Segment(profile_BAW299_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(12,21,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(13,3,0)),0.84)belongs_to profile_BAW299_1, true, 100240,shielded). 

clause_impress( the_Segment(profile_BAW299_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(13,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(330),fl(330))),time(13,44,0)),0.84)belongs_to profile_BAW299_1, true, 100241,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AAL51_1,aal51), true, 100242,shielded). 

clause_impress( the_Type_of(aal51,md11), true, 100243,shielded). 

clause_impress( meets_mnps(aal51), true, 100244,shielded). 

clause_impress( the_Segment(profile_AAL51_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(330),fl(330))),time(11,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,34,0)),0.83)belongs_to profile_AAL51_1, true, 100245,shielded). 

clause_impress( the_Segment(profile_AAL51_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,34,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(12,21,0)),0.83)belongs_to profile_AAL51_1, true, 100246,shielded). 

clause_impress( the_Segment(profile_AAL51_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(12,21,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(13,6,0)),0.83)belongs_to profile_AAL51_1, true, 100247,shielded). 

clause_impress( the_Segment(profile_AAL51_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(13,6,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(330),fl(330))),time(13,50,0)),0.83)belongs_to profile_AAL51_1, true, 100248,shielded). 

clause_impress( the_Aircraft_on_profile(profile_UAL977_1,ual977), true, 100249,shielded). 

clause_impress( the_Type_of(ual977,b767), true, 100250,shielded). 

clause_impress( meets_mnps(ual977), true, 100251,shielded). 

clause_impress( the_Segment(profile_UAL977_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(330),fl(330))),time(11,7,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(11,33,0)),0.81)belongs_to profile_UAL977_1, true, 100252,shielded). 

clause_impress( the_Segment(profile_UAL977_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(11,33,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,23,0)),0.81)belongs_to profile_UAL977_1, true, 100253,shielded). 

clause_impress( the_Segment(profile_UAL977_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,23,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(13,10,0)),0.81)belongs_to profile_UAL977_1, true, 100254,shielded). 

clause_impress( the_Segment(profile_UAL977_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(13,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(330),fl(330))),time(13,56,0)),0.81)belongs_to profile_UAL977_1, true, 100255,shielded). 

clause_impress( the_Aircraft_on_profile(profile_KLM601_1,klm601), true, 100256,shielded). 

clause_impress( the_Type_of(klm601,b747), true, 100257,shielded). 

clause_impress( meets_mnps(klm601), true, 100258,shielded). 

clause_impress( the_Segment(profile_KLM601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(10)),fl_range(fl(280),fl(280))),time(11,19,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(20)),fl_range(fl(280),fl(280))),time(12,7,0)),0.85)belongs_to profile_KLM601_1, true, 100259,shielded). 

clause_impress( the_Segment(profile_KLM601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(20)),fl_range(fl(280),fl(280))),time(12,7,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(30)),fl_range(fl(280),fl(280))),time(12,45,0)),0.85)belongs_to profile_KLM601_1, true, 100260,shielded). 

clause_impress( the_Segment(profile_KLM601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(30)),fl_range(fl(280),fl(280))),time(12,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(40)),fl_range(fl(280),fl(280))),time(13,19,0)),0.85)belongs_to profile_KLM601_1, true, 100261,shielded). 

clause_impress( the_Segment(profile_KLM601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(40)),fl_range(fl(280),fl(280))),time(13,19,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(50)),fl_range(fl(280),fl(280))),time(13,53,0)),0.85)belongs_to profile_KLM601_1, true, 100262,shielded). 

clause_impress( the_Segment(profile_KLM601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(50)),fl_range(fl(280),fl(280))),time(13,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(60)),fl_range(fl(280),fl(280))),time(14,28,0)),0.85)belongs_to profile_KLM601_1, true, 100263,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AAL37_1,aal37), true, 100264,shielded). 

clause_impress( the_Type_of(aal37,b767), true, 100265,shielded). 

clause_impress( meets_mnps(aal37), true, 100266,shielded). 

clause_impress( the_Segment(profile_AAL37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(350),fl(350))),time(10,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(350),fl(350))),time(11,35,0)),0.8)belongs_to profile_AAL37_1, true, 100267,shielded). 

clause_impress( the_Segment(profile_AAL37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(350),fl(350))),time(11,35,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(350),fl(350))),time(12,24,0)),0.8)belongs_to profile_AAL37_1, true, 100268,shielded). 

clause_impress( the_Segment(profile_AAL37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(350),fl(350))),time(12,24,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(350),fl(350))),time(13,8,0)),0.8)belongs_to profile_AAL37_1, true, 100269,shielded). 

clause_impress( the_Segment(profile_AAL37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(350),fl(350))),time(13,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(350),fl(350))),time(13,51,0)),0.8)belongs_to profile_AAL37_1, true, 100270,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AAL23_1,aal23), true, 100271,shielded). 

clause_impress( the_Type_of(aal23,b767), true, 100272,shielded). 

clause_impress( meets_mnps(aal23), true, 100273,shielded). 

clause_impress( the_Segment(profile_AAL23_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(360),fl(360))),time(10,56,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(360),fl(360))),time(11,36,0)),0.8)belongs_to profile_AAL23_1, true, 100274,shielded). 

clause_impress( the_Segment(profile_AAL23_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(360),fl(360))),time(11,36,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(360),fl(360))),time(12,25,0)),0.8)belongs_to profile_AAL23_1, true, 100275,shielded). 

clause_impress( the_Segment(profile_AAL23_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(360),fl(360))),time(12,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(360),fl(360))),time(13,9,0)),0.8)belongs_to profile_AAL23_1, true, 100276,shielded). 

clause_impress( the_Segment(profile_AAL23_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(360),fl(360))),time(13,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(360),fl(360))),time(13,52,0)),0.8)belongs_to profile_AAL23_1, true, 100277,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DLH8174_1,dlh8174), true, 100278,shielded). 

clause_impress( the_Type_of(dlh8174,b747), true, 100279,shielded). 

clause_impress( meets_mnps(dlh8174), true, 100280,shielded). 

clause_impress( the_Segment(profile_DLH8174_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(310),fl(310))),time(11,15,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,38,0)),0.84)belongs_to profile_DLH8174_1, true, 100281,shielded). 

clause_impress( the_Segment(profile_DLH8174_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,38,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(12,26,0)),0.84)belongs_to profile_DLH8174_1, true, 100282,shielded). 

clause_impress( the_Segment(profile_DLH8174_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(12,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(13,11,0)),0.84)belongs_to profile_DLH8174_1, true, 100283,shielded). 

clause_impress( the_Segment(profile_DLH8174_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(13,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(310),fl(310))),time(13,54,0)),0.84)belongs_to profile_DLH8174_1, true, 100284,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AFL315_1,afl315), true, 100285,shielded). 

clause_impress( the_Type_of(afl315,b767), true, 100286,shielded). 

clause_impress( meets_mnps(afl315), true, 100287,shielded). 

clause_impress( the_Segment(profile_AFL315_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(350),fl(350))),time(11,12,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(350),fl(350))),time(11,37,0)),0.81)belongs_to profile_AFL315_1, true, 100288,shielded). 

clause_impress( the_Segment(profile_AFL315_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(350),fl(350))),time(11,37,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(350),fl(350))),time(12,26,0)),0.81)belongs_to profile_AFL315_1, true, 100289,shielded). 

clause_impress( the_Segment(profile_AFL315_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(350),fl(350))),time(12,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(350),fl(350))),time(13,11,0)),0.81)belongs_to profile_AFL315_1, true, 100290,shielded). 

clause_impress( the_Segment(profile_AFL315_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(350),fl(350))),time(13,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(350),fl(350))),time(13,56,0)),0.81)belongs_to profile_AFL315_1, true, 100291,shielded). 

clause_impress( the_Aircraft_on_profile(profile_VIR019_1,vir019), true, 100292,shielded). 

clause_impress( the_Type_of(vir019,b74f), true, 100293,shielded). 

clause_impress( meets_mnps(vir019), true, 100294,shielded). 

clause_impress( the_Segment(profile_VIR019_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(10)),fl_range(fl(330),fl(330))),time(11,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(20)),fl_range(fl(330),fl(330))),time(12,13,0)),0.86)belongs_to profile_VIR019_1, true, 100295,shielded). 

clause_impress( the_Segment(profile_VIR019_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(20)),fl_range(fl(330),fl(330))),time(12,13,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(30)),fl_range(fl(330),fl(330))),time(12,55,0)),0.86)belongs_to profile_VIR019_1, true, 100296,shielded). 

clause_impress( the_Segment(profile_VIR019_1,fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(30)),fl_range(fl(330),fl(330))),time(12,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(65),long_W(40)),fl_range(fl(330),fl(330))),time(13,29,0)),0.86)belongs_to profile_VIR019_1, true, 100297,shielded). 

clause_impress( the_Segment(profile_VIR019_1,fourD_pt(threeD_pt(twoD_pt(lat_N(65),long_W(40)),fl_range(fl(330),fl(330))),time(13,29,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(66),long_W(50)),fl_range(fl(330),fl(330))),time(14,1,0)),0.86)belongs_to profile_VIR019_1, true, 100298,shielded). 

clause_impress( the_Segment(profile_VIR019_1,fourD_pt(threeD_pt(twoD_pt(lat_N(66),long_W(50)),fl_range(fl(330),fl(330))),time(14,1,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(66),long_W(60)),fl_range(fl(330),fl(330))),time(14,32,0)),0.86)belongs_to profile_VIR019_1, true, 100299,shielded). 

clause_impress( the_Aircraft_on_profile(profile_BAW2253_1,baw2253), true, 100300,shielded). 

clause_impress( the_Type_of(baw2253,b747), true, 100301,shielded). 

clause_impress( meets_mnps(baw2253), true, 100302,shielded). 

clause_impress( the_Segment(profile_BAW2253_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(15)),fl_range(fl(340),fl(340))),time(11,36,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(340),fl(340))),time(12,3,0)),0.84)belongs_to profile_BAW2253_1, true, 100303,shielded). 

clause_impress( the_Segment(profile_BAW2253_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(340),fl(340))),time(12,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(24)),fl_range(fl(340),fl(340))),time(12,27,0)),0.84)belongs_to profile_BAW2253_1, true, 100304,shielded). 

clause_impress( the_Segment(profile_BAW2253_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(24)),fl_range(fl(340),fl(340))),time(12,27,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(340),fl(340))),time(13,3,0)),0.84)belongs_to profile_BAW2253_1, true, 100305,shielded). 

clause_impress( the_Segment(profile_BAW2253_1,fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(340),fl(340))),time(13,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(40)),fl_range(fl(340),fl(340))),time(14,10,0)),0.84)belongs_to profile_BAW2253_1, true, 100306,shielded). 

clause_impress( the_Aircraft_on_profile(profile_CKT77_1,ckt77), true, 100307,shielded). 

clause_impress( the_Type_of(ckt77,b767), true, 100308,shielded). 

clause_impress( meets_mnps(ckt77), true, 100309,shielded). 

clause_impress( the_Segment(profile_CKT77_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48,47),long_W(12,0)),fl_range(fl(340),fl(340))),time(11,12,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(340),fl(340))),time(12,3,0)),0.8)belongs_to profile_CKT77_1, true, 100310,shielded). 

clause_impress( the_Segment(profile_CKT77_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(340),fl(340))),time(12,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(30)),fl_range(fl(340),fl(340))),time(13,7,0)),0.8)belongs_to profile_CKT77_1, true, 100311,shielded). 

clause_impress( the_Aircraft_on_profile(profile_KLM665_1,klm665), true, 100312,shielded). 

clause_impress( the_Type_of(klm665,b747), true, 100313,shielded). 

clause_impress( meets_mnps(klm665), true, 100314,shielded). 

clause_impress( the_Segment(profile_KLM665_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(10)),fl_range(fl(310),fl(310))),time(11,23,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(20)),fl_range(fl(310),fl(310))),time(12,11,0)),0.85)belongs_to profile_KLM665_1, true, 100315,shielded). 

clause_impress( the_Segment(profile_KLM665_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(20)),fl_range(fl(310),fl(310))),time(12,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(30)),fl_range(fl(310),fl(310))),time(12,50,0)),0.85)belongs_to profile_KLM665_1, true, 100316,shielded). 

clause_impress( the_Segment(profile_KLM665_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(30)),fl_range(fl(310),fl(310))),time(12,50,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(40)),fl_range(fl(310),fl(310))),time(13,25,0)),0.85)belongs_to profile_KLM665_1, true, 100317,shielded). 

clause_impress( the_Segment(profile_KLM665_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(40)),fl_range(fl(310),fl(310))),time(13,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(50)),fl_range(fl(310),fl(310))),time(14,2,0)),0.85)belongs_to profile_KLM665_1, true, 100318,shielded). 

clause_impress( the_Aircraft_on_profile(profile_SAS941_1,sas941), true, 100319,shielded). 

clause_impress( the_Type_of(sas941,b767), true, 100320,shielded). 

clause_impress( meets_mnps(sas941), true, 100321,shielded). 

clause_impress( the_Segment(profile_SAS941_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(10)),fl_range(fl(310),fl(310))),time(10,59,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(20)),fl_range(fl(310),fl(310))),time(11,47,0)),0.82)belongs_to profile_SAS941_1, true, 100322,shielded). 

clause_impress( the_Segment(profile_SAS941_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(20)),fl_range(fl(310),fl(310))),time(11,47,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(30)),fl_range(fl(310),fl(310))),time(12,29,0)),0.82)belongs_to profile_SAS941_1, true, 100323,shielded). 

clause_impress( the_Segment(profile_SAS941_1,fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(30)),fl_range(fl(310),fl(310))),time(12,29,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(40)),fl_range(fl(310),fl(310))),time(13,6,0)),0.82)belongs_to profile_SAS941_1, true, 100324,shielded). 

clause_impress( the_Segment(profile_SAS941_1,fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(40)),fl_range(fl(310),fl(310))),time(13,6,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(50)),fl_range(fl(310),fl(310))),time(13,46,0)),0.82)belongs_to profile_SAS941_1, true, 100325,shielded). 

clause_impress( the_Aircraft_on_profile(profile_VIR005_1,vir005), true, 100326,shielded). 

clause_impress( the_Type_of(vir005,b747), true, 100327,shielded). 

clause_impress( meets_mnps(vir005), true, 100328,shielded). 

clause_impress( the_Segment(profile_VIR005_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(15)),fl_range(fl(310),fl(310))),time(11,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(310),fl(310))),time(11,46,0)),0.83)belongs_to profile_VIR005_1, true, 100329,shielded). 

clause_impress( the_Segment(profile_VIR005_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(310),fl(310))),time(11,46,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(310),fl(310))),time(12,43,0)),0.83)belongs_to profile_VIR005_1, true, 100330,shielded). 

clause_impress( the_Segment(profile_VIR005_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(310),fl(310))),time(12,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(310),fl(310))),time(13,43,0)),0.83)belongs_to profile_VIR005_1, true, 100331,shielded). 

clause_impress( the_Segment(profile_VIR005_1,fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(310),fl(310))),time(13,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(50)),fl_range(fl(310),fl(310))),time(14,47,0)),0.83)belongs_to profile_VIR005_1, true, 100332,shielded). 

clause_impress( the_Aircraft_on_profile(profile_BAW9668_1,baw9668), true, 100333,shielded). 

clause_impress( the_Type_of(baw9668,dc10), true, 100334,shielded). 

clause_impress( meets_mnps(baw9668), true, 100335,shielded). 

clause_impress( the_Segment(profile_BAW9668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(310),fl(310))),time(11,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(11,42,0)),0.82)belongs_to profile_BAW9668_1, true, 100336,shielded). 

clause_impress( the_Segment(profile_BAW9668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(11,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(12,31,0)),0.82)belongs_to profile_BAW9668_1, true, 100337,shielded). 

clause_impress( the_Segment(profile_BAW9668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(12,31,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,18,0)),0.82)belongs_to profile_BAW9668_1, true, 100338,shielded). 

clause_impress( the_Segment(profile_BAW9668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(310),fl(310))),time(14,3,0)),0.82)belongs_to profile_BAW9668_1, true, 100339,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AIH067_1,aih067), true, 100340,shielded). 

clause_impress( the_Type_of(aih067,b767), true, 100341,shielded). 

clause_impress( meets_mnps(aih067), true, 100342,shielded). 

clause_impress( the_Segment(profile_AIH067_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(340),fl(340))),time(11,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(11,43,0)),0.8)belongs_to profile_AIH067_1, true, 100343,shielded). 

clause_impress( the_Segment(profile_AIH067_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(11,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(12,34,0)),0.8)belongs_to profile_AIH067_1, true, 100344,shielded). 

clause_impress( the_Segment(profile_AIH067_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(12,34,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(13,22,0)),0.8)belongs_to profile_AIH067_1, true, 100345,shielded). 

clause_impress( the_Segment(profile_AIH067_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(13,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(340),fl(340))),time(14,8,0)),0.8)belongs_to profile_AIH067_1, true, 100346,shielded). 

clause_impress( the_Aircraft_on_profile(profile_NWA39_1,nwa39), true, 100347,shielded). 

clause_impress( the_Type_of(nwa39,dc10), true, 100348,shielded). 

clause_impress( meets_mnps(nwa39), true, 100349,shielded). 

clause_impress( the_Segment(profile_NWA39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(330),fl(330))),time(11,23,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(11,48,0)),0.83)belongs_to profile_NWA39_1, true, 100350,shielded). 

clause_impress( the_Segment(profile_NWA39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(11,48,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,36,0)),0.83)belongs_to profile_NWA39_1, true, 100351,shielded). 

clause_impress( the_Segment(profile_NWA39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,36,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(13,22,0)),0.83)belongs_to profile_NWA39_1, true, 100352,shielded). 

clause_impress( the_Segment(profile_NWA39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(13,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(330),fl(330))),time(14,7,0)),0.83)belongs_to profile_NWA39_1, true, 100353,shielded). 

clause_impress( the_Aircraft_on_profile(profile_KLM611_1,klm611), true, 100354,shielded). 

clause_impress( the_Type_of(klm611,b747), true, 100355,shielded). 

clause_impress( meets_mnps(klm611), true, 100356,shielded). 

clause_impress( the_Segment(profile_KLM611_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(10)),fl_range(fl(330),fl(330))),time(11,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(330),fl(330))),time(11,55,0)),0.85)belongs_to profile_KLM611_1, true, 100357,shielded). 

clause_impress( the_Segment(profile_KLM611_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(330),fl(330))),time(11,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(330),fl(330))),time(12,39,0)),0.85)belongs_to profile_KLM611_1, true, 100358,shielded). 

clause_impress( the_Segment(profile_KLM611_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(330),fl(330))),time(12,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(330),fl(330))),time(13,19,0)),0.85)belongs_to profile_KLM611_1, true, 100359,shielded). 

clause_impress( the_Segment(profile_KLM611_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(330),fl(330))),time(13,19,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(50)),fl_range(fl(330),fl(330))),time(13,59,0)),0.85)belongs_to profile_KLM611_1, true, 100360,shielded). 

clause_impress( the_Aircraft_on_profile(profile_COA37_1,coa37), true, 100361,shielded). 

clause_impress( the_Type_of(coa37,dc10), true, 100362,shielded). 

clause_impress( meets_mnps(coa37), true, 100363,shielded). 

clause_impress( the_Segment(profile_COA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(310),fl(310))),time(11,31,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,54,0)),0.84)belongs_to profile_COA37_1, true, 100364,shielded). 

clause_impress( the_Segment(profile_COA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,54,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(12,39,0)),0.84)belongs_to profile_COA37_1, true, 100365,shielded). 

clause_impress( the_Segment(profile_COA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(12,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(13,24,0)),0.84)belongs_to profile_COA37_1, true, 100366,shielded). 

clause_impress( the_Segment(profile_COA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(13,24,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(310),fl(310))),time(14,7,0)),0.84)belongs_to profile_COA37_1, true, 100367,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DAL43_1,dal43), true, 100368,shielded). 

clause_impress( the_Type_of(dal43,b767), true, 100369,shielded). 

clause_impress( meets_mnps(dal43), true, 100370,shielded). 

clause_impress( the_Segment(profile_DAL43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(360),fl(360))),time(11,27,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(360),fl(360))),time(11,52,0)),0.81)belongs_to profile_DAL43_1, true, 100371,shielded). 

clause_impress( the_Segment(profile_DAL43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(360),fl(360))),time(11,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(360),fl(360))),time(12,44,0)),0.81)belongs_to profile_DAL43_1, true, 100372,shielded). 

clause_impress( the_Segment(profile_DAL43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(360),fl(360))),time(12,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(360),fl(360))),time(13,33,0)),0.81)belongs_to profile_DAL43_1, true, 100373,shielded). 

clause_impress( the_Segment(profile_DAL43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(360),fl(360))),time(13,33,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(360),fl(360))),time(14,22,0)),0.81)belongs_to profile_DAL43_1, true, 100374,shielded). 

clause_impress( the_Aircraft_on_profile(profile_NWA37_1,nwa37), true, 100375,shielded). 

clause_impress( the_Type_of(nwa37,dc10), true, 100376,shielded). 

clause_impress( meets_mnps(nwa37), true, 100377,shielded). 

clause_impress( the_Segment(profile_NWA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(330),fl(330))),time(11,33,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,56,0)),0.83)belongs_to profile_NWA37_1, true, 100378,shielded). 

clause_impress( the_Segment(profile_NWA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,56,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(12,44,0)),0.83)belongs_to profile_NWA37_1, true, 100379,shielded). 

clause_impress( the_Segment(profile_NWA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(12,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(13,29,0)),0.83)belongs_to profile_NWA37_1, true, 100380,shielded). 

clause_impress( the_Segment(profile_NWA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(13,29,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(330),fl(330))),time(14,13,0)),0.83)belongs_to profile_NWA37_1, true, 100381,shielded). 

clause_impress( the_Aircraft_on_profile(profile_USA27_1,usa27), true, 100382,shielded). 

clause_impress( the_Type_of(usa27,b767), true, 100383,shielded). 

clause_impress( meets_mnps(usa27), true, 100384,shielded). 

clause_impress( the_Segment(profile_USA27_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(350),fl(350))),time(11,30,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(350),fl(350))),time(11,55,0)),0.8)belongs_to profile_USA27_1, true, 100385,shielded). 

clause_impress( the_Segment(profile_USA27_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(350),fl(350))),time(11,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(350),fl(350))),time(12,47,0)),0.8)belongs_to profile_USA27_1, true, 100386,shielded). 

clause_impress( the_Segment(profile_USA27_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(350),fl(350))),time(12,47,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(350),fl(350))),time(13,38,0)),0.8)belongs_to profile_USA27_1, true, 100387,shielded). 

clause_impress( the_Segment(profile_USA27_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(350),fl(350))),time(13,38,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(350),fl(350))),time(14,28,0)),0.8)belongs_to profile_USA27_1, true, 100388,shielded). 

clause_impress( the_Aircraft_on_profile(profile_TWA843_1,twa843), true, 100389,shielded). 

clause_impress( the_Type_of(twa843,b767), true, 100390,shielded). 

clause_impress( meets_mnps(twa843), true, 100391,shielded). 

clause_impress( the_Segment(profile_TWA843_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47,0),long_W(8,45)),fl_range(fl(350),fl(350))),time(10,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(350),fl(350))),time(11,24,0)),0.8)belongs_to profile_TWA843_1, true, 100392,shielded). 

clause_impress( the_Segment(profile_TWA843_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(350),fl(350))),time(11,24,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(50),long_W(20)),fl_range(fl(360),fl(360))),time(11,52,0)),0.8)belongs_to profile_TWA843_1, true, 100393,shielded). 

clause_impress( the_Segment(profile_TWA843_1,fourD_pt(threeD_pt(twoD_pt(lat_N(50),long_W(20)),fl_range(fl(360),fl(360))),time(11,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(360),fl(360))),time(12,47,0)),0.8)belongs_to profile_TWA843_1, true, 100394,shielded). 

clause_impress( the_Segment(profile_TWA843_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(360),fl(360))),time(12,47,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(360),fl(360))),time(13,43,0)),0.8)belongs_to profile_TWA843_1, true, 100395,shielded). 

clause_impress( the_Segment(profile_TWA843_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(360),fl(360))),time(13,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(50)),fl_range(fl(360),fl(360))),time(14,38,0)),0.8)belongs_to profile_TWA843_1, true, 100396,shielded). 

clause_impress( the_Aircraft_on_profile(profile_TOW37_1,tow37), true, 100397,shielded). 

clause_impress( the_Type_of(tow37,b747), true, 100398,shielded). 

clause_impress( meets_mnps(tow37), true, 100399,shielded). 

clause_impress( the_Segment(profile_TOW37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(340),fl(340))),time(11,36,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(340),fl(340))),time(12,0,0)),0.84)belongs_to profile_TOW37_1, true, 100400,shielded). 

clause_impress( the_Segment(profile_TOW37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(340),fl(340))),time(12,0,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(340),fl(340))),time(12,49,0)),0.84)belongs_to profile_TOW37_1, true, 100401,shielded). 

clause_impress( the_Segment(profile_TOW37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(340),fl(340))),time(12,49,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(340),fl(340))),time(13,37,0)),0.84)belongs_to profile_TOW37_1, true, 100402,shielded). 

clause_impress( the_Segment(profile_TOW37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(340),fl(340))),time(13,37,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(340),fl(340))),time(14,25,0)),0.84)belongs_to profile_TOW37_1, true, 100403,shielded). 

clause_impress( the_Aircraft_on_profile(profile_SAB539_1,sab539), true, 100404,shielded). 

clause_impress( the_Type_of(sab539,ea34), true, 100405,shielded). 

clause_impress( meets_mnps(sab539), true, 100406,shielded). 

clause_impress( the_Segment(profile_SAB539_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(10)),fl_range(fl(350),fl(350))),time(11,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(350),fl(350))),time(12,6,0)),0.82)belongs_to profile_SAB539_1, true, 100407,shielded). 

clause_impress( the_Segment(profile_SAB539_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(350),fl(350))),time(12,6,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(350),fl(350))),time(12,51,0)),0.82)belongs_to profile_SAB539_1, true, 100408,shielded). 

clause_impress( the_Segment(profile_SAB539_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(350),fl(350))),time(12,51,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(350),fl(350))),time(13,33,0)),0.82)belongs_to profile_SAB539_1, true, 100409,shielded). 

clause_impress( the_Segment(profile_SAB539_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(350),fl(350))),time(13,33,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(50)),fl_range(fl(350),fl(350))),time(14,13,0)),0.82)belongs_to profile_SAB539_1, true, 100410,shielded). 

clause_impress( the_Aircraft_on_profile(profile_UAL929_1,ual929), true, 100411,shielded). 

clause_impress( the_Type_of(ual929,b777), true, 100412,shielded). 

clause_impress( meets_mnps(ual929), true, 100413,shielded). 

clause_impress( the_Segment(profile_UAL929_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(370),fl(370))),time(11,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(370),fl(370))),time(12,5,0)),0.84)belongs_to profile_UAL929_1, true, 100414,shielded). 

clause_impress( the_Segment(profile_UAL929_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(370),fl(370))),time(12,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(370),fl(370))),time(12,51,0)),0.84)belongs_to profile_UAL929_1, true, 100415,shielded). 

clause_impress( the_Segment(profile_UAL929_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(370),fl(370))),time(12,51,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(370),fl(370))),time(13,32,0)),0.84)belongs_to profile_UAL929_1, true, 100416,shielded). 

clause_impress( the_Segment(profile_UAL929_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(370),fl(370))),time(13,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(370),fl(370))),time(14,13,0)),0.84)belongs_to profile_UAL929_1, true, 100417,shielded). 

clause_impress( the_Aircraft_on_profile(profile_MPH601_1,mph601), true, 100418,shielded). 

clause_impress( the_Type_of(mph601,b767), true, 100419,shielded). 

clause_impress( meets_mnps(mph601), true, 100420,shielded). 

clause_impress( the_Segment(profile_MPH601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48,47),long_W(12,0)),fl_range(fl(340),fl(340))),time(11,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(340),fl(340))),time(12,1,0)),0.8)belongs_to profile_MPH601_1, true, 100421,shielded). 

clause_impress( the_Segment(profile_MPH601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(340),fl(340))),time(12,1,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(340),fl(340))),time(12,26,0)),0.8)belongs_to profile_MPH601_1, true, 100422,shielded). 

clause_impress( the_Segment(profile_MPH601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(340),fl(340))),time(12,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45,0),long_W(24,25)),fl_range(fl(340),fl(340))),time(12,52,0)),0.8)belongs_to profile_MPH601_1, true, 100423,shielded). 

clause_impress( the_Segment(profile_MPH601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45,0),long_W(24,25)),fl_range(fl(340),fl(340))),time(12,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(340),fl(340))),time(13,28,0)),0.8)belongs_to profile_MPH601_1, true, 100424,shielded). 

clause_impress( the_Aircraft_on_profile(profile_ACA881_1,aca881), true, 100425,shielded). 

clause_impress( the_Type_of(aca881,b74f), true, 100426,shielded). 

clause_impress( meets_mnps(aca881), true, 100427,shielded). 

clause_impress( the_Segment(profile_ACA881_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(350),fl(350))),time(11,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(12,5,0)),0.86)belongs_to profile_ACA881_1, true, 100428,shielded). 

clause_impress( the_Segment(profile_ACA881_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(12,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(12,52,0)),0.86)belongs_to profile_ACA881_1, true, 100429,shielded). 

clause_impress( the_Segment(profile_ACA881_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(12,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(13,36,0)),0.86)belongs_to profile_ACA881_1, true, 100430,shielded). 

clause_impress( the_Segment(profile_ACA881_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(13,36,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(350),fl(350))),time(14,19,0)),0.86)belongs_to profile_ACA881_1, true, 100431,shielded). 

clause_impress( the_Aircraft_on_profile(profile_ULE849_1,ule849), true, 100432,shielded). 

clause_impress( the_Type_of(ule849,b767), true, 100433,shielded). 

clause_impress( meets_mnps(ule849), true, 100434,shielded). 

clause_impress( the_Segment(profile_ULE849_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(340),fl(340))),time(11,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(340),fl(340))),time(12,4,0)),0.8)belongs_to profile_ULE849_1, true, 100435,shielded). 

clause_impress( the_Segment(profile_ULE849_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(340),fl(340))),time(12,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(340),fl(340))),time(12,54,0)),0.8)belongs_to profile_ULE849_1, true, 100436,shielded). 

clause_impress( the_Segment(profile_ULE849_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(340),fl(340))),time(12,54,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(340),fl(340))),time(13,40,0)),0.8)belongs_to profile_ULE849_1, true, 100437,shielded). 

clause_impress( the_Segment(profile_ULE849_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(340),fl(340))),time(13,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(340),fl(340))),time(14,26,0)),0.8)belongs_to profile_ULE849_1, true, 100438,shielded). 

clause_impress( the_Aircraft_on_profile(profile_BAW2257_1,baw2257), true, 100439,shielded). 

clause_impress( the_Type_of(baw2257,b747), true, 100440,shielded). 

clause_impress( meets_mnps(baw2257), true, 100441,shielded). 

clause_impress( the_Segment(profile_BAW2257_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48,47),long_W(12,0)),fl_range(fl(290),fl(290))),time(11,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(290),fl(290))),time(12,8,0)),0.84)belongs_to profile_BAW2257_1, true, 100442,shielded). 

clause_impress( the_Segment(profile_BAW2257_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(290),fl(290))),time(12,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(290),fl(290))),time(12,32,0)),0.84)belongs_to profile_BAW2257_1, true, 100443,shielded). 

clause_impress( the_Segment(profile_BAW2257_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(290),fl(290))),time(12,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(24)),fl_range(fl(290),fl(290))),time(12,55,0)),0.84)belongs_to profile_BAW2257_1, true, 100444,shielded). 

clause_impress( the_Segment(profile_BAW2257_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(24)),fl_range(fl(290),fl(290))),time(12,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(290),fl(290))),time(13,31,0)),0.84)belongs_to profile_BAW2257_1, true, 100445,shielded). 

clause_impress( the_Aircraft_on_profile(profile_COA25_1,coa25), true, 100446,shielded). 

clause_impress( the_Type_of(coa25,dc10), true, 100447,shielded). 

clause_impress( meets_mnps(coa25), true, 100448,shielded). 

clause_impress( the_Segment(profile_COA25_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(310),fl(310))),time(11,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(12,9,0)),0.83)belongs_to profile_COA25_1, true, 100449,shielded). 

clause_impress( the_Segment(profile_COA25_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(12,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(12,57,0)),0.83)belongs_to profile_COA25_1, true, 100450,shielded). 

clause_impress( the_Segment(profile_COA25_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(12,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,43,0)),0.83)belongs_to profile_COA25_1, true, 100451,shielded). 

clause_impress( the_Segment(profile_COA25_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(310),fl(310))),time(14,28,0)),0.83)belongs_to profile_COA25_1, true, 100452,shielded). 

clause_impress( the_Aircraft_on_profile(profile_BBC009_1,bbc009), true, 100453,shielded). 

clause_impress( the_Type_of(bbc009,dc10), true, 100454,shielded). 

clause_impress( the_Segment(profile_BBC009_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(330),fl(330))),time(11,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(12,9,0)),0.83)belongs_to profile_BBC009_1, true, 100455,shielded). 

clause_impress( the_Segment(profile_BBC009_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(12,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,58,0)),0.83)belongs_to profile_BBC009_1, true, 100456,shielded). 

clause_impress( the_Segment(profile_BBC009_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,58,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(13,44,0)),0.83)belongs_to profile_BBC009_1, true, 100457,shielded). 

clause_impress( the_Segment(profile_BBC009_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(13,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(330),fl(330))),time(14,29,0)),0.83)belongs_to profile_BBC009_1, true, 100458,shielded). 

clause_impress( the_Aircraft_on_profile(profile_UAL953_1,ual953), true, 100459,shielded). 

clause_impress( the_Type_of(ual953,b767), true, 100460,shielded). 

clause_impress( meets_mnps(ual953), true, 100461,shielded). 

clause_impress( the_Segment(profile_UAL953_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(10)),fl_range(fl(360),fl(360))),time(11,20,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(360),fl(360))),time(12,11,0)),0.8)belongs_to profile_UAL953_1, true, 100462,shielded). 

clause_impress( the_Segment(profile_UAL953_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(360),fl(360))),time(12,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(360),fl(360))),time(12,58,0)),0.8)belongs_to profile_UAL953_1, true, 100463,shielded). 

clause_impress( the_Segment(profile_UAL953_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(360),fl(360))),time(12,58,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(360),fl(360))),time(13,40,0)),0.8)belongs_to profile_UAL953_1, true, 100464,shielded). 

clause_impress( the_Segment(profile_UAL953_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(360),fl(360))),time(13,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(50)),fl_range(fl(360),fl(360))),time(14,22,0)),0.8)belongs_to profile_UAL953_1, true, 100465,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AAL173_1,aal173), true, 100466,shielded). 

clause_impress( the_Type_of(aal173,b767), true, 100467,shielded). 

clause_impress( meets_mnps(aal173), true, 100468,shielded). 

clause_impress( the_Segment(profile_AAL173_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(350),fl(350))),time(11,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(350),fl(350))),time(12,7,0)),0.8)belongs_to profile_AAL173_1, true, 100469,shielded). 

clause_impress( the_Segment(profile_AAL173_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(350),fl(350))),time(12,7,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(350),fl(350))),time(12,59,0)),0.8)belongs_to profile_AAL173_1, true, 100470,shielded). 

clause_impress( the_Segment(profile_AAL173_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(350),fl(350))),time(12,59,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(350),fl(350))),time(13,50,0)),0.8)belongs_to profile_AAL173_1, true, 100471,shielded). 

clause_impress( the_Segment(profile_AAL173_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(350),fl(350))),time(13,50,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(350),fl(350))),time(14,40,0)),0.8)belongs_to profile_AAL173_1, true, 100472,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DAL15_1,dal15), true, 100473,shielded). 

clause_impress( the_Type_of(dal15,md11), true, 100474,shielded). 

clause_impress( meets_mnps(dal15), true, 100475,shielded). 

clause_impress( the_Segment(profile_DAL15_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(330),fl(330))),time(11,34,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(12,13,0)),0.83)belongs_to profile_DAL15_1, true, 100476,shielded). 

clause_impress( the_Segment(profile_DAL15_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(12,13,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(12,59,0)),0.83)belongs_to profile_DAL15_1, true, 100477,shielded). 

clause_impress( the_Segment(profile_DAL15_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(12,59,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(13,42,0)),0.83)belongs_to profile_DAL15_1, true, 100478,shielded). 

clause_impress( the_Segment(profile_DAL15_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(13,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(330),fl(330))),time(14,23,0)),0.83)belongs_to profile_DAL15_1, true, 100479,shielded). 

clause_impress( the_Aircraft_on_profile(profile_ACA871_1,aca871), true, 100480,shielded). 

clause_impress( the_Type_of(aca871,b747), true, 100481,shielded). 

clause_impress( meets_mnps(aca871), true, 100482,shielded). 

clause_impress( the_Segment(profile_ACA871_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(340),fl(340))),time(11,47,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(12,11,0)),0.84)belongs_to profile_ACA871_1, true, 100483,shielded). 

clause_impress( the_Segment(profile_ACA871_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(12,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(12,59,0)),0.84)belongs_to profile_ACA871_1, true, 100484,shielded). 

clause_impress( the_Segment(profile_ACA871_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(12,59,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(13,44,0)),0.84)belongs_to profile_ACA871_1, true, 100485,shielded). 

clause_impress( the_Segment(profile_ACA871_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(13,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(340),fl(340))),time(14,29,0)),0.84)belongs_to profile_ACA871_1, true, 100486,shielded). 

clause_impress( the_Aircraft_on_profile(profile_USA11_1,usa11), true, 100487,shielded). 

clause_impress( the_Type_of(usa11,b767), true, 100488,shielded). 

clause_impress( meets_mnps(usa11), true, 100489,shielded). 

clause_impress( the_Segment(profile_USA11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44,30),long_W(13,0)),fl_range(fl(370),fl(370))),time(11,29,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(20)),fl_range(fl(370),fl(370))),time(12,6,0)),0.8)belongs_to profile_USA11_1, true, 100490,shielded). 

clause_impress( the_Segment(profile_USA11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(20)),fl_range(fl(370),fl(370))),time(12,6,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(30)),fl_range(fl(370),fl(370))),time(13,0,0)),0.8)belongs_to profile_USA11_1, true, 100491,shielded). 

clause_impress( the_Segment(profile_USA11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(30)),fl_range(fl(370),fl(370))),time(13,0,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(40)),fl_range(fl(370),fl(370))),time(14,3,0)),0.8)belongs_to profile_USA11_1, true, 100492,shielded). 

clause_impress( the_Segment(profile_USA11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(40)),fl_range(fl(370),fl(370))),time(14,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(50)),fl_range(fl(370),fl(370))),time(15,10,0)),0.8)belongs_to profile_USA11_1, true, 100493,shielded). 

clause_impress( the_Aircraft_on_profile(profile_CDN45_1,cdn45), true, 100494,shielded). 

clause_impress( the_Type_of(cdn45,b767), true, 100495,shielded). 

clause_impress( meets_mnps(cdn45), true, 100496,shielded). 

clause_impress( the_Segment(profile_CDN45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(340),fl(340))),time(11,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(340),fl(340))),time(12,10,0)),0.8)belongs_to profile_CDN45_1, true, 100497,shielded). 

clause_impress( the_Segment(profile_CDN45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(340),fl(340))),time(12,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(340),fl(340))),time(13,2,0)),0.8)belongs_to profile_CDN45_1, true, 100498,shielded). 

clause_impress( the_Segment(profile_CDN45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(340),fl(340))),time(13,2,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(340),fl(340))),time(13,53,0)),0.8)belongs_to profile_CDN45_1, true, 100499,shielded). 

clause_impress( the_Segment(profile_CDN45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(340),fl(340))),time(13,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(340),fl(340))),time(14,43,0)),0.8)belongs_to profile_CDN45_1, true, 100500,shielded). 

clause_impress( the_Aircraft_on_profile(profile_CFG144_1,cfg144), true, 100501,shielded). 

clause_impress( the_Type_of(cfg144,b767), true, 100502,shielded). 

clause_impress( meets_mnps(cfg144), true, 100503,shielded). 

clause_impress( the_Segment(profile_CFG144_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47,0),long_W(8,45)),fl_range(fl(330),fl(330))),time(11,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(330),fl(330))),time(12,42,0)),0.8)belongs_to profile_CFG144_1, true, 100504,shielded). 

clause_impress( the_Segment(profile_CFG144_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(330),fl(330))),time(12,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(41),long_W(30)),fl_range(fl(330),fl(330))),time(13,42,0)),0.8)belongs_to profile_CFG144_1, true, 100505,shielded). 

clause_impress( the_Segment(profile_CFG144_1,fourD_pt(threeD_pt(twoD_pt(lat_N(41),long_W(30)),fl_range(fl(330),fl(330))),time(13,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(37),long_W(40)),fl_range(fl(330),fl(330))),time(14,45,0)),0.8)belongs_to profile_CFG144_1, true, 100506,shielded). 

clause_impress( the_Aircraft_on_profile(profile_NWA43_1,nwa43), true, 100507,shielded). 

clause_impress( the_Type_of(nwa43,dc10), true, 100508,shielded). 

clause_impress( meets_mnps(nwa43), true, 100509,shielded). 

clause_impress( the_Segment(profile_NWA43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(10)),fl_range(fl(310),fl(310))),time(11,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(330),fl(330))),time(12,19,0)),0.83)belongs_to profile_NWA43_1, true, 100510,shielded). 

clause_impress( the_Segment(profile_NWA43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(330),fl(330))),time(12,19,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(330),fl(330))),time(13,3,0)),0.83)belongs_to profile_NWA43_1, true, 100511,shielded). 

clause_impress( the_Segment(profile_NWA43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(330),fl(330))),time(13,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(330),fl(330))),time(13,44,0)),0.83)belongs_to profile_NWA43_1, true, 100512,shielded). 

clause_impress( the_Segment(profile_NWA43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(330),fl(330))),time(13,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(50)),fl_range(fl(330),fl(330))),time(14,25,0)),0.83)belongs_to profile_NWA43_1, true, 100513,shielded). 

clause_impress( the_Aircraft_on_profile(profile_XBSOL_1,xbsol), true, 100514,shielded). 

clause_impress( the_Type_of(xbsol,da50), true, 100515,shielded). 

clause_impress( meets_mnps(xbsol), true, 100516,shielded). 

clause_impress( the_Segment(profile_XBSOL_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(40)),fl_range(fl(390),fl(390))),time(11,51,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(30)),fl_range(fl(390),fl(390))),time(12,40,0)),0.78)belongs_to profile_XBSOL_1, true, 100517,shielded). 

clause_impress( the_Segment(profile_XBSOL_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(30)),fl_range(fl(390),fl(390))),time(12,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(43),long_W(20)),fl_range(fl(390),fl(390))),time(13,43,0)),0.78)belongs_to profile_XBSOL_1, true, 100518,shielded). 

clause_impress( the_Aircraft_on_profile(profile_OEIMI_1,oeimi), true, 100519,shielded). 

clause_impress( the_Type_of(oeimi,da90), true, 100520,shielded). 

clause_impress( meets_mnps(oeimi), true, 100521,shielded). 

clause_impress( the_Segment(profile_OEIMI_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(390),fl(390))),time(11,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(390),fl(390))),time(12,11,0)),0.8)belongs_to profile_OEIMI_1, true, 100522,shielded). 

clause_impress( the_Segment(profile_OEIMI_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(390),fl(390))),time(12,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(390),fl(390))),time(13,3,0)),0.8)belongs_to profile_OEIMI_1, true, 100523,shielded). 

clause_impress( the_Segment(profile_OEIMI_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(390),fl(390))),time(13,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(390),fl(390))),time(13,49,0)),0.8)belongs_to profile_OEIMI_1, true, 100524,shielded). 

clause_impress( the_Segment(profile_OEIMI_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(390),fl(390))),time(13,49,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(390),fl(390))),time(14,35,0)),0.8)belongs_to profile_OEIMI_1, true, 100525,shielded). 

clause_impress( the_Aircraft_on_profile(profile_BAW115_1,baw115), true, 100526,shielded). 

clause_impress( the_Type_of(baw115,b777), true, 100527,shielded). 

clause_impress( meets_mnps(baw115), true, 100528,shielded). 

clause_impress( the_Segment(profile_BAW115_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(370),fl(370))),time(11,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(370),fl(370))),time(12,17,0)),0.84)belongs_to profile_BAW115_1, true, 100529,shielded). 

clause_impress( the_Segment(profile_BAW115_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(370),fl(370))),time(12,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(370),fl(370))),time(13,4,0)),0.84)belongs_to profile_BAW115_1, true, 100530,shielded). 

clause_impress( the_Segment(profile_BAW115_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(370),fl(370))),time(13,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(370),fl(370))),time(13,47,0)),0.84)belongs_to profile_BAW115_1, true, 100531,shielded). 

clause_impress( the_Segment(profile_BAW115_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(370),fl(370))),time(13,47,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(370),fl(370))),time(14,30,0)),0.84)belongs_to profile_BAW115_1, true, 100532,shielded). 

clause_impress( the_Aircraft_on_profile(profile_UAL943_1,ual943), true, 100533,shielded). 

clause_impress( the_Type_of(ual943,b777), true, 100534,shielded). 

clause_impress( meets_mnps(ual943), true, 100535,shielded). 

clause_impress( the_Segment(profile_UAL943_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(360),fl(360))),time(11,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(12,17,0)),0.84)belongs_to profile_UAL943_1, true, 100536,shielded). 

clause_impress( the_Segment(profile_UAL943_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(12,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(13,5,0)),0.84)belongs_to profile_UAL943_1, true, 100537,shielded). 

clause_impress( the_Segment(profile_UAL943_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(13,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(13,50,0)),0.84)belongs_to profile_UAL943_1, true, 100538,shielded). 

clause_impress( the_Segment(profile_UAL943_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(13,50,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(360),fl(360))),time(14,34,0)),0.84)belongs_to profile_UAL943_1, true, 100539,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AIH063_1,aih063), true, 100540,shielded). 

clause_impress( the_Type_of(aih063,b767), true, 100541,shielded). 

clause_impress( meets_mnps(aih063), true, 100542,shielded). 

clause_impress( the_Segment(profile_AIH063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(350),fl(350))),time(11,54,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(350),fl(350))),time(12,18,0)),0.8)belongs_to profile_AIH063_1, true, 100543,shielded). 

clause_impress( the_Segment(profile_AIH063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(350),fl(350))),time(12,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(350),fl(350))),time(13,8,0)),0.8)belongs_to profile_AIH063_1, true, 100544,shielded). 

clause_impress( the_Segment(profile_AIH063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(350),fl(350))),time(13,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(350),fl(350))),time(13,54,0)),0.8)belongs_to profile_AIH063_1, true, 100545,shielded). 

clause_impress( the_Segment(profile_AIH063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(350),fl(350))),time(13,54,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(350),fl(350))),time(14,39,0)),0.8)belongs_to profile_AIH063_1, true, 100546,shielded). 

clause_impress( the_Aircraft_on_profile(profile_FDX6_1,fdx6), true, 100547,shielded). 

clause_impress( the_Type_of(fdx6,md11), true, 100548,shielded). 

clause_impress( meets_mnps(fdx6), true, 100549,shielded). 

clause_impress( the_Segment(profile_FDX6_1,fourD_pt(threeD_pt(twoD_pt(lat_N(51),long_W(40)),fl_range(fl(290),fl(290))),time(11,31,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(30)),fl_range(fl(290),fl(290))),time(12,14,0)),0.83)belongs_to profile_FDX6_1, true, 100550,shielded). 

clause_impress( the_Segment(profile_FDX6_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(30)),fl_range(fl(290),fl(290))),time(12,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(290),fl(290))),time(12,53,0)),0.83)belongs_to profile_FDX6_1, true, 100551,shielded). 

clause_impress( the_Segment(profile_FDX6_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(290),fl(290))),time(12,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(10)),fl_range(fl(290),fl(290))),time(13,31,0)),0.83)belongs_to profile_FDX6_1, true, 100552,shielded). 

clause_impress( the_Aircraft_on_profile(profile_RATS69_1,rats69), true, 100553,shielded). 

clause_impress( the_Type_of(rats69,c135), true, 100554,shielded). 

clause_impress( meets_mnps(rats69), true, 100555,shielded). 

clause_impress( the_Segment(profile_RATS69_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(390),fl(390))),time(11,56,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(390),fl(390))),time(12,22,0)),0.8)belongs_to profile_RATS69_1, true, 100556,shielded). 

clause_impress( the_Segment(profile_RATS69_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(390),fl(390))),time(12,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(390),fl(390))),time(13,11,0)),0.8)belongs_to profile_RATS69_1, true, 100557,shielded). 

clause_impress( the_Segment(profile_RATS69_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(390),fl(390))),time(13,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(390),fl(390))),time(13,57,0)),0.8)belongs_to profile_RATS69_1, true, 100558,shielded). 

clause_impress( the_Segment(profile_RATS69_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(390),fl(390))),time(13,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(390),fl(390))),time(14,42,0)),0.8)belongs_to profile_RATS69_1, true, 100559,shielded). 

clause_impress( the_Aircraft_on_profile(profile_RRR2668_1,rrr2668), true, 100560,shielded). 

clause_impress( the_Type_of(rrr2668,vc10), true, 100561,shielded). 

clause_impress( meets_mnps(rrr2668), true, 100562,shielded). 

clause_impress( the_Segment(profile_RRR2668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(280),fl(280))),time(11,54,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(20)),fl_range(fl(280),fl(280))),time(12,19,0)),0.75)belongs_to profile_RRR2668_1, true, 100563,shielded). 

clause_impress( the_Segment(profile_RRR2668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(20)),fl_range(fl(280),fl(280))),time(12,19,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(30)),fl_range(fl(280),fl(280))),time(13,13,0)),0.75)belongs_to profile_RRR2668_1, true, 100564,shielded). 

clause_impress( the_Segment(profile_RRR2668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(30)),fl_range(fl(280),fl(280))),time(13,13,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(280),fl(280))),time(14,11,0)),0.75)belongs_to profile_RRR2668_1, true, 100565,shielded). 

clause_impress( the_Segment(profile_RRR2668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(280),fl(280))),time(14,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(51),long_W(50)),fl_range(fl(280),fl(280))),time(15,15,0)),0.75)belongs_to profile_RRR2668_1, true, 100566,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DAL81_1,dal81), true, 100567,shielded). 

clause_impress( the_Type_of(dal81,l101), true, 100568,shielded). 

clause_impress( meets_mnps(dal81), true, 100569,shielded). 

clause_impress( the_Segment(profile_DAL81_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(310),fl(310))),time(11,59,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(12,24,0)),0.83)belongs_to profile_DAL81_1, true, 100570,shielded). 

clause_impress( the_Segment(profile_DAL81_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(12,24,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(13,13,0)),0.83)belongs_to profile_DAL81_1, true, 100571,shielded). 

clause_impress( the_Segment(profile_DAL81_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(13,13,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,59,0)),0.83)belongs_to profile_DAL81_1, true, 100572,shielded). 

clause_impress( the_Segment(profile_DAL81_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,59,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(310),fl(310))),time(14,44,0)),0.83)belongs_to profile_DAL81_1, true, 100573,shielded). 

clause_impress( the_Aircraft_on_profile(profile_VIR024_1,vir024), true, 100574,shielded). 

clause_impress( the_Type_of(vir024,ea34), true, 100575,shielded). 

clause_impress( meets_mnps(vir024), true, 100576,shielded). 

clause_impress( the_Segment(profile_VIR024_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(30)),fl_range(fl(370),fl(370))),time(12,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(20)),fl_range(fl(370),fl(370))),time(12,48,0)),0.82)belongs_to profile_VIR024_1, true, 100577,shielded). 

clause_impress( the_Segment(profile_VIR024_1,fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(20)),fl_range(fl(370),fl(370))),time(12,48,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(10)),fl_range(fl(370),fl(370))),time(13,33,0)),0.82)belongs_to profile_VIR024_1, true, 100578,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DAL33_1,dal33), true, 100579,shielded). 

clause_impress( the_Type_of(dal33,b767), true, 100580,shielded). 

clause_impress( meets_mnps(dal33), true, 100581,shielded). 

clause_impress( the_Segment(profile_DAL33_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(310),fl(310))),time(12,1,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(12,26,0)),0.81)belongs_to profile_DAL33_1, true, 100582,shielded). 

clause_impress( the_Segment(profile_DAL33_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(12,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(13,14,0)),0.81)belongs_to profile_DAL33_1, true, 100583,shielded). 

clause_impress( the_Segment(profile_DAL33_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(13,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(14,1,0)),0.81)belongs_to profile_DAL33_1, true, 100584,shielded). 

clause_impress( the_Segment(profile_DAL33_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(14,1,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(310),fl(310))),time(14,46,0)),0.81)belongs_to profile_DAL33_1, true, 100585,shielded). 

clause_impress( the_Aircraft_on_profile(profile_GAF411_1,gaf411), true, 100586,shielded). 

clause_impress( the_Type_of(gaf411,cl60), true, 100587,shielded). 

clause_impress( meets_mnps(gaf411), true, 100588,shielded). 

clause_impress( the_Segment(profile_GAF411_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(390),fl(390))),time(11,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(390),fl(390))),time(12,19,0)),0.74)belongs_to profile_GAF411_1, true, 100589,shielded). 

clause_impress( the_Segment(profile_GAF411_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(390),fl(390))),time(12,19,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(390),fl(390))),time(13,15,0)),0.74)belongs_to profile_GAF411_1, true, 100590,shielded). 

clause_impress( the_Segment(profile_GAF411_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(390),fl(390))),time(13,15,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(390),fl(390))),time(14,9,0)),0.74)belongs_to profile_GAF411_1, true, 100591,shielded). 

clause_impress( the_Segment(profile_GAF411_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(390),fl(390))),time(14,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(390),fl(390))),time(15,2,0)),0.74)belongs_to profile_GAF411_1, true, 100592,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AAL45_1,aal45), true, 100593,shielded). 

clause_impress( the_Type_of(aal45,b767), true, 100594,shielded). 

clause_impress( meets_mnps(aal45), true, 100595,shielded). 

clause_impress( the_Segment(profile_AAL45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(350),fl(350))),time(12,0,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(12,25,0)),0.8)belongs_to profile_AAL45_1, true, 100596,shielded). 

clause_impress( the_Segment(profile_AAL45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(12,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(13,16,0)),0.8)belongs_to profile_AAL45_1, true, 100597,shielded). 

clause_impress( the_Segment(profile_AAL45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(13,16,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(14,4,0)),0.8)belongs_to profile_AAL45_1, true, 100598,shielded). 

clause_impress( the_Segment(profile_AAL45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(14,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(350),fl(350))),time(14,50,0)),0.8)belongs_to profile_AAL45_1, true, 100599,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AAL57_1,aal57), true, 100600,shielded). 

clause_impress( the_Type_of(aal57,md11), true, 100601,shielded). 

clause_impress( meets_mnps(aal57), true, 100602,shielded). 

clause_impress( the_Segment(profile_AAL57_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48,47),long_W(12,0)),fl_range(fl(340),fl(340))),time(12,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(340),fl(340))),time(12,21,0)),0.84)belongs_to profile_AAL57_1, true, 100603,shielded). 

clause_impress( the_Segment(profile_AAL57_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(340),fl(340))),time(12,21,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(340),fl(340))),time(12,46,0)),0.84)belongs_to profile_AAL57_1, true, 100604,shielded). 

clause_impress( the_Segment(profile_AAL57_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(340),fl(340))),time(12,46,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(43),long_W(30)),fl_range(fl(340),fl(340))),time(13,43,0)),0.84)belongs_to profile_AAL57_1, true, 100605,shielded). 

clause_impress( the_Segment(profile_AAL57_1,fourD_pt(threeD_pt(twoD_pt(lat_N(43),long_W(30)),fl_range(fl(340),fl(340))),time(13,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(41),long_W(40)),fl_range(fl(340),fl(340))),time(14,39,0)),0.84)belongs_to profile_AAL57_1, true, 100606,shielded). 

clause_impress( the_Aircraft_on_profile(profile_COA49_1,coa49), true, 100607,shielded). 

clause_impress( the_Type_of(coa49,dc10), true, 100608,shielded). 

clause_impress( meets_mnps(coa49), true, 100609,shielded). 

clause_impress( the_Segment(profile_COA49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(310),fl(310))),time(11,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(12,31,0)),0.84)belongs_to profile_COA49_1, true, 100610,shielded). 

clause_impress( the_Segment(profile_COA49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(12,31,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(13,16,0)),0.84)belongs_to profile_COA49_1, true, 100611,shielded). 

clause_impress( the_Segment(profile_COA49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(13,16,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(13,58,0)),0.84)belongs_to profile_COA49_1, true, 100612,shielded). 

clause_impress( the_Segment(profile_COA49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(13,58,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(310),fl(310))),time(14,39,0)),0.84)belongs_to profile_COA49_1, true, 100613,shielded). 

clause_impress( the_Aircraft_on_profile(profile_WITCH92_1,witch92), true, 100614,shielded). 

clause_impress( the_Type_of(witch92,c130), true, 100615,shielded). 

clause_impress( the_Segment(profile_WITCH92_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,13),long_W(13,0)),fl_range(fl(180),fl(180))),time(10,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(180),fl(180))),time(11,56,0)),2.8)belongs_to profile_WITCH92_1, true, 100616,shielded). 

clause_impress( the_Segment(profile_WITCH92_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(180),fl(180))),time(11,56,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(25)),fl_range(fl(180),fl(180))),time(12,38,0)),2.8)belongs_to profile_WITCH92_1, true, 100617,shielded). 

clause_impress( the_Segment(profile_WITCH92_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(25)),fl_range(fl(180),fl(180))),time(12,38,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(180),fl(180))),time(13,18,0)),2.8)belongs_to profile_WITCH92_1, true, 100618,shielded). 

clause_impress( the_Segment(profile_WITCH92_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(180),fl(180))),time(13,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(180),fl(180))),time(14,43,0)),2.8)belongs_to profile_WITCH92_1, true, 100619,shielded). 

clause_impress( the_Segment(profile_WITCH92_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(180),fl(180))),time(14,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(50)),fl_range(fl(180),fl(180))),time(16,37,0)),2.8)belongs_to profile_WITCH92_1, true, 100620,shielded). 

clause_impress( the_Aircraft_on_profile(profile_UAL925_1,ual925), true, 100621,shielded). 

clause_impress( the_Type_of(ual925,b767), true, 100622,shielded). 

clause_impress( meets_mnps(ual925), true, 100623,shielded). 

clause_impress( the_Segment(profile_UAL925_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(370),fl(370))),time(12,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(370),fl(370))),time(12,28,0)),0.8)belongs_to profile_UAL925_1, true, 100624,shielded). 

clause_impress( the_Segment(profile_UAL925_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(370),fl(370))),time(12,28,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(370),fl(370))),time(13,18,0)),0.8)belongs_to profile_UAL925_1, true, 100625,shielded). 

clause_impress( the_Segment(profile_UAL925_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(370),fl(370))),time(13,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(370),fl(370))),time(14,4,0)),0.8)belongs_to profile_UAL925_1, true, 100626,shielded). 

clause_impress( the_Segment(profile_UAL925_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(370),fl(370))),time(14,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(370),fl(370))),time(14,49,0)),0.8)belongs_to profile_UAL925_1, true, 100627,shielded). 

clause_impress( the_Aircraft_on_profile(profile_BAW175_1,baw175), true, 100628,shielded). 

clause_impress( the_Type_of(baw175,b747), true, 100629,shielded). 

clause_impress( meets_mnps(baw175), true, 100630,shielded). 

clause_impress( the_Segment(profile_BAW175_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(330),fl(330))),time(12,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(12,29,0)),0.84)belongs_to profile_BAW175_1, true, 100631,shielded). 

clause_impress( the_Segment(profile_BAW175_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(12,29,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(13,18,0)),0.84)belongs_to profile_BAW175_1, true, 100632,shielded). 

clause_impress( the_Segment(profile_BAW175_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(13,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(14,3,0)),0.84)belongs_to profile_BAW175_1, true, 100633,shielded). 

clause_impress( the_Segment(profile_BAW175_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(14,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(340),fl(340))),time(14,47,0)),0.84)belongs_to profile_BAW175_1, true, 100634,shielded). 

clause_impress( the_Aircraft_on_profile(profile_EIN105_1,ein105), true, 100635,shielded). 

clause_impress( the_Type_of(ein105,ea33), true, 100636,shielded). 

clause_impress( meets_mnps(ein105), true, 100637,shielded). 

clause_impress( the_Segment(profile_EIN105_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(350),fl(350))),time(11,51,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(350),fl(350))),time(12,31,0)),0.81)belongs_to profile_EIN105_1, true, 100638,shielded). 

clause_impress( the_Segment(profile_EIN105_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(350),fl(350))),time(12,31,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(350),fl(350))),time(13,19,0)),0.81)belongs_to profile_EIN105_1, true, 100639,shielded). 

clause_impress( the_Segment(profile_EIN105_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(350),fl(350))),time(13,19,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(350),fl(350))),time(14,2,0)),0.81)belongs_to profile_EIN105_1, true, 100640,shielded). 

clause_impress( the_Segment(profile_EIN105_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(350),fl(350))),time(14,2,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(350),fl(350))),time(14,45,0)),0.81)belongs_to profile_EIN105_1, true, 100641,shielded). 

clause_impress( the_Aircraft_on_profile(profile_N462QS_1,n462qs), true, 100642,shielded). 

clause_impress( the_Type_of(n462qs,g4), true, 100643,shielded). 

clause_impress( meets_mnps(n462qs), true, 100644,shielded). 

clause_impress( the_Segment(profile_N462QS_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(390),fl(390))),time(11,58,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(410),fl(410))),time(12,25,0)),0.77)belongs_to profile_N462QS_1, true, 100645,shielded). 

clause_impress( the_Segment(profile_N462QS_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(410),fl(410))),time(12,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(410),fl(410))),time(13,21,0)),0.77)belongs_to profile_N462QS_1, true, 100646,shielded). 

clause_impress( the_Segment(profile_N462QS_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(410),fl(410))),time(13,21,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(410),fl(410))),time(14,9,0)),0.77)belongs_to profile_N462QS_1, true, 100647,shielded). 

clause_impress( the_Segment(profile_N462QS_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(410),fl(410))),time(14,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(410),fl(410))),time(14,58,0)),0.77)belongs_to profile_N462QS_1, true, 100648,shielded). 

clause_impress( the_Aircraft_on_profile(profile_USA781_1,usa781), true, 100649,shielded). 

clause_impress( the_Type_of(usa781,b767), true, 100650,shielded). 

clause_impress( meets_mnps(usa781), true, 100651,shielded). 

clause_impress( the_Segment(profile_USA781_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(360),fl(360))),time(12,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(12,30,0)),0.8)belongs_to profile_USA781_1, true, 100652,shielded). 

clause_impress( the_Segment(profile_USA781_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(12,30,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(13,22,0)),0.8)belongs_to profile_USA781_1, true, 100653,shielded). 

clause_impress( the_Segment(profile_USA781_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(13,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(14,10,0)),0.8)belongs_to profile_USA781_1, true, 100654,shielded). 

clause_impress( the_Segment(profile_USA781_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(14,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(360),fl(360))),time(14,56,0)),0.8)belongs_to profile_USA781_1, true, 100655,shielded). 

clause_impress( the_Aircraft_on_profile(profile_XAVTO_1,xavto), true, 100656,shielded). 

clause_impress( the_Type_of(xavto,da90), true, 100657,shielded). 

clause_impress( meets_mnps(xavto), true, 100658,shielded). 

clause_impress( the_Segment(profile_XAVTO_1,fourD_pt(threeD_pt(twoD_pt(lat_N(51),long_W(15)),fl_range(fl(390),fl(390))),time(12,2,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(20)),fl_range(fl(390),fl(390))),time(12,29,0)),0.8)belongs_to profile_XAVTO_1, true, 100659,shielded). 

clause_impress( the_Segment(profile_XAVTO_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(20)),fl_range(fl(390),fl(390))),time(12,29,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(30)),fl_range(fl(390),fl(390))),time(13,22,0)),0.8)belongs_to profile_XAVTO_1, true, 100660,shielded). 

clause_impress( the_Segment(profile_XAVTO_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(30)),fl_range(fl(390),fl(390))),time(13,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(390),fl(390))),time(14,16,0)),0.8)belongs_to profile_XAVTO_1, true, 100661,shielded). 

clause_impress( the_Segment(profile_XAVTO_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(390),fl(390))),time(14,16,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(51),long_W(50)),fl_range(fl(390),fl(390))),time(15,15,0)),0.8)belongs_to profile_XAVTO_1, true, 100662,shielded). 

clause_impress( the_Aircraft_on_profile(profile_N663PD_1,n663pd), true, 100663,shielded). 

clause_impress( the_Type_of(n663pd,g2), true, 100664,shielded). 

clause_impress( meets_mnps(n663pd), true, 100665,shielded). 

clause_impress( the_Segment(profile_N663PD_1,fourD_pt(threeD_pt(twoD_pt(lat_N(51),long_W(40)),fl_range(fl(410),fl(410))),time(12,0,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(410),fl(410))),time(12,42,0)),0.83)belongs_to profile_N663PD_1, true, 100666,shielded). 

clause_impress( the_Segment(profile_N663PD_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(410),fl(410))),time(12,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(410),fl(410))),time(13,23,0)),0.83)belongs_to profile_N663PD_1, true, 100667,shielded). 

clause_impress( the_Segment(profile_N663PD_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(410),fl(410))),time(13,23,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(410),fl(410))),time(13,44,0)),0.83)belongs_to profile_N663PD_1, true, 100668,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DAL49_1,dal49), true, 100669,shielded). 

clause_impress( the_Type_of(dal49,md11), true, 100670,shielded). 

clause_impress( meets_mnps(dal49), true, 100671,shielded). 

clause_impress( the_Segment(profile_DAL49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(330),fl(330))),time(12,0,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(12,39,0)),0.83)belongs_to profile_DAL49_1, true, 100672,shielded). 

clause_impress( the_Segment(profile_DAL49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(12,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(13,25,0)),0.83)belongs_to profile_DAL49_1, true, 100673,shielded). 

clause_impress( the_Segment(profile_DAL49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(13,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(14,8,0)),0.83)belongs_to profile_DAL49_1, true, 100674,shielded). 

clause_impress( the_Segment(profile_DAL49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(14,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(330),fl(330))),time(14,49,0)),0.83)belongs_to profile_DAL49_1, true, 100675,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AIH065_1,aih065), true, 100676,shielded). 

clause_impress( the_Type_of(aih065,b767), true, 100677,shielded). 

clause_impress( meets_mnps(aih065), true, 100678,shielded). 

clause_impress( the_Segment(profile_AIH065_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48,47),long_W(12,0)),fl_range(fl(340),fl(340))),time(12,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(15)),fl_range(fl(340),fl(340))),time(12,39,0)),0.8)belongs_to profile_AIH065_1, true, 100679,shielded). 

clause_impress( the_Segment(profile_AIH065_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(15)),fl_range(fl(340),fl(340))),time(12,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(20)),fl_range(fl(340),fl(340))),time(13,5,0)),0.8)belongs_to profile_AIH065_1, true, 100680,shielded). 

clause_impress( the_Segment(profile_AIH065_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(20)),fl_range(fl(340),fl(340))),time(13,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(340),fl(340))),time(14,5,0)),0.8)belongs_to profile_AIH065_1, true, 100681,shielded). 

clause_impress( the_Segment(profile_AIH065_1,fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(340),fl(340))),time(14,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(38),long_W(40)),fl_range(fl(340),fl(340))),time(15,7,0)),0.8)belongs_to profile_AIH065_1, true, 100682,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DAL141_1,dal141), true, 100683,shielded). 

clause_impress( the_Type_of(dal141,l101), true, 100684,shielded). 

clause_impress( meets_mnps(dal141), true, 100685,shielded). 

clause_impress( the_Segment(profile_DAL141_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(310),fl(310))),time(12,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(12,41,0)),0.84)belongs_to profile_DAL141_1, true, 100686,shielded). 

clause_impress( the_Segment(profile_DAL141_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(12,41,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(13,26,0)),0.84)belongs_to profile_DAL141_1, true, 100687,shielded). 

clause_impress( the_Segment(profile_DAL141_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(13,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(14,8,0)),0.84)belongs_to profile_DAL141_1, true, 100688,shielded). 

clause_impress( the_Segment(profile_DAL141_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(14,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(310),fl(310))),time(14,49,0)),0.84)belongs_to profile_DAL141_1, true, 100689,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AMX030_1,amx030), true, 100690,shielded). 

clause_impress( the_Type_of(amx030,b767), true, 100691,shielded). 

clause_impress( meets_mnps(amx030), true, 100692,shielded). 

clause_impress( the_Segment(profile_AMX030_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(15)),fl_range(fl(310),fl(310))),time(12,15,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(310),fl(310))),time(12,41,0)),0.8)belongs_to profile_AMX030_1, true, 100693,shielded). 

clause_impress( the_Segment(profile_AMX030_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(310),fl(310))),time(12,41,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(310),fl(310))),time(13,40,0)),0.8)belongs_to profile_AMX030_1, true, 100694,shielded). 

clause_impress( the_Segment(profile_AMX030_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(310),fl(310))),time(13,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(310),fl(310))),time(14,43,0)),0.8)belongs_to profile_AMX030_1, true, 100695,shielded). 

clause_impress( the_Segment(profile_AMX030_1,fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(310),fl(310))),time(14,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(50)),fl_range(fl(310),fl(310))),time(15,48,0)),0.8)belongs_to profile_AMX030_1, true, 100696,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AJM002_1,ajm002), true, 100697,shielded). 

clause_impress( the_Type_of(ajm002,ea31), true, 100698,shielded). 

clause_impress( meets_mnps(ajm002), true, 100699,shielded). 

clause_impress( the_Segment(profile_AJM002_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(15)),fl_range(fl(290),fl(290))),time(12,12,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(20)),fl_range(fl(290),fl(290))),time(12,36,0)),0.8)belongs_to profile_AJM002_1, true, 100700,shielded). 

clause_impress( the_Segment(profile_AJM002_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(20)),fl_range(fl(290),fl(290))),time(12,36,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(290),fl(290))),time(13,39,0)),0.8)belongs_to profile_AJM002_1, true, 100701,shielded). 

clause_impress( the_Segment(profile_AJM002_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(290),fl(290))),time(13,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(290),fl(290))),time(14,41,0)),0.8)belongs_to profile_AJM002_1, true, 100702,shielded). 

clause_impress( the_Segment(profile_AJM002_1,fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(290),fl(290))),time(14,41,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(50)),fl_range(fl(290),fl(290))),time(15,46,0)),0.8)belongs_to profile_AJM002_1, true, 100703,shielded). 

clause_impress( the_Aircraft_on_profile(profile_VIR011_1,vir011), true, 100704,shielded). 

clause_impress( the_Type_of(vir011,b747), true, 100705,shielded). 

clause_impress( meets_mnps(vir011), true, 100706,shielded). 

clause_impress( the_Segment(profile_VIR011_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(330),fl(330))),time(12,15,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(330),fl(330))),time(12,39,0)),0.86)belongs_to profile_VIR011_1, true, 100707,shielded). 

clause_impress( the_Segment(profile_VIR011_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(330),fl(330))),time(12,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(330),fl(330))),time(13,27,0)),0.86)belongs_to profile_VIR011_1, true, 100708,shielded). 

clause_impress( the_Segment(profile_VIR011_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(330),fl(330))),time(13,27,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(330),fl(330))),time(14,14,0)),0.86)belongs_to profile_VIR011_1, true, 100709,shielded). 

clause_impress( the_Segment(profile_VIR011_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(330),fl(330))),time(14,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(330),fl(330))),time(15,0,0)),0.86)belongs_to profile_VIR011_1, true, 100710,shielded). 

clause_impress( the_Aircraft_on_profile(profile_LDA6868_1,lda6868), true, 100711,shielded). 

clause_impress( the_Type_of(lda6868,b767), true, 100712,shielded). 

clause_impress( meets_mnps(lda6868), true, 100713,shielded). 

clause_impress( the_Segment(profile_LDA6868_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46,0),long_W(8,45)),fl_range(fl(310),fl(310))),time(12,15,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(15)),fl_range(fl(330),fl(330))),time(12,47,0)),0.8)belongs_to profile_LDA6868_1, true, 100714,shielded). 

clause_impress( the_Segment(profile_LDA6868_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(15)),fl_range(fl(330),fl(330))),time(12,47,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(330),fl(330))),time(13,13,0)),0.8)belongs_to profile_LDA6868_1, true, 100715,shielded). 

clause_impress( the_Segment(profile_LDA6868_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(330),fl(330))),time(13,13,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(330),fl(330))),time(14,10,0)),0.8)belongs_to profile_LDA6868_1, true, 100716,shielded). 

clause_impress( the_Segment(profile_LDA6868_1,fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(330),fl(330))),time(14,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(39),long_W(40)),fl_range(fl(330),fl(330))),time(15,10,0)),0.8)belongs_to profile_LDA6868_1, true, 100717,shielded). 

clause_impress( the_Aircraft_on_profile(profile_BAW9696_1,baw9696), true, 100718,shielded). 

clause_impress( the_Type_of(baw9696,b767), true, 100719,shielded). 

clause_impress( meets_mnps(baw9696), true, 100720,shielded). 

clause_impress( the_Segment(profile_BAW9696_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(330),fl(330))),time(12,13,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(12,39,0)),0.8)belongs_to profile_BAW9696_1, true, 100721,shielded). 

clause_impress( the_Segment(profile_BAW9696_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(12,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(13,30,0)),0.8)belongs_to profile_BAW9696_1, true, 100722,shielded). 

clause_impress( the_Segment(profile_BAW9696_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(13,30,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(14,17,0)),0.8)belongs_to profile_BAW9696_1, true, 100723,shielded). 

clause_impress( the_Segment(profile_BAW9696_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(14,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(330),fl(330))),time(15,4,0)),0.8)belongs_to profile_BAW9696_1, true, 100724,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DAL147_1,dal147), true, 100725,shielded). 

clause_impress( the_Type_of(dal147,b767), true, 100726,shielded). 

clause_impress( meets_mnps(dal147), true, 100727,shielded). 

clause_impress( the_Segment(profile_DAL147_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(330),fl(330))),time(12,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(12,42,0)),0.81)belongs_to profile_DAL147_1, true, 100728,shielded). 

clause_impress( the_Segment(profile_DAL147_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(12,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(13,32,0)),0.81)belongs_to profile_DAL147_1, true, 100729,shielded). 

clause_impress( the_Segment(profile_DAL147_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(13,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(14,18,0)),0.81)belongs_to profile_DAL147_1, true, 100730,shielded). 

clause_impress( the_Segment(profile_DAL147_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(14,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(330),fl(330))),time(15,3,0)),0.81)belongs_to profile_DAL147_1, true, 100731,shielded). 

clause_impress( the_Aircraft_on_profile(profile_TWA841_1,twa841), true, 100732,shielded). 

clause_impress( the_Type_of(twa841,b747), true, 100733,shielded). 

clause_impress( meets_mnps(twa841), true, 100734,shielded). 

clause_impress( the_Segment(profile_TWA841_1,fourD_pt(threeD_pt(twoD_pt(lat_N(50),long_W(15)),fl_range(fl(340),fl(340))),time(12,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(50),long_W(20)),fl_range(fl(340),fl(340))),time(12,40,0)),0.84)belongs_to profile_TWA841_1, true, 100735,shielded). 

clause_impress( the_Segment(profile_TWA841_1,fourD_pt(threeD_pt(twoD_pt(lat_N(50),long_W(20)),fl_range(fl(340),fl(340))),time(12,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(340),fl(340))),time(13,32,0)),0.84)belongs_to profile_TWA841_1, true, 100736,shielded). 

clause_impress( the_Segment(profile_TWA841_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(340),fl(340))),time(13,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(340),fl(340))),time(14,26,0)),0.84)belongs_to profile_TWA841_1, true, 100737,shielded). 

clause_impress( the_Segment(profile_TWA841_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(340),fl(340))),time(14,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(50)),fl_range(fl(340),fl(340))),time(15,18,0)),0.84)belongs_to profile_TWA841_1, true, 100738,shielded). 

clause_impress( the_Aircraft_on_profile(profile_COA063_1,coa063), true, 100739,shielded). 

clause_impress( the_Type_of(coa063,dc10), true, 100740,shielded). 

clause_impress( meets_mnps(coa063), true, 100741,shielded). 

clause_impress( the_Segment(profile_COA063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44,30),long_W(13,0)),fl_range(fl(280),fl(280))),time(12,6,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(280),fl(280))),time(12,41,0)),0.84)belongs_to profile_COA063_1, true, 100742,shielded). 

clause_impress( the_Segment(profile_COA063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(280),fl(280))),time(12,41,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(30)),fl_range(fl(280),fl(280))),time(13,33,0)),0.84)belongs_to profile_COA063_1, true, 100743,shielded). 

clause_impress( the_Segment(profile_COA063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(30)),fl_range(fl(280),fl(280))),time(13,33,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(40)),fl_range(fl(280),fl(280))),time(14,30,0)),0.84)belongs_to profile_COA063_1, true, 100744,shielded). 

clause_impress( the_Segment(profile_COA063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(40)),fl_range(fl(280),fl(280))),time(14,30,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(50)),fl_range(fl(280),fl(280))),time(15,28,0)),0.84)belongs_to profile_COA063_1, true, 100745,shielded). 

clause_impress( the_Aircraft_on_profile(profile_AOM427_1,aom427), true, 100746,shielded). 

clause_impress( the_Type_of(aom427,dc10), true, 100747,shielded). 

clause_impress( meets_mnps(aom427), true, 100748,shielded). 

clause_impress( the_Segment(profile_AOM427_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48,0),long_W(8,45)),fl_range(fl(290),fl(290))),time(12,15,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(290),fl(290))),time(13,14,0)),0.84)belongs_to profile_AOM427_1, true, 100749,shielded). 

clause_impress( the_Segment(profile_AOM427_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(290),fl(290))),time(13,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(30)),fl_range(fl(290),fl(290))),time(14,15,0)),0.84)belongs_to profile_AOM427_1, true, 100750,shielded). 

clause_impress( the_Aircraft_on_profile(profile_DAL123_1,dal123), true, 100751,shielded). 

clause_impress( the_Type_of(dal123,b767), true, 100752,shielded). 

clause_impress( meets_mnps(dal123), true, 100753,shielded). 


:- unknown(_,fail).
:- multifile the_Aircraft_on_profile/2.
:- dynamic the_Aircraft_on_profile/2.
:- prolog_flag(compiling, _, fastcode).

the_Aircraft_on_profile(profile_KLM745_1,klm745).

the_Type_of(klm745,b74f).

meets_mnps(klm745).

the_Segment(profile_KLM745_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(280),fl(280))),time(10,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(280),fl(280))),time(11,8,0)),0.86)belongs_to profile_KLM745_1.

the_Segment(profile_KLM745_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(280),fl(280))),time(11,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(280),fl(280))),time(11,54,0)),0.86)belongs_to profile_KLM745_1.

the_Segment(profile_KLM745_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(280),fl(280))),time(11,54,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(280),fl(280))),time(12,38,0)),0.86)belongs_to profile_KLM745_1.

the_Segment(profile_KLM745_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(280),fl(280))),time(12,38,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(280),fl(280))),time(13,21,0)),0.86)belongs_to profile_KLM745_1.

the_Aircraft_on_profile(profile_DLH450_1,dlh450).

the_Type_of(dlh450,b74f).

meets_mnps(dlh450).

the_Segment(profile_DLH450_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(10)),fl_range(fl(330),fl(330))),time(10,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(20)),fl_range(fl(330),fl(330))),time(11,28,0)),0.86)belongs_to profile_DLH450_1.

the_Segment(profile_DLH450_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(20)),fl_range(fl(330),fl(330))),time(11,28,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(30)),fl_range(fl(330),fl(330))),time(12,10,0)),0.86)belongs_to profile_DLH450_1.

the_Segment(profile_DLH450_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(30)),fl_range(fl(330),fl(330))),time(12,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(40)),fl_range(fl(330),fl(330))),time(12,44,0)),0.86)belongs_to profile_DLH450_1.

the_Segment(profile_DLH450_1,fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(40)),fl_range(fl(330),fl(330))),time(12,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(50)),fl_range(fl(330),fl(330))),time(13,18,0)),0.86)belongs_to profile_DLH450_1.

the_Segment(profile_DLH450_1,fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(50)),fl_range(fl(330),fl(330))),time(13,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(60)),fl_range(fl(330),fl(330))),time(13,53,0)),0.86)belongs_to profile_DLH450_1.

the_Aircraft_on_profile(profile_DAL11_1,dal11).

the_Type_of(dal11,md11).

meets_mnps(dal11).

the_Segment(profile_DAL11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(330),fl(330))),time(10,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,8,0)),0.83)belongs_to profile_DAL11_1.

the_Segment(profile_DAL11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(11,55,0)),0.83)belongs_to profile_DAL11_1.

the_Segment(profile_DAL11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(11,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(12,40,0)),0.83)belongs_to profile_DAL11_1.

the_Segment(profile_DAL11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(12,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(330),fl(330))),time(13,24,0)),0.83)belongs_to profile_DAL11_1.

the_Aircraft_on_profile(profile_DAL39_1,dal39).

the_Type_of(dal39,l101).

meets_mnps(dal39).

the_Segment(profile_DAL39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(310),fl(310))),time(10,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,8,0)),0.83)belongs_to profile_DAL39_1.

the_Segment(profile_DAL39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(11,56,0)),0.83)belongs_to profile_DAL39_1.

the_Segment(profile_DAL39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(11,56,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(12,42,0)),0.83)belongs_to profile_DAL39_1.

the_Segment(profile_DAL39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(12,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(310),fl(310))),time(13,25,0)),0.83)belongs_to profile_DAL39_1.

the_Aircraft_on_profile(profile_DLH444_1,dlh444).

the_Type_of(dlh444,ea34).

meets_mnps(dlh444).

the_Segment(profile_DLH444_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(350),fl(350))),time(10,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(11,7,0)),0.82)belongs_to profile_DLH444_1.

the_Segment(profile_DLH444_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(11,7,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(11,56,0)),0.82)belongs_to profile_DLH444_1.

the_Segment(profile_DLH444_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(11,56,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(12,42,0)),0.82)belongs_to profile_DLH444_1.

the_Segment(profile_DLH444_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(12,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(350),fl(350))),time(13,28,0)),0.82)belongs_to profile_DLH444_1.

the_Aircraft_on_profile(profile_TSC113_1,tsc113).

the_Type_of(tsc113,b757).

meets_mnps(tsc113).

the_Segment(profile_TSC113_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(340),fl(340))),time(10,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(340),fl(340))),time(11,5,0)),0.8)belongs_to profile_TSC113_1.

the_Segment(profile_TSC113_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(340),fl(340))),time(11,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(340),fl(340))),time(11,58,0)),0.8)belongs_to profile_TSC113_1.

the_Segment(profile_TSC113_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(340),fl(340))),time(11,58,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(340),fl(340))),time(12,49,0)),0.8)belongs_to profile_TSC113_1.

the_Segment(profile_TSC113_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(340),fl(340))),time(12,49,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(340),fl(340))),time(13,39,0)),0.8)belongs_to profile_TSC113_1.

the_Aircraft_on_profile(profile_AFR594_1,afr594).

the_Type_of(afr594,b747).

meets_mnps(afr594).

the_Segment(profile_AFR594_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46,0),long_W(8,45)),fl_range(fl(330),fl(330))),time(10,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(10)),fl_range(fl(340),fl(340))),time(10,51,0)),0.84)belongs_to profile_AFR594_1.

the_Segment(profile_AFR594_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(10)),fl_range(fl(340),fl(340))),time(10,51,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(340),fl(340))),time(11,40,0)),0.84)belongs_to profile_AFR594_1.

the_Segment(profile_AFR594_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(340),fl(340))),time(11,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(41),long_W(30)),fl_range(fl(340),fl(340))),time(12,38,0)),0.84)belongs_to profile_AFR594_1.

the_Segment(profile_AFR594_1,fourD_pt(threeD_pt(twoD_pt(lat_N(41),long_W(30)),fl_range(fl(340),fl(340))),time(12,38,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(40)),fl_range(fl(340),fl(340))),time(13,41,0)),0.84)belongs_to profile_AFR594_1.

the_Aircraft_on_profile(profile_LKR501_1,lkr501).

the_Type_of(lkr501,dc10).

meets_mnps(lkr501).

the_Segment(profile_LKR501_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(310),fl(310))),time(10,48,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(11,11,0)),0.83)belongs_to profile_LKR501_1.

the_Segment(profile_LKR501_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(11,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(11,59,0)),0.83)belongs_to profile_LKR501_1.

the_Segment(profile_LKR501_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(11,59,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(12,45,0)),0.83)belongs_to profile_LKR501_1.

the_Segment(profile_LKR501_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(12,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(310),fl(310))),time(13,30,0)),0.83)belongs_to profile_LKR501_1.

the_Aircraft_on_profile(profile_DAL125_1,dal125).

the_Type_of(dal125,l101).

meets_mnps(dal125).

the_Segment(profile_DAL125_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(310),fl(310))),time(10,37,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(11,15,0)),0.83)belongs_to profile_DAL125_1.

the_Segment(profile_DAL125_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(11,15,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(12,1,0)),0.83)belongs_to profile_DAL125_1.

the_Segment(profile_DAL125_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(12,1,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(12,44,0)),0.83)belongs_to profile_DAL125_1.

the_Segment(profile_DAL125_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(12,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(310),fl(310))),time(13,25,0)),0.83)belongs_to profile_DAL125_1.

the_Aircraft_on_profile(profile_KLM621_1,klm621).

the_Type_of(klm621,b767).

meets_mnps(klm621).

the_Segment(profile_KLM621_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(330),fl(330))),time(10,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(330),fl(330))),time(11,9,0)),0.79)belongs_to profile_KLM621_1.

the_Segment(profile_KLM621_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(330),fl(330))),time(11,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(330),fl(330))),time(12,2,0)),0.79)belongs_to profile_KLM621_1.

the_Segment(profile_KLM621_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(330),fl(330))),time(12,2,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(330),fl(330))),time(12,54,0)),0.79)belongs_to profile_KLM621_1.

the_Segment(profile_KLM621_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(330),fl(330))),time(12,54,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(330),fl(330))),time(13,44,0)),0.79)belongs_to profile_KLM621_1.

the_Aircraft_on_profile(profile_AAL71_1,aal71).

the_Type_of(aal71,b767).

meets_mnps(aal71).

the_Segment(profile_AAL71_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(330),fl(330))),time(10,35,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(11,14,0)),0.8)belongs_to profile_AAL71_1.

the_Segment(profile_AAL71_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(11,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(12,2,0)),0.8)belongs_to profile_AAL71_1.

the_Segment(profile_AAL71_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(12,2,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(12,46,0)),0.8)belongs_to profile_AAL71_1.

the_Segment(profile_AAL71_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(12,46,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(330),fl(330))),time(13,29,0)),0.8)belongs_to profile_AAL71_1.

the_Aircraft_on_profile(profile_DAL119_1,dal119).

the_Type_of(dal119,b767).

meets_mnps(dal119).

the_Segment(profile_DAL119_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(360),fl(360))),time(10,48,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(11,13,0)),0.81)belongs_to profile_DAL119_1.

the_Segment(profile_DAL119_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(11,13,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(12,3,0)),0.81)belongs_to profile_DAL119_1.

the_Segment(profile_DAL119_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(12,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(12,50,0)),0.81)belongs_to profile_DAL119_1.

the_Segment(profile_DAL119_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(12,50,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(360),fl(360))),time(13,36,0)),0.81)belongs_to profile_DAL119_1.

the_Aircraft_on_profile(profile_AAL101_1,aal101).

the_Type_of(aal101,b767).

meets_mnps(aal101).

the_Segment(profile_AAL101_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(330),fl(330))),time(10,46,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(11,12,0)),0.79)belongs_to profile_AAL101_1.

the_Segment(profile_AAL101_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(11,12,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,4,0)),0.79)belongs_to profile_AAL101_1.

the_Segment(profile_AAL101_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(12,52,0)),0.79)belongs_to profile_AAL101_1.

the_Segment(profile_AAL101_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(12,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(330),fl(330))),time(13,40,0)),0.79)belongs_to profile_AAL101_1.

the_Aircraft_on_profile(profile_DLH436_1,dlh436).

the_Type_of(dlh436,ea34).

meets_mnps(dlh436).

the_Segment(profile_DLH436_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(340),fl(340))),time(10,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(340),fl(340))),time(11,17,0)),0.83)belongs_to profile_DLH436_1.

the_Segment(profile_DLH436_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(340),fl(340))),time(11,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(340),fl(340))),time(12,4,0)),0.83)belongs_to profile_DLH436_1.

the_Segment(profile_DLH436_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(340),fl(340))),time(12,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(340),fl(340))),time(12,46,0)),0.83)belongs_to profile_DLH436_1.

the_Segment(profile_DLH436_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(340),fl(340))),time(12,46,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(340),fl(340))),time(13,27,0)),0.83)belongs_to profile_DLH436_1.

the_Aircraft_on_profile(profile_ULE709_1,ule709).

the_Type_of(ule709,b767).

meets_mnps(ule709).

the_Segment(profile_ULE709_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(340),fl(340))),time(10,48,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(11,14,0)),0.8)belongs_to profile_ULE709_1.

the_Segment(profile_ULE709_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(11,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(12,5,0)),0.8)belongs_to profile_ULE709_1.

the_Segment(profile_ULE709_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(12,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(12,53,0)),0.8)belongs_to profile_ULE709_1.

the_Segment(profile_ULE709_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(12,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(340),fl(340))),time(13,39,0)),0.8)belongs_to profile_ULE709_1.

the_Aircraft_on_profile(profile_AFR222_1,afr222).

the_Type_of(afr222,ea34).

meets_mnps(afr222).

the_Segment(profile_AFR222_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46,0),long_W(8,45)),fl_range(fl(340),fl(340))),time(11,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(15)),fl_range(fl(340),fl(340))),time(12,5,0)),0.81)belongs_to profile_AFR222_1.

the_Segment(profile_AFR222_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(15)),fl_range(fl(340),fl(340))),time(12,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(43),long_W(20)),fl_range(fl(340),fl(340))),time(12,35,0)),0.81)belongs_to profile_AFR222_1.

the_Segment(profile_AFR222_1,fourD_pt(threeD_pt(twoD_pt(lat_N(43),long_W(20)),fl_range(fl(340),fl(340))),time(12,35,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(30)),fl_range(fl(340),fl(340))),time(13,34,0)),0.81)belongs_to profile_AFR222_1.

the_Aircraft_on_profile(profile_KLM604_1,klm604).

the_Type_of(klm604,b747).

meets_mnps(klm604).

the_Segment(profile_KLM604_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(20)),fl_range(fl(340),fl(340))),time(11,51,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(10)),fl_range(fl(340),fl(340))),time(12,25,0)),0.84)belongs_to profile_KLM604_1.

the_Aircraft_on_profile(profile_N252C_1,n252c).

the_Type_of(n252c,g4).

meets_mnps(n252c).

the_Segment(profile_N252C_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(10)),fl_range(fl(390),fl(390))),time(10,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(390),fl(390))),time(11,18,0)),0.8)belongs_to profile_N252C_1.

the_Segment(profile_N252C_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(390),fl(390))),time(11,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(390),fl(390))),time(12,7,0)),0.8)belongs_to profile_N252C_1.

the_Segment(profile_N252C_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(390),fl(390))),time(12,7,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(390),fl(390))),time(12,49,0)),0.8)belongs_to profile_N252C_1.

the_Segment(profile_N252C_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(390),fl(390))),time(12,49,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(50)),fl_range(fl(390),fl(390))),time(13,31,0)),0.8)belongs_to profile_N252C_1.

the_Aircraft_on_profile(profile_BAW9612_1,baw9612).

the_Type_of(baw9612,b747).

meets_mnps(baw9612).

the_Segment(profile_BAW9612_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(330),fl(330))),time(10,56,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,20,0)),0.84)belongs_to profile_BAW9612_1.

the_Segment(profile_BAW9612_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,20,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(12,8,0)),0.84)belongs_to profile_BAW9612_1.

the_Segment(profile_BAW9612_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(12,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(12,52,0)),0.84)belongs_to profile_BAW9612_1.

the_Segment(profile_BAW9612_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(12,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(330),fl(330))),time(13,36,0)),0.84)belongs_to profile_BAW9612_1.

the_Aircraft_on_profile(profile_BAW9683_1,baw9683).

the_Type_of(baw9683,dc10).

meets_mnps(baw9683).

the_Segment(profile_BAW9683_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(15)),fl_range(fl(280),fl(280))),time(11,0,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(280),fl(280))),time(11,25,0)),0.82)belongs_to profile_BAW9683_1.

the_Segment(profile_BAW9683_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(280),fl(280))),time(11,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(280),fl(280))),time(12,21,0)),0.82)belongs_to profile_BAW9683_1.

the_Segment(profile_BAW9683_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(280),fl(280))),time(12,21,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(280),fl(280))),time(13,22,0)),0.82)belongs_to profile_BAW9683_1.

the_Segment(profile_BAW9683_1,fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(280),fl(280))),time(13,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(50)),fl_range(fl(280),fl(280))),time(14,25,0)),0.82)belongs_to profile_BAW9683_1.

the_Aircraft_on_profile(profile_BAW9671_1,baw9671).

the_Type_of(baw9671,dc10).

meets_mnps(baw9671).

the_Segment(profile_BAW9671_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(310),fl(310))),time(10,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,21,0)),0.82)belongs_to profile_BAW9671_1.

the_Segment(profile_BAW9671_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,21,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(12,9,0)),0.82)belongs_to profile_BAW9671_1.

the_Segment(profile_BAW9671_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(12,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(12,55,0)),0.82)belongs_to profile_BAW9671_1.

the_Segment(profile_BAW9671_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(12,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(310),fl(310))),time(13,40,0)),0.82)belongs_to profile_BAW9671_1.

the_Aircraft_on_profile(profile_AAL137_1,aal137).

the_Type_of(aal137,b767).

meets_mnps(aal137).

the_Segment(profile_AAL137_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(10)),fl_range(fl(310),fl(310))),time(10,35,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(20)),fl_range(fl(310),fl(310))),time(11,25,0)),0.8)belongs_to profile_AAL137_1.

the_Segment(profile_AAL137_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(20)),fl_range(fl(310),fl(310))),time(11,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(30)),fl_range(fl(310),fl(310))),time(12,10,0)),0.8)belongs_to profile_AAL137_1.

the_Segment(profile_AAL137_1,fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(30)),fl_range(fl(310),fl(310))),time(12,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(40)),fl_range(fl(310),fl(310))),time(12,49,0)),0.8)belongs_to profile_AAL137_1.

the_Segment(profile_AAL137_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(40)),fl_range(fl(310),fl(310))),time(12,49,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(50)),fl_range(fl(310),fl(310))),time(13,26,0)),0.8)belongs_to profile_AAL137_1.

the_Segment(profile_AAL137_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(50)),fl_range(fl(310),fl(310))),time(13,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(60)),fl_range(fl(310),fl(310))),time(14,8,0)),0.8)belongs_to profile_AAL137_1.

the_Aircraft_on_profile(profile_VIR075_1,vir075).

the_Type_of(vir075,ea34).

meets_mnps(vir075).

the_Segment(profile_VIR075_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(350),fl(350))),time(10,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(350),fl(350))),time(11,22,0)),0.82)belongs_to profile_VIR075_1.

the_Segment(profile_VIR075_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(350),fl(350))),time(11,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(350),fl(350))),time(12,10,0)),0.82)belongs_to profile_VIR075_1.

the_Segment(profile_VIR075_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(350),fl(350))),time(12,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(350),fl(350))),time(12,55,0)),0.82)belongs_to profile_VIR075_1.

the_Segment(profile_VIR075_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(350),fl(350))),time(12,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(350),fl(350))),time(13,39,0)),0.82)belongs_to profile_VIR075_1.

the_Aircraft_on_profile(profile_BAW285_1,baw285).

the_Type_of(baw285,b74f).

meets_mnps(baw285).

the_Segment(profile_BAW285_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(10)),fl_range(fl(290),fl(290))),time(11,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(20)),fl_range(fl(290),fl(290))),time(12,4,0)),0.86)belongs_to profile_BAW285_1.

the_Segment(profile_BAW285_1,fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(20)),fl_range(fl(290),fl(290))),time(12,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(66),long_W(30)),fl_range(fl(290),fl(290))),time(12,51,0)),0.86)belongs_to profile_BAW285_1.

the_Segment(profile_BAW285_1,fourD_pt(threeD_pt(twoD_pt(lat_N(66),long_W(30)),fl_range(fl(290),fl(290))),time(12,51,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(68),long_W(40)),fl_range(fl(290),fl(290))),time(13,24,0)),0.86)belongs_to profile_BAW285_1.

the_Segment(profile_BAW285_1,fourD_pt(threeD_pt(twoD_pt(lat_N(68),long_W(40)),fl_range(fl(290),fl(290))),time(13,24,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(69),long_W(50)),fl_range(fl(290),fl(290))),time(13,52,0)),0.86)belongs_to profile_BAW285_1.

the_Aircraft_on_profile(profile_LTU900_1,ltu900).

the_Type_of(ltu900,b767).

meets_mnps(ltu900).

the_Segment(profile_LTU900_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(15)),fl_range(fl(310),fl(310))),time(11,1,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(310),fl(310))),time(11,27,0)),0.81)belongs_to profile_LTU900_1.

the_Segment(profile_LTU900_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(310),fl(310))),time(11,27,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(310),fl(310))),time(12,25,0)),0.81)belongs_to profile_LTU900_1.

the_Segment(profile_LTU900_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(310),fl(310))),time(12,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(310),fl(310))),time(13,27,0)),0.81)belongs_to profile_LTU900_1.

the_Segment(profile_LTU900_1,fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(310),fl(310))),time(13,27,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(50)),fl_range(fl(310),fl(310))),time(14,32,0)),0.81)belongs_to profile_LTU900_1.

the_Aircraft_on_profile(profile_SWR126_1,swr126).

the_Type_of(swr126,b747).

meets_mnps(swr126).

the_Segment(profile_SWR126_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(350),fl(350))),time(11,1,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(11,25,0)),0.84)belongs_to profile_SWR126_1.

the_Segment(profile_SWR126_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(11,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(12,12,0)),0.84)belongs_to profile_SWR126_1.

the_Segment(profile_SWR126_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(12,12,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(12,57,0)),0.84)belongs_to profile_SWR126_1.

the_Segment(profile_SWR126_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(12,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(350),fl(350))),time(13,42,0)),0.84)belongs_to profile_SWR126_1.

the_Aircraft_on_profile(profile_UAL961_1,ual961).

the_Type_of(ual961,b777).

meets_mnps(ual961).

the_Segment(profile_UAL961_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(10)),fl_range(fl(350),fl(350))),time(11,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(20)),fl_range(fl(350),fl(350))),time(12,33,0)),0.84)belongs_to profile_UAL961_1.

the_Segment(profile_UAL961_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(20)),fl_range(fl(350),fl(350))),time(12,33,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(65),long_W(30)),fl_range(fl(350),fl(350))),time(13,14,0)),0.84)belongs_to profile_UAL961_1.

the_Segment(profile_UAL961_1,fourD_pt(threeD_pt(twoD_pt(lat_N(65),long_W(30)),fl_range(fl(350),fl(350))),time(13,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(66),long_W(40)),fl_range(fl(350),fl(350))),time(13,46,0)),0.84)belongs_to profile_UAL961_1.

the_Segment(profile_UAL961_1,fourD_pt(threeD_pt(twoD_pt(lat_N(66),long_W(40)),fl_range(fl(350),fl(350))),time(13,46,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(67),long_W(50)),fl_range(fl(350),fl(350))),time(14,18,0)),0.84)belongs_to profile_UAL961_1.

the_Aircraft_on_profile(profile_COA21_1,coa21).

the_Type_of(coa21,dc10).

meets_mnps(coa21).

the_Segment(profile_COA21_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(310),fl(310))),time(10,50,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(11,28,0)),0.83)belongs_to profile_COA21_1.

the_Segment(profile_COA21_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(11,28,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(12,14,0)),0.83)belongs_to profile_COA21_1.

the_Segment(profile_COA21_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(12,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(12,57,0)),0.83)belongs_to profile_COA21_1.

the_Segment(profile_COA21_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(12,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(310),fl(310))),time(13,38,0)),0.83)belongs_to profile_COA21_1.

the_Aircraft_on_profile(profile_USA817_1,usa817).

the_Type_of(usa817,b767).

meets_mnps(usa817).

the_Segment(profile_USA817_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(360),fl(360))),time(11,0,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(11,25,0)),0.8)belongs_to profile_USA817_1.

the_Segment(profile_USA817_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(11,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(12,16,0)),0.8)belongs_to profile_USA817_1.

the_Segment(profile_USA817_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(12,16,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(13,4,0)),0.8)belongs_to profile_USA817_1.

the_Segment(profile_USA817_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(13,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(360),fl(360))),time(13,50,0)),0.8)belongs_to profile_USA817_1.

the_Aircraft_on_profile(profile_AFR004_1,afr004).

the_Type_of(afr004,b747).

meets_mnps(afr004).

the_Segment(profile_AFR004_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(310),fl(310))),time(11,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(11,29,0)),0.84)belongs_to profile_AFR004_1.

the_Segment(profile_AFR004_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(11,29,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(12,17,0)),0.84)belongs_to profile_AFR004_1.

the_Segment(profile_AFR004_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(12,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,4,0)),0.84)belongs_to profile_AFR004_1.

the_Segment(profile_AFR004_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(310),fl(310))),time(13,50,0)),0.84)belongs_to profile_AFR004_1.

the_Aircraft_on_profile(profile_AAL63_1,aal63).

the_Type_of(aal63,b767).

meets_mnps(aal63).

the_Segment(profile_AAL63_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(15)),fl_range(fl(340),fl(340))),time(11,6,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(340),fl(340))),time(11,32,0)),0.8)belongs_to profile_AAL63_1.

the_Segment(profile_AAL63_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(340),fl(340))),time(11,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(340),fl(340))),time(12,32,0)),0.8)belongs_to profile_AAL63_1.

the_Segment(profile_AAL63_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(340),fl(340))),time(12,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(340),fl(340))),time(13,35,0)),0.8)belongs_to profile_AAL63_1.

the_Segment(profile_AAL63_1,fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(340),fl(340))),time(13,35,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(50)),fl_range(fl(340),fl(340))),time(14,41,0)),0.8)belongs_to profile_AAL63_1.

the_Aircraft_on_profile(profile_AIH061_1,aih061).

the_Type_of(aih061,b767).

meets_mnps(aih061).

the_Segment(profile_AIH061_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(340),fl(340))),time(11,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(340),fl(340))),time(11,28,0)),0.8)belongs_to profile_AIH061_1.

the_Segment(profile_AIH061_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(340),fl(340))),time(11,28,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(340),fl(340))),time(12,18,0)),0.8)belongs_to profile_AIH061_1.

the_Segment(profile_AIH061_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(340),fl(340))),time(12,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(340),fl(340))),time(13,4,0)),0.8)belongs_to profile_AIH061_1.

the_Segment(profile_AIH061_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(340),fl(340))),time(13,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(340),fl(340))),time(13,50,0)),0.8)belongs_to profile_AIH061_1.

the_Aircraft_on_profile(profile_AFL344B_1,afl344b).

the_Type_of(afl344b,il62).

the_Segment(profile_AFL344B_1,fourD_pt(threeD_pt(twoD_pt(lat_N(51),long_W(40)),fl_range(fl(290),fl(290))),time(10,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(290),fl(290))),time(11,33,0)),0.8)belongs_to profile_AFL344B_1.

the_Segment(profile_AFL344B_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(290),fl(290))),time(11,33,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(290),fl(290))),time(12,16,0)),0.8)belongs_to profile_AFL344B_1.

the_Segment(profile_AFL344B_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(290),fl(290))),time(12,16,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(290),fl(290))),time(12,38,0)),0.8)belongs_to profile_AFL344B_1.

the_Aircraft_on_profile(profile_SWR124_1,swr124).

the_Type_of(swr124,md11).

meets_mnps(swr124).

the_Segment(profile_SWR124_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(10)),fl_range(fl(330),fl(330))),time(10,49,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(330),fl(330))),time(11,36,0)),0.82)belongs_to profile_SWR124_1.

the_Segment(profile_SWR124_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(330),fl(330))),time(11,36,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(330),fl(330))),time(12,21,0)),0.82)belongs_to profile_SWR124_1.

the_Segment(profile_SWR124_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(330),fl(330))),time(12,21,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(330),fl(330))),time(13,2,0)),0.82)belongs_to profile_SWR124_1.

the_Segment(profile_SWR124_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(330),fl(330))),time(13,2,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(50)),fl_range(fl(330),fl(330))),time(13,43,0)),0.82)belongs_to profile_SWR124_1.

the_Aircraft_on_profile(profile_BAW299_1,baw299).

the_Type_of(baw299,b747).

meets_mnps(baw299).

the_Segment(profile_BAW299_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(330),fl(330))),time(10,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(11,34,0)),0.84)belongs_to profile_BAW299_1.

the_Segment(profile_BAW299_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(11,34,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(12,21,0)),0.84)belongs_to profile_BAW299_1.

the_Segment(profile_BAW299_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(12,21,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(13,3,0)),0.84)belongs_to profile_BAW299_1.

the_Segment(profile_BAW299_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(13,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(330),fl(330))),time(13,44,0)),0.84)belongs_to profile_BAW299_1.

the_Aircraft_on_profile(profile_AAL51_1,aal51).

the_Type_of(aal51,md11).

meets_mnps(aal51).

the_Segment(profile_AAL51_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(330),fl(330))),time(11,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,34,0)),0.83)belongs_to profile_AAL51_1.

the_Segment(profile_AAL51_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,34,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(12,21,0)),0.83)belongs_to profile_AAL51_1.

the_Segment(profile_AAL51_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(12,21,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(13,6,0)),0.83)belongs_to profile_AAL51_1.

the_Segment(profile_AAL51_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(13,6,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(330),fl(330))),time(13,50,0)),0.83)belongs_to profile_AAL51_1.

the_Aircraft_on_profile(profile_UAL977_1,ual977).

the_Type_of(ual977,b767).

meets_mnps(ual977).

the_Segment(profile_UAL977_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(330),fl(330))),time(11,7,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(11,33,0)),0.81)belongs_to profile_UAL977_1.

the_Segment(profile_UAL977_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(11,33,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,23,0)),0.81)belongs_to profile_UAL977_1.

the_Segment(profile_UAL977_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,23,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(13,10,0)),0.81)belongs_to profile_UAL977_1.

the_Segment(profile_UAL977_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(13,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(330),fl(330))),time(13,56,0)),0.81)belongs_to profile_UAL977_1.

the_Aircraft_on_profile(profile_KLM601_1,klm601).

the_Type_of(klm601,b747).

meets_mnps(klm601).

the_Segment(profile_KLM601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(10)),fl_range(fl(280),fl(280))),time(11,19,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(20)),fl_range(fl(280),fl(280))),time(12,7,0)),0.85)belongs_to profile_KLM601_1.

the_Segment(profile_KLM601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(20)),fl_range(fl(280),fl(280))),time(12,7,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(30)),fl_range(fl(280),fl(280))),time(12,45,0)),0.85)belongs_to profile_KLM601_1.

the_Segment(profile_KLM601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(30)),fl_range(fl(280),fl(280))),time(12,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(40)),fl_range(fl(280),fl(280))),time(13,19,0)),0.85)belongs_to profile_KLM601_1.

the_Segment(profile_KLM601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(40)),fl_range(fl(280),fl(280))),time(13,19,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(50)),fl_range(fl(280),fl(280))),time(13,53,0)),0.85)belongs_to profile_KLM601_1.

the_Segment(profile_KLM601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(50)),fl_range(fl(280),fl(280))),time(13,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(60)),fl_range(fl(280),fl(280))),time(14,28,0)),0.85)belongs_to profile_KLM601_1.

the_Aircraft_on_profile(profile_AAL37_1,aal37).

the_Type_of(aal37,b767).

meets_mnps(aal37).

the_Segment(profile_AAL37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(350),fl(350))),time(10,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(350),fl(350))),time(11,35,0)),0.8)belongs_to profile_AAL37_1.

the_Segment(profile_AAL37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(350),fl(350))),time(11,35,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(350),fl(350))),time(12,24,0)),0.8)belongs_to profile_AAL37_1.

the_Segment(profile_AAL37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(350),fl(350))),time(12,24,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(350),fl(350))),time(13,8,0)),0.8)belongs_to profile_AAL37_1.

the_Segment(profile_AAL37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(350),fl(350))),time(13,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(350),fl(350))),time(13,51,0)),0.8)belongs_to profile_AAL37_1.

the_Aircraft_on_profile(profile_AAL23_1,aal23).

the_Type_of(aal23,b767).

meets_mnps(aal23).

the_Segment(profile_AAL23_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(360),fl(360))),time(10,56,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(360),fl(360))),time(11,36,0)),0.8)belongs_to profile_AAL23_1.

the_Segment(profile_AAL23_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(360),fl(360))),time(11,36,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(360),fl(360))),time(12,25,0)),0.8)belongs_to profile_AAL23_1.

the_Segment(profile_AAL23_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(360),fl(360))),time(12,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(360),fl(360))),time(13,9,0)),0.8)belongs_to profile_AAL23_1.

the_Segment(profile_AAL23_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(360),fl(360))),time(13,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(360),fl(360))),time(13,52,0)),0.8)belongs_to profile_AAL23_1.

the_Aircraft_on_profile(profile_DLH8174_1,dlh8174).

the_Type_of(dlh8174,b747).

meets_mnps(dlh8174).

the_Segment(profile_DLH8174_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(310),fl(310))),time(11,15,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,38,0)),0.84)belongs_to profile_DLH8174_1.

the_Segment(profile_DLH8174_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,38,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(12,26,0)),0.84)belongs_to profile_DLH8174_1.

the_Segment(profile_DLH8174_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(12,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(13,11,0)),0.84)belongs_to profile_DLH8174_1.

the_Segment(profile_DLH8174_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(13,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(310),fl(310))),time(13,54,0)),0.84)belongs_to profile_DLH8174_1.

the_Aircraft_on_profile(profile_AFL315_1,afl315).

the_Type_of(afl315,b767).

meets_mnps(afl315).

the_Segment(profile_AFL315_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(350),fl(350))),time(11,12,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(350),fl(350))),time(11,37,0)),0.81)belongs_to profile_AFL315_1.

the_Segment(profile_AFL315_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(350),fl(350))),time(11,37,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(350),fl(350))),time(12,26,0)),0.81)belongs_to profile_AFL315_1.

the_Segment(profile_AFL315_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(350),fl(350))),time(12,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(350),fl(350))),time(13,11,0)),0.81)belongs_to profile_AFL315_1.

the_Segment(profile_AFL315_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(350),fl(350))),time(13,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(350),fl(350))),time(13,56,0)),0.81)belongs_to profile_AFL315_1.

the_Aircraft_on_profile(profile_VIR019_1,vir019).

the_Type_of(vir019,b74f).

meets_mnps(vir019).

the_Segment(profile_VIR019_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(10)),fl_range(fl(330),fl(330))),time(11,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(20)),fl_range(fl(330),fl(330))),time(12,13,0)),0.86)belongs_to profile_VIR019_1.

the_Segment(profile_VIR019_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(20)),fl_range(fl(330),fl(330))),time(12,13,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(30)),fl_range(fl(330),fl(330))),time(12,55,0)),0.86)belongs_to profile_VIR019_1.

the_Segment(profile_VIR019_1,fourD_pt(threeD_pt(twoD_pt(lat_N(63),long_W(30)),fl_range(fl(330),fl(330))),time(12,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(65),long_W(40)),fl_range(fl(330),fl(330))),time(13,29,0)),0.86)belongs_to profile_VIR019_1.

the_Segment(profile_VIR019_1,fourD_pt(threeD_pt(twoD_pt(lat_N(65),long_W(40)),fl_range(fl(330),fl(330))),time(13,29,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(66),long_W(50)),fl_range(fl(330),fl(330))),time(14,1,0)),0.86)belongs_to profile_VIR019_1.

the_Segment(profile_VIR019_1,fourD_pt(threeD_pt(twoD_pt(lat_N(66),long_W(50)),fl_range(fl(330),fl(330))),time(14,1,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(66),long_W(60)),fl_range(fl(330),fl(330))),time(14,32,0)),0.86)belongs_to profile_VIR019_1.

the_Aircraft_on_profile(profile_BAW2253_1,baw2253).

the_Type_of(baw2253,b747).

meets_mnps(baw2253).

the_Segment(profile_BAW2253_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(15)),fl_range(fl(340),fl(340))),time(11,36,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(340),fl(340))),time(12,3,0)),0.84)belongs_to profile_BAW2253_1.

the_Segment(profile_BAW2253_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(340),fl(340))),time(12,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(24)),fl_range(fl(340),fl(340))),time(12,27,0)),0.84)belongs_to profile_BAW2253_1.

the_Segment(profile_BAW2253_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(24)),fl_range(fl(340),fl(340))),time(12,27,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(340),fl(340))),time(13,3,0)),0.84)belongs_to profile_BAW2253_1.

the_Segment(profile_BAW2253_1,fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(340),fl(340))),time(13,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(40)),fl_range(fl(340),fl(340))),time(14,10,0)),0.84)belongs_to profile_BAW2253_1.

the_Aircraft_on_profile(profile_CKT77_1,ckt77).

the_Type_of(ckt77,b767).

meets_mnps(ckt77).

the_Segment(profile_CKT77_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48,47),long_W(12,0)),fl_range(fl(340),fl(340))),time(11,12,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(340),fl(340))),time(12,3,0)),0.8)belongs_to profile_CKT77_1.

the_Segment(profile_CKT77_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(340),fl(340))),time(12,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(30)),fl_range(fl(340),fl(340))),time(13,7,0)),0.8)belongs_to profile_CKT77_1.

the_Aircraft_on_profile(profile_KLM665_1,klm665).

the_Type_of(klm665,b747).

meets_mnps(klm665).

the_Segment(profile_KLM665_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(10)),fl_range(fl(310),fl(310))),time(11,23,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(20)),fl_range(fl(310),fl(310))),time(12,11,0)),0.85)belongs_to profile_KLM665_1.

the_Segment(profile_KLM665_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(20)),fl_range(fl(310),fl(310))),time(12,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(30)),fl_range(fl(310),fl(310))),time(12,50,0)),0.85)belongs_to profile_KLM665_1.

the_Segment(profile_KLM665_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(30)),fl_range(fl(310),fl(310))),time(12,50,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(40)),fl_range(fl(310),fl(310))),time(13,25,0)),0.85)belongs_to profile_KLM665_1.

the_Segment(profile_KLM665_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(40)),fl_range(fl(310),fl(310))),time(13,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(50)),fl_range(fl(310),fl(310))),time(14,2,0)),0.85)belongs_to profile_KLM665_1.

the_Aircraft_on_profile(profile_SAS941_1,sas941).

the_Type_of(sas941,b767).

meets_mnps(sas941).

the_Segment(profile_SAS941_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(10)),fl_range(fl(310),fl(310))),time(10,59,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(20)),fl_range(fl(310),fl(310))),time(11,47,0)),0.82)belongs_to profile_SAS941_1.

the_Segment(profile_SAS941_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(20)),fl_range(fl(310),fl(310))),time(11,47,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(30)),fl_range(fl(310),fl(310))),time(12,29,0)),0.82)belongs_to profile_SAS941_1.

the_Segment(profile_SAS941_1,fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(30)),fl_range(fl(310),fl(310))),time(12,29,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(40)),fl_range(fl(310),fl(310))),time(13,6,0)),0.82)belongs_to profile_SAS941_1.

the_Segment(profile_SAS941_1,fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(40)),fl_range(fl(310),fl(310))),time(13,6,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(50)),fl_range(fl(310),fl(310))),time(13,46,0)),0.82)belongs_to profile_SAS941_1.

the_Aircraft_on_profile(profile_VIR005_1,vir005).

the_Type_of(vir005,b747).

meets_mnps(vir005).

the_Segment(profile_VIR005_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(15)),fl_range(fl(310),fl(310))),time(11,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(310),fl(310))),time(11,46,0)),0.83)belongs_to profile_VIR005_1.

the_Segment(profile_VIR005_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(310),fl(310))),time(11,46,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(310),fl(310))),time(12,43,0)),0.83)belongs_to profile_VIR005_1.

the_Segment(profile_VIR005_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(310),fl(310))),time(12,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(310),fl(310))),time(13,43,0)),0.83)belongs_to profile_VIR005_1.

the_Segment(profile_VIR005_1,fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(310),fl(310))),time(13,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(50)),fl_range(fl(310),fl(310))),time(14,47,0)),0.83)belongs_to profile_VIR005_1.

the_Aircraft_on_profile(profile_BAW9668_1,baw9668).

the_Type_of(baw9668,dc10).

meets_mnps(baw9668).

the_Segment(profile_BAW9668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(310),fl(310))),time(11,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(11,42,0)),0.82)belongs_to profile_BAW9668_1.

the_Segment(profile_BAW9668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(11,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(12,31,0)),0.82)belongs_to profile_BAW9668_1.

the_Segment(profile_BAW9668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(12,31,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,18,0)),0.82)belongs_to profile_BAW9668_1.

the_Segment(profile_BAW9668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(310),fl(310))),time(14,3,0)),0.82)belongs_to profile_BAW9668_1.

the_Aircraft_on_profile(profile_AIH067_1,aih067).

the_Type_of(aih067,b767).

meets_mnps(aih067).

the_Segment(profile_AIH067_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(340),fl(340))),time(11,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(11,43,0)),0.8)belongs_to profile_AIH067_1.

the_Segment(profile_AIH067_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(11,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(12,34,0)),0.8)belongs_to profile_AIH067_1.

the_Segment(profile_AIH067_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(12,34,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(13,22,0)),0.8)belongs_to profile_AIH067_1.

the_Segment(profile_AIH067_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(13,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(340),fl(340))),time(14,8,0)),0.8)belongs_to profile_AIH067_1.

the_Aircraft_on_profile(profile_NWA39_1,nwa39).

the_Type_of(nwa39,dc10).

meets_mnps(nwa39).

the_Segment(profile_NWA39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(330),fl(330))),time(11,23,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(11,48,0)),0.83)belongs_to profile_NWA39_1.

the_Segment(profile_NWA39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(11,48,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,36,0)),0.83)belongs_to profile_NWA39_1.

the_Segment(profile_NWA39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,36,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(13,22,0)),0.83)belongs_to profile_NWA39_1.

the_Segment(profile_NWA39_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(13,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(330),fl(330))),time(14,7,0)),0.83)belongs_to profile_NWA39_1.

the_Aircraft_on_profile(profile_KLM611_1,klm611).

the_Type_of(klm611,b747).

meets_mnps(klm611).

the_Segment(profile_KLM611_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(10)),fl_range(fl(330),fl(330))),time(11,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(330),fl(330))),time(11,55,0)),0.85)belongs_to profile_KLM611_1.

the_Segment(profile_KLM611_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(330),fl(330))),time(11,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(330),fl(330))),time(12,39,0)),0.85)belongs_to profile_KLM611_1.

the_Segment(profile_KLM611_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(330),fl(330))),time(12,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(330),fl(330))),time(13,19,0)),0.85)belongs_to profile_KLM611_1.

the_Segment(profile_KLM611_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(330),fl(330))),time(13,19,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(50)),fl_range(fl(330),fl(330))),time(13,59,0)),0.85)belongs_to profile_KLM611_1.

the_Aircraft_on_profile(profile_COA37_1,coa37).

the_Type_of(coa37,dc10).

meets_mnps(coa37).

the_Segment(profile_COA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(310),fl(310))),time(11,31,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,54,0)),0.84)belongs_to profile_COA37_1.

the_Segment(profile_COA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(11,54,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(12,39,0)),0.84)belongs_to profile_COA37_1.

the_Segment(profile_COA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(12,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(13,24,0)),0.84)belongs_to profile_COA37_1.

the_Segment(profile_COA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(13,24,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(310),fl(310))),time(14,7,0)),0.84)belongs_to profile_COA37_1.

the_Aircraft_on_profile(profile_DAL43_1,dal43).

the_Type_of(dal43,b767).

meets_mnps(dal43).

the_Segment(profile_DAL43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(360),fl(360))),time(11,27,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(360),fl(360))),time(11,52,0)),0.81)belongs_to profile_DAL43_1.

the_Segment(profile_DAL43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(360),fl(360))),time(11,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(360),fl(360))),time(12,44,0)),0.81)belongs_to profile_DAL43_1.

the_Segment(profile_DAL43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(360),fl(360))),time(12,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(360),fl(360))),time(13,33,0)),0.81)belongs_to profile_DAL43_1.

the_Segment(profile_DAL43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(360),fl(360))),time(13,33,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(360),fl(360))),time(14,22,0)),0.81)belongs_to profile_DAL43_1.

the_Aircraft_on_profile(profile_NWA37_1,nwa37).

the_Type_of(nwa37,dc10).

meets_mnps(nwa37).

the_Segment(profile_NWA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(330),fl(330))),time(11,33,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,56,0)),0.83)belongs_to profile_NWA37_1.

the_Segment(profile_NWA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(11,56,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(12,44,0)),0.83)belongs_to profile_NWA37_1.

the_Segment(profile_NWA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(12,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(13,29,0)),0.83)belongs_to profile_NWA37_1.

the_Segment(profile_NWA37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(13,29,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(330),fl(330))),time(14,13,0)),0.83)belongs_to profile_NWA37_1.

the_Aircraft_on_profile(profile_USA27_1,usa27).

the_Type_of(usa27,b767).

meets_mnps(usa27).

the_Segment(profile_USA27_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(350),fl(350))),time(11,30,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(350),fl(350))),time(11,55,0)),0.8)belongs_to profile_USA27_1.

the_Segment(profile_USA27_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(350),fl(350))),time(11,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(350),fl(350))),time(12,47,0)),0.8)belongs_to profile_USA27_1.

the_Segment(profile_USA27_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(350),fl(350))),time(12,47,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(350),fl(350))),time(13,38,0)),0.8)belongs_to profile_USA27_1.

the_Segment(profile_USA27_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(350),fl(350))),time(13,38,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(350),fl(350))),time(14,28,0)),0.8)belongs_to profile_USA27_1.

the_Aircraft_on_profile(profile_TWA843_1,twa843).

the_Type_of(twa843,b767).

meets_mnps(twa843).

the_Segment(profile_TWA843_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47,0),long_W(8,45)),fl_range(fl(350),fl(350))),time(10,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(350),fl(350))),time(11,24,0)),0.8)belongs_to profile_TWA843_1.

the_Segment(profile_TWA843_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(350),fl(350))),time(11,24,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(50),long_W(20)),fl_range(fl(360),fl(360))),time(11,52,0)),0.8)belongs_to profile_TWA843_1.

the_Segment(profile_TWA843_1,fourD_pt(threeD_pt(twoD_pt(lat_N(50),long_W(20)),fl_range(fl(360),fl(360))),time(11,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(360),fl(360))),time(12,47,0)),0.8)belongs_to profile_TWA843_1.

the_Segment(profile_TWA843_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(360),fl(360))),time(12,47,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(360),fl(360))),time(13,43,0)),0.8)belongs_to profile_TWA843_1.

the_Segment(profile_TWA843_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(360),fl(360))),time(13,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(50)),fl_range(fl(360),fl(360))),time(14,38,0)),0.8)belongs_to profile_TWA843_1.

the_Aircraft_on_profile(profile_TOW37_1,tow37).

the_Type_of(tow37,b747).

meets_mnps(tow37).

the_Segment(profile_TOW37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(340),fl(340))),time(11,36,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(340),fl(340))),time(12,0,0)),0.84)belongs_to profile_TOW37_1.

the_Segment(profile_TOW37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(340),fl(340))),time(12,0,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(340),fl(340))),time(12,49,0)),0.84)belongs_to profile_TOW37_1.

the_Segment(profile_TOW37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(340),fl(340))),time(12,49,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(340),fl(340))),time(13,37,0)),0.84)belongs_to profile_TOW37_1.

the_Segment(profile_TOW37_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(340),fl(340))),time(13,37,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(340),fl(340))),time(14,25,0)),0.84)belongs_to profile_TOW37_1.

the_Aircraft_on_profile(profile_SAB539_1,sab539).

the_Type_of(sab539,ea34).

meets_mnps(sab539).

the_Segment(profile_SAB539_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(10)),fl_range(fl(350),fl(350))),time(11,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(350),fl(350))),time(12,6,0)),0.82)belongs_to profile_SAB539_1.

the_Segment(profile_SAB539_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(350),fl(350))),time(12,6,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(350),fl(350))),time(12,51,0)),0.82)belongs_to profile_SAB539_1.

the_Segment(profile_SAB539_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(350),fl(350))),time(12,51,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(350),fl(350))),time(13,33,0)),0.82)belongs_to profile_SAB539_1.

the_Segment(profile_SAB539_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(350),fl(350))),time(13,33,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(50)),fl_range(fl(350),fl(350))),time(14,13,0)),0.82)belongs_to profile_SAB539_1.

the_Aircraft_on_profile(profile_UAL929_1,ual929).

the_Type_of(ual929,b777).

meets_mnps(ual929).

the_Segment(profile_UAL929_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(370),fl(370))),time(11,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(370),fl(370))),time(12,5,0)),0.84)belongs_to profile_UAL929_1.

the_Segment(profile_UAL929_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(370),fl(370))),time(12,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(370),fl(370))),time(12,51,0)),0.84)belongs_to profile_UAL929_1.

the_Segment(profile_UAL929_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(370),fl(370))),time(12,51,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(370),fl(370))),time(13,32,0)),0.84)belongs_to profile_UAL929_1.

the_Segment(profile_UAL929_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(370),fl(370))),time(13,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(370),fl(370))),time(14,13,0)),0.84)belongs_to profile_UAL929_1.

the_Aircraft_on_profile(profile_MPH601_1,mph601).

the_Type_of(mph601,b767).

meets_mnps(mph601).

the_Segment(profile_MPH601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48,47),long_W(12,0)),fl_range(fl(340),fl(340))),time(11,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(340),fl(340))),time(12,1,0)),0.8)belongs_to profile_MPH601_1.

the_Segment(profile_MPH601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(340),fl(340))),time(12,1,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(340),fl(340))),time(12,26,0)),0.8)belongs_to profile_MPH601_1.

the_Segment(profile_MPH601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(340),fl(340))),time(12,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45,0),long_W(24,25)),fl_range(fl(340),fl(340))),time(12,52,0)),0.8)belongs_to profile_MPH601_1.

the_Segment(profile_MPH601_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45,0),long_W(24,25)),fl_range(fl(340),fl(340))),time(12,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(340),fl(340))),time(13,28,0)),0.8)belongs_to profile_MPH601_1.

the_Aircraft_on_profile(profile_ACA881_1,aca881).

the_Type_of(aca881,b74f).

meets_mnps(aca881).

the_Segment(profile_ACA881_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(350),fl(350))),time(11,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(12,5,0)),0.86)belongs_to profile_ACA881_1.

the_Segment(profile_ACA881_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(12,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(12,52,0)),0.86)belongs_to profile_ACA881_1.

the_Segment(profile_ACA881_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(12,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(13,36,0)),0.86)belongs_to profile_ACA881_1.

the_Segment(profile_ACA881_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(13,36,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(350),fl(350))),time(14,19,0)),0.86)belongs_to profile_ACA881_1.

the_Aircraft_on_profile(profile_ULE849_1,ule849).

the_Type_of(ule849,b767).

meets_mnps(ule849).

the_Segment(profile_ULE849_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(340),fl(340))),time(11,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(340),fl(340))),time(12,4,0)),0.8)belongs_to profile_ULE849_1.

the_Segment(profile_ULE849_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(340),fl(340))),time(12,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(340),fl(340))),time(12,54,0)),0.8)belongs_to profile_ULE849_1.

the_Segment(profile_ULE849_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(340),fl(340))),time(12,54,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(340),fl(340))),time(13,40,0)),0.8)belongs_to profile_ULE849_1.

the_Segment(profile_ULE849_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(340),fl(340))),time(13,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(340),fl(340))),time(14,26,0)),0.8)belongs_to profile_ULE849_1.

the_Aircraft_on_profile(profile_BAW2257_1,baw2257).

the_Type_of(baw2257,b747).

meets_mnps(baw2257).

the_Segment(profile_BAW2257_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48,47),long_W(12,0)),fl_range(fl(290),fl(290))),time(11,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(290),fl(290))),time(12,8,0)),0.84)belongs_to profile_BAW2257_1.

the_Segment(profile_BAW2257_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(290),fl(290))),time(12,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(290),fl(290))),time(12,32,0)),0.84)belongs_to profile_BAW2257_1.

the_Segment(profile_BAW2257_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(290),fl(290))),time(12,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(24)),fl_range(fl(290),fl(290))),time(12,55,0)),0.84)belongs_to profile_BAW2257_1.

the_Segment(profile_BAW2257_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(24)),fl_range(fl(290),fl(290))),time(12,55,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(290),fl(290))),time(13,31,0)),0.84)belongs_to profile_BAW2257_1.

the_Aircraft_on_profile(profile_COA25_1,coa25).

the_Type_of(coa25,dc10).

meets_mnps(coa25).

the_Segment(profile_COA25_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(310),fl(310))),time(11,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(12,9,0)),0.83)belongs_to profile_COA25_1.

the_Segment(profile_COA25_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(12,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(12,57,0)),0.83)belongs_to profile_COA25_1.

the_Segment(profile_COA25_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(12,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,43,0)),0.83)belongs_to profile_COA25_1.

the_Segment(profile_COA25_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(310),fl(310))),time(14,28,0)),0.83)belongs_to profile_COA25_1.

the_Aircraft_on_profile(profile_BBC009_1,bbc009).

the_Type_of(bbc009,dc10).

the_Segment(profile_BBC009_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(330),fl(330))),time(11,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(12,9,0)),0.83)belongs_to profile_BBC009_1.

the_Segment(profile_BBC009_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(12,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,58,0)),0.83)belongs_to profile_BBC009_1.

the_Segment(profile_BBC009_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(12,58,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(13,44,0)),0.83)belongs_to profile_BBC009_1.

the_Segment(profile_BBC009_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(13,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(330),fl(330))),time(14,29,0)),0.83)belongs_to profile_BBC009_1.

the_Aircraft_on_profile(profile_UAL953_1,ual953).

the_Type_of(ual953,b767).

meets_mnps(ual953).

the_Segment(profile_UAL953_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(10)),fl_range(fl(360),fl(360))),time(11,20,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(360),fl(360))),time(12,11,0)),0.8)belongs_to profile_UAL953_1.

the_Segment(profile_UAL953_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(360),fl(360))),time(12,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(360),fl(360))),time(12,58,0)),0.8)belongs_to profile_UAL953_1.

the_Segment(profile_UAL953_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(360),fl(360))),time(12,58,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(360),fl(360))),time(13,40,0)),0.8)belongs_to profile_UAL953_1.

the_Segment(profile_UAL953_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(360),fl(360))),time(13,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(50)),fl_range(fl(360),fl(360))),time(14,22,0)),0.8)belongs_to profile_UAL953_1.

the_Aircraft_on_profile(profile_AAL173_1,aal173).

the_Type_of(aal173,b767).

meets_mnps(aal173).

the_Segment(profile_AAL173_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(350),fl(350))),time(11,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(350),fl(350))),time(12,7,0)),0.8)belongs_to profile_AAL173_1.

the_Segment(profile_AAL173_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(350),fl(350))),time(12,7,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(350),fl(350))),time(12,59,0)),0.8)belongs_to profile_AAL173_1.

the_Segment(profile_AAL173_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(350),fl(350))),time(12,59,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(350),fl(350))),time(13,50,0)),0.8)belongs_to profile_AAL173_1.

the_Segment(profile_AAL173_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(350),fl(350))),time(13,50,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(350),fl(350))),time(14,40,0)),0.8)belongs_to profile_AAL173_1.

the_Aircraft_on_profile(profile_DAL15_1,dal15).

the_Type_of(dal15,md11).

meets_mnps(dal15).

the_Segment(profile_DAL15_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(330),fl(330))),time(11,34,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(12,13,0)),0.83)belongs_to profile_DAL15_1.

the_Segment(profile_DAL15_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(12,13,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(12,59,0)),0.83)belongs_to profile_DAL15_1.

the_Segment(profile_DAL15_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(12,59,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(13,42,0)),0.83)belongs_to profile_DAL15_1.

the_Segment(profile_DAL15_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(13,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(330),fl(330))),time(14,23,0)),0.83)belongs_to profile_DAL15_1.

the_Aircraft_on_profile(profile_ACA871_1,aca871).

the_Type_of(aca871,b747).

meets_mnps(aca871).

the_Segment(profile_ACA871_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(340),fl(340))),time(11,47,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(12,11,0)),0.84)belongs_to profile_ACA871_1.

the_Segment(profile_ACA871_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(12,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(12,59,0)),0.84)belongs_to profile_ACA871_1.

the_Segment(profile_ACA871_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(12,59,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(13,44,0)),0.84)belongs_to profile_ACA871_1.

the_Segment(profile_ACA871_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(13,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(340),fl(340))),time(14,29,0)),0.84)belongs_to profile_ACA871_1.

the_Aircraft_on_profile(profile_USA11_1,usa11).

the_Type_of(usa11,b767).

meets_mnps(usa11).

the_Segment(profile_USA11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44,30),long_W(13,0)),fl_range(fl(370),fl(370))),time(11,29,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(20)),fl_range(fl(370),fl(370))),time(12,6,0)),0.8)belongs_to profile_USA11_1.

the_Segment(profile_USA11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(20)),fl_range(fl(370),fl(370))),time(12,6,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(30)),fl_range(fl(370),fl(370))),time(13,0,0)),0.8)belongs_to profile_USA11_1.

the_Segment(profile_USA11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(30)),fl_range(fl(370),fl(370))),time(13,0,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(40)),fl_range(fl(370),fl(370))),time(14,3,0)),0.8)belongs_to profile_USA11_1.

the_Segment(profile_USA11_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(40)),fl_range(fl(370),fl(370))),time(14,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(50)),fl_range(fl(370),fl(370))),time(15,10,0)),0.8)belongs_to profile_USA11_1.

the_Aircraft_on_profile(profile_CDN45_1,cdn45).

the_Type_of(cdn45,b767).

meets_mnps(cdn45).

the_Segment(profile_CDN45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(340),fl(340))),time(11,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(340),fl(340))),time(12,10,0)),0.8)belongs_to profile_CDN45_1.

the_Segment(profile_CDN45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(340),fl(340))),time(12,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(340),fl(340))),time(13,2,0)),0.8)belongs_to profile_CDN45_1.

the_Segment(profile_CDN45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(340),fl(340))),time(13,2,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(340),fl(340))),time(13,53,0)),0.8)belongs_to profile_CDN45_1.

the_Segment(profile_CDN45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(340),fl(340))),time(13,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(340),fl(340))),time(14,43,0)),0.8)belongs_to profile_CDN45_1.

the_Aircraft_on_profile(profile_CFG144_1,cfg144).

the_Type_of(cfg144,b767).

meets_mnps(cfg144).

the_Segment(profile_CFG144_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47,0),long_W(8,45)),fl_range(fl(330),fl(330))),time(11,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(330),fl(330))),time(12,42,0)),0.8)belongs_to profile_CFG144_1.

the_Segment(profile_CFG144_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(330),fl(330))),time(12,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(41),long_W(30)),fl_range(fl(330),fl(330))),time(13,42,0)),0.8)belongs_to profile_CFG144_1.

the_Segment(profile_CFG144_1,fourD_pt(threeD_pt(twoD_pt(lat_N(41),long_W(30)),fl_range(fl(330),fl(330))),time(13,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(37),long_W(40)),fl_range(fl(330),fl(330))),time(14,45,0)),0.8)belongs_to profile_CFG144_1.

the_Aircraft_on_profile(profile_NWA43_1,nwa43).

the_Type_of(nwa43,dc10).

meets_mnps(nwa43).

the_Segment(profile_NWA43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(10)),fl_range(fl(310),fl(310))),time(11,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(330),fl(330))),time(12,19,0)),0.83)belongs_to profile_NWA43_1.

the_Segment(profile_NWA43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(20)),fl_range(fl(330),fl(330))),time(12,19,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(330),fl(330))),time(13,3,0)),0.83)belongs_to profile_NWA43_1.

the_Segment(profile_NWA43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(30)),fl_range(fl(330),fl(330))),time(13,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(330),fl(330))),time(13,44,0)),0.83)belongs_to profile_NWA43_1.

the_Segment(profile_NWA43_1,fourD_pt(threeD_pt(twoD_pt(lat_N(60),long_W(40)),fl_range(fl(330),fl(330))),time(13,44,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(50)),fl_range(fl(330),fl(330))),time(14,25,0)),0.83)belongs_to profile_NWA43_1.

the_Aircraft_on_profile(profile_XBSOL_1,xbsol).

the_Type_of(xbsol,da50).

meets_mnps(xbsol).

the_Segment(profile_XBSOL_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(40)),fl_range(fl(390),fl(390))),time(11,51,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(30)),fl_range(fl(390),fl(390))),time(12,40,0)),0.78)belongs_to profile_XBSOL_1.

the_Segment(profile_XBSOL_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(30)),fl_range(fl(390),fl(390))),time(12,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(43),long_W(20)),fl_range(fl(390),fl(390))),time(13,43,0)),0.78)belongs_to profile_XBSOL_1.

the_Aircraft_on_profile(profile_OEIMI_1,oeimi).

the_Type_of(oeimi,da90).

meets_mnps(oeimi).

the_Segment(profile_OEIMI_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(390),fl(390))),time(11,45,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(390),fl(390))),time(12,11,0)),0.8)belongs_to profile_OEIMI_1.

the_Segment(profile_OEIMI_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(390),fl(390))),time(12,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(390),fl(390))),time(13,3,0)),0.8)belongs_to profile_OEIMI_1.

the_Segment(profile_OEIMI_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(390),fl(390))),time(13,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(390),fl(390))),time(13,49,0)),0.8)belongs_to profile_OEIMI_1.

the_Segment(profile_OEIMI_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(390),fl(390))),time(13,49,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(390),fl(390))),time(14,35,0)),0.8)belongs_to profile_OEIMI_1.

the_Aircraft_on_profile(profile_BAW115_1,baw115).

the_Type_of(baw115,b777).

meets_mnps(baw115).

the_Segment(profile_BAW115_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(370),fl(370))),time(11,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(370),fl(370))),time(12,17,0)),0.84)belongs_to profile_BAW115_1.

the_Segment(profile_BAW115_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(370),fl(370))),time(12,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(370),fl(370))),time(13,4,0)),0.84)belongs_to profile_BAW115_1.

the_Segment(profile_BAW115_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(370),fl(370))),time(13,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(370),fl(370))),time(13,47,0)),0.84)belongs_to profile_BAW115_1.

the_Segment(profile_BAW115_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(370),fl(370))),time(13,47,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(370),fl(370))),time(14,30,0)),0.84)belongs_to profile_BAW115_1.

the_Aircraft_on_profile(profile_UAL943_1,ual943).

the_Type_of(ual943,b777).

meets_mnps(ual943).

the_Segment(profile_UAL943_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(360),fl(360))),time(11,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(12,17,0)),0.84)belongs_to profile_UAL943_1.

the_Segment(profile_UAL943_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(12,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(13,5,0)),0.84)belongs_to profile_UAL943_1.

the_Segment(profile_UAL943_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(13,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(13,50,0)),0.84)belongs_to profile_UAL943_1.

the_Segment(profile_UAL943_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(13,50,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(360),fl(360))),time(14,34,0)),0.84)belongs_to profile_UAL943_1.

the_Aircraft_on_profile(profile_AIH063_1,aih063).

the_Type_of(aih063,b767).

meets_mnps(aih063).

the_Segment(profile_AIH063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(350),fl(350))),time(11,54,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(350),fl(350))),time(12,18,0)),0.8)belongs_to profile_AIH063_1.

the_Segment(profile_AIH063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(350),fl(350))),time(12,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(350),fl(350))),time(13,8,0)),0.8)belongs_to profile_AIH063_1.

the_Segment(profile_AIH063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(350),fl(350))),time(13,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(350),fl(350))),time(13,54,0)),0.8)belongs_to profile_AIH063_1.

the_Segment(profile_AIH063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(350),fl(350))),time(13,54,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(350),fl(350))),time(14,39,0)),0.8)belongs_to profile_AIH063_1.

the_Aircraft_on_profile(profile_FDX6_1,fdx6).

the_Type_of(fdx6,md11).

meets_mnps(fdx6).

the_Segment(profile_FDX6_1,fourD_pt(threeD_pt(twoD_pt(lat_N(51),long_W(40)),fl_range(fl(290),fl(290))),time(11,31,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(30)),fl_range(fl(290),fl(290))),time(12,14,0)),0.83)belongs_to profile_FDX6_1.

the_Segment(profile_FDX6_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(30)),fl_range(fl(290),fl(290))),time(12,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(290),fl(290))),time(12,53,0)),0.83)belongs_to profile_FDX6_1.

the_Segment(profile_FDX6_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(290),fl(290))),time(12,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(10)),fl_range(fl(290),fl(290))),time(13,31,0)),0.83)belongs_to profile_FDX6_1.

the_Aircraft_on_profile(profile_RATS69_1,rats69).

the_Type_of(rats69,c135).

meets_mnps(rats69).

the_Segment(profile_RATS69_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(390),fl(390))),time(11,56,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(390),fl(390))),time(12,22,0)),0.8)belongs_to profile_RATS69_1.

the_Segment(profile_RATS69_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(390),fl(390))),time(12,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(390),fl(390))),time(13,11,0)),0.8)belongs_to profile_RATS69_1.

the_Segment(profile_RATS69_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(390),fl(390))),time(13,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(390),fl(390))),time(13,57,0)),0.8)belongs_to profile_RATS69_1.

the_Segment(profile_RATS69_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(390),fl(390))),time(13,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(390),fl(390))),time(14,42,0)),0.8)belongs_to profile_RATS69_1.

the_Aircraft_on_profile(profile_RRR2668_1,rrr2668).

the_Type_of(rrr2668,vc10).

meets_mnps(rrr2668).

the_Segment(profile_RRR2668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(280),fl(280))),time(11,54,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(20)),fl_range(fl(280),fl(280))),time(12,19,0)),0.75)belongs_to profile_RRR2668_1.

the_Segment(profile_RRR2668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(20)),fl_range(fl(280),fl(280))),time(12,19,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(30)),fl_range(fl(280),fl(280))),time(13,13,0)),0.75)belongs_to profile_RRR2668_1.

the_Segment(profile_RRR2668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(30)),fl_range(fl(280),fl(280))),time(13,13,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(280),fl(280))),time(14,11,0)),0.75)belongs_to profile_RRR2668_1.

the_Segment(profile_RRR2668_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(280),fl(280))),time(14,11,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(51),long_W(50)),fl_range(fl(280),fl(280))),time(15,15,0)),0.75)belongs_to profile_RRR2668_1.

the_Aircraft_on_profile(profile_DAL81_1,dal81).

the_Type_of(dal81,l101).

meets_mnps(dal81).

the_Segment(profile_DAL81_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(310),fl(310))),time(11,59,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(12,24,0)),0.83)belongs_to profile_DAL81_1.

the_Segment(profile_DAL81_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(310),fl(310))),time(12,24,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(13,13,0)),0.83)belongs_to profile_DAL81_1.

the_Segment(profile_DAL81_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(310),fl(310))),time(13,13,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,59,0)),0.83)belongs_to profile_DAL81_1.

the_Segment(profile_DAL81_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(310),fl(310))),time(13,59,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(310),fl(310))),time(14,44,0)),0.83)belongs_to profile_DAL81_1.

the_Aircraft_on_profile(profile_VIR024_1,vir024).

the_Type_of(vir024,ea34).

meets_mnps(vir024).

the_Segment(profile_VIR024_1,fourD_pt(threeD_pt(twoD_pt(lat_N(62),long_W(30)),fl_range(fl(370),fl(370))),time(12,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(20)),fl_range(fl(370),fl(370))),time(12,48,0)),0.82)belongs_to profile_VIR024_1.

the_Segment(profile_VIR024_1,fourD_pt(threeD_pt(twoD_pt(lat_N(61),long_W(20)),fl_range(fl(370),fl(370))),time(12,48,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(10)),fl_range(fl(370),fl(370))),time(13,33,0)),0.82)belongs_to profile_VIR024_1.

the_Aircraft_on_profile(profile_DAL33_1,dal33).

the_Type_of(dal33,b767).

meets_mnps(dal33).

the_Segment(profile_DAL33_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(310),fl(310))),time(12,1,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(12,26,0)),0.81)belongs_to profile_DAL33_1.

the_Segment(profile_DAL33_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(310),fl(310))),time(12,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(13,14,0)),0.81)belongs_to profile_DAL33_1.

the_Segment(profile_DAL33_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(310),fl(310))),time(13,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(14,1,0)),0.81)belongs_to profile_DAL33_1.

the_Segment(profile_DAL33_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(310),fl(310))),time(14,1,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(310),fl(310))),time(14,46,0)),0.81)belongs_to profile_DAL33_1.

the_Aircraft_on_profile(profile_GAF411_1,gaf411).

the_Type_of(gaf411,cl60).

meets_mnps(gaf411).

the_Segment(profile_GAF411_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(390),fl(390))),time(11,52,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(390),fl(390))),time(12,19,0)),0.74)belongs_to profile_GAF411_1.

the_Segment(profile_GAF411_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(390),fl(390))),time(12,19,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(390),fl(390))),time(13,15,0)),0.74)belongs_to profile_GAF411_1.

the_Segment(profile_GAF411_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(390),fl(390))),time(13,15,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(390),fl(390))),time(14,9,0)),0.74)belongs_to profile_GAF411_1.

the_Segment(profile_GAF411_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(390),fl(390))),time(14,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(390),fl(390))),time(15,2,0)),0.74)belongs_to profile_GAF411_1.

the_Aircraft_on_profile(profile_AAL45_1,aal45).

the_Type_of(aal45,b767).

meets_mnps(aal45).

the_Segment(profile_AAL45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(350),fl(350))),time(12,0,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(12,25,0)),0.8)belongs_to profile_AAL45_1.

the_Segment(profile_AAL45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(350),fl(350))),time(12,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(13,16,0)),0.8)belongs_to profile_AAL45_1.

the_Segment(profile_AAL45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(350),fl(350))),time(13,16,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(14,4,0)),0.8)belongs_to profile_AAL45_1.

the_Segment(profile_AAL45_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(350),fl(350))),time(14,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(350),fl(350))),time(14,50,0)),0.8)belongs_to profile_AAL45_1.

the_Aircraft_on_profile(profile_AAL57_1,aal57).

the_Type_of(aal57,md11).

meets_mnps(aal57).

the_Segment(profile_AAL57_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48,47),long_W(12,0)),fl_range(fl(340),fl(340))),time(12,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(340),fl(340))),time(12,21,0)),0.84)belongs_to profile_AAL57_1.

the_Segment(profile_AAL57_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(15)),fl_range(fl(340),fl(340))),time(12,21,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(340),fl(340))),time(12,46,0)),0.84)belongs_to profile_AAL57_1.

the_Segment(profile_AAL57_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(20)),fl_range(fl(340),fl(340))),time(12,46,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(43),long_W(30)),fl_range(fl(340),fl(340))),time(13,43,0)),0.84)belongs_to profile_AAL57_1.

the_Segment(profile_AAL57_1,fourD_pt(threeD_pt(twoD_pt(lat_N(43),long_W(30)),fl_range(fl(340),fl(340))),time(13,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(41),long_W(40)),fl_range(fl(340),fl(340))),time(14,39,0)),0.84)belongs_to profile_AAL57_1.

the_Aircraft_on_profile(profile_COA49_1,coa49).

the_Type_of(coa49,dc10).

meets_mnps(coa49).

the_Segment(profile_COA49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(310),fl(310))),time(11,53,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(12,31,0)),0.84)belongs_to profile_COA49_1.

the_Segment(profile_COA49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(12,31,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(13,16,0)),0.84)belongs_to profile_COA49_1.

the_Segment(profile_COA49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(13,16,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(13,58,0)),0.84)belongs_to profile_COA49_1.

the_Segment(profile_COA49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(13,58,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(310),fl(310))),time(14,39,0)),0.84)belongs_to profile_COA49_1.

the_Aircraft_on_profile(profile_WITCH92_1,witch92).

the_Type_of(witch92,c130).

the_Segment(profile_WITCH92_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,13),long_W(13,0)),fl_range(fl(180),fl(180))),time(10,57,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(180),fl(180))),time(11,56,0)),2.8)belongs_to profile_WITCH92_1.

the_Segment(profile_WITCH92_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(180),fl(180))),time(11,56,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(25)),fl_range(fl(180),fl(180))),time(12,38,0)),2.8)belongs_to profile_WITCH92_1.

the_Segment(profile_WITCH92_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(25)),fl_range(fl(180),fl(180))),time(12,38,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(180),fl(180))),time(13,18,0)),2.8)belongs_to profile_WITCH92_1.

the_Segment(profile_WITCH92_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(180),fl(180))),time(13,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(180),fl(180))),time(14,43,0)),2.8)belongs_to profile_WITCH92_1.

the_Segment(profile_WITCH92_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(180),fl(180))),time(14,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(50)),fl_range(fl(180),fl(180))),time(16,37,0)),2.8)belongs_to profile_WITCH92_1.

the_Aircraft_on_profile(profile_UAL925_1,ual925).

the_Type_of(ual925,b767).

meets_mnps(ual925).

the_Segment(profile_UAL925_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(370),fl(370))),time(12,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(370),fl(370))),time(12,28,0)),0.8)belongs_to profile_UAL925_1.

the_Segment(profile_UAL925_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(370),fl(370))),time(12,28,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(370),fl(370))),time(13,18,0)),0.8)belongs_to profile_UAL925_1.

the_Segment(profile_UAL925_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(370),fl(370))),time(13,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(370),fl(370))),time(14,4,0)),0.8)belongs_to profile_UAL925_1.

the_Segment(profile_UAL925_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(370),fl(370))),time(14,4,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(370),fl(370))),time(14,49,0)),0.8)belongs_to profile_UAL925_1.

the_Aircraft_on_profile(profile_BAW175_1,baw175).

the_Type_of(baw175,b747).

meets_mnps(baw175).

the_Segment(profile_BAW175_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(330),fl(330))),time(12,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(12,29,0)),0.84)belongs_to profile_BAW175_1.

the_Segment(profile_BAW175_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(340),fl(340))),time(12,29,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(13,18,0)),0.84)belongs_to profile_BAW175_1.

the_Segment(profile_BAW175_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(340),fl(340))),time(13,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(14,3,0)),0.84)belongs_to profile_BAW175_1.

the_Segment(profile_BAW175_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(340),fl(340))),time(14,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(340),fl(340))),time(14,47,0)),0.84)belongs_to profile_BAW175_1.

the_Aircraft_on_profile(profile_EIN105_1,ein105).

the_Type_of(ein105,ea33).

meets_mnps(ein105).

the_Segment(profile_EIN105_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(350),fl(350))),time(11,51,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(350),fl(350))),time(12,31,0)),0.81)belongs_to profile_EIN105_1.

the_Segment(profile_EIN105_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(350),fl(350))),time(12,31,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(350),fl(350))),time(13,19,0)),0.81)belongs_to profile_EIN105_1.

the_Segment(profile_EIN105_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(350),fl(350))),time(13,19,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(350),fl(350))),time(14,2,0)),0.81)belongs_to profile_EIN105_1.

the_Segment(profile_EIN105_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(350),fl(350))),time(14,2,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(350),fl(350))),time(14,45,0)),0.81)belongs_to profile_EIN105_1.

the_Aircraft_on_profile(profile_N462QS_1,n462qs).

the_Type_of(n462qs,g4).

meets_mnps(n462qs).

the_Segment(profile_N462QS_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(390),fl(390))),time(11,58,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(410),fl(410))),time(12,25,0)),0.77)belongs_to profile_N462QS_1.

the_Segment(profile_N462QS_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(410),fl(410))),time(12,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(410),fl(410))),time(13,21,0)),0.77)belongs_to profile_N462QS_1.

the_Segment(profile_N462QS_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(410),fl(410))),time(13,21,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(410),fl(410))),time(14,9,0)),0.77)belongs_to profile_N462QS_1.

the_Segment(profile_N462QS_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(410),fl(410))),time(14,9,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(410),fl(410))),time(14,58,0)),0.77)belongs_to profile_N462QS_1.

the_Aircraft_on_profile(profile_USA781_1,usa781).

the_Type_of(usa781,b767).

meets_mnps(usa781).

the_Segment(profile_USA781_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(360),fl(360))),time(12,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(12,30,0)),0.8)belongs_to profile_USA781_1.

the_Segment(profile_USA781_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(360),fl(360))),time(12,30,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(13,22,0)),0.8)belongs_to profile_USA781_1.

the_Segment(profile_USA781_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(360),fl(360))),time(13,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(14,10,0)),0.8)belongs_to profile_USA781_1.

the_Segment(profile_USA781_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(360),fl(360))),time(14,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(360),fl(360))),time(14,56,0)),0.8)belongs_to profile_USA781_1.

the_Aircraft_on_profile(profile_XAVTO_1,xavto).

the_Type_of(xavto,da90).

meets_mnps(xavto).

the_Segment(profile_XAVTO_1,fourD_pt(threeD_pt(twoD_pt(lat_N(51),long_W(15)),fl_range(fl(390),fl(390))),time(12,2,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(20)),fl_range(fl(390),fl(390))),time(12,29,0)),0.8)belongs_to profile_XAVTO_1.

the_Segment(profile_XAVTO_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(20)),fl_range(fl(390),fl(390))),time(12,29,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(30)),fl_range(fl(390),fl(390))),time(13,22,0)),0.8)belongs_to profile_XAVTO_1.

the_Segment(profile_XAVTO_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(30)),fl_range(fl(390),fl(390))),time(13,22,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(390),fl(390))),time(14,16,0)),0.8)belongs_to profile_XAVTO_1.

the_Segment(profile_XAVTO_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(390),fl(390))),time(14,16,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(51),long_W(50)),fl_range(fl(390),fl(390))),time(15,15,0)),0.8)belongs_to profile_XAVTO_1.

the_Aircraft_on_profile(profile_N663PD_1,n663pd).

the_Type_of(n663pd,g2).

meets_mnps(n663pd).

the_Segment(profile_N663PD_1,fourD_pt(threeD_pt(twoD_pt(lat_N(51),long_W(40)),fl_range(fl(410),fl(410))),time(12,0,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(410),fl(410))),time(12,42,0)),0.83)belongs_to profile_N663PD_1.

the_Segment(profile_N663PD_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(410),fl(410))),time(12,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(410),fl(410))),time(13,23,0)),0.83)belongs_to profile_N663PD_1.

the_Segment(profile_N663PD_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(410),fl(410))),time(13,23,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(410),fl(410))),time(13,44,0)),0.83)belongs_to profile_N663PD_1.

the_Aircraft_on_profile(profile_DAL49_1,dal49).

the_Type_of(dal49,md11).

meets_mnps(dal49).

the_Segment(profile_DAL49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(330),fl(330))),time(12,0,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(12,39,0)),0.83)belongs_to profile_DAL49_1.

the_Segment(profile_DAL49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(330),fl(330))),time(12,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(13,25,0)),0.83)belongs_to profile_DAL49_1.

the_Segment(profile_DAL49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(330),fl(330))),time(13,25,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(14,8,0)),0.83)belongs_to profile_DAL49_1.

the_Segment(profile_DAL49_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(330),fl(330))),time(14,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(330),fl(330))),time(14,49,0)),0.83)belongs_to profile_DAL49_1.

the_Aircraft_on_profile(profile_AIH065_1,aih065).

the_Type_of(aih065,b767).

meets_mnps(aih065).

the_Segment(profile_AIH065_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48,47),long_W(12,0)),fl_range(fl(340),fl(340))),time(12,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(15)),fl_range(fl(340),fl(340))),time(12,39,0)),0.8)belongs_to profile_AIH065_1.

the_Segment(profile_AIH065_1,fourD_pt(threeD_pt(twoD_pt(lat_N(47),long_W(15)),fl_range(fl(340),fl(340))),time(12,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(20)),fl_range(fl(340),fl(340))),time(13,5,0)),0.8)belongs_to profile_AIH065_1.

the_Segment(profile_AIH065_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(20)),fl_range(fl(340),fl(340))),time(13,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(340),fl(340))),time(14,5,0)),0.8)belongs_to profile_AIH065_1.

the_Segment(profile_AIH065_1,fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(340),fl(340))),time(14,5,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(38),long_W(40)),fl_range(fl(340),fl(340))),time(15,7,0)),0.8)belongs_to profile_AIH065_1.

the_Aircraft_on_profile(profile_DAL141_1,dal141).

the_Type_of(dal141,l101).

meets_mnps(dal141).

the_Segment(profile_DAL141_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54,20),long_W(12,0)),fl_range(fl(310),fl(310))),time(12,3,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(12,41,0)),0.84)belongs_to profile_DAL141_1.

the_Segment(profile_DAL141_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(20)),fl_range(fl(310),fl(310))),time(12,41,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(13,26,0)),0.84)belongs_to profile_DAL141_1.

the_Segment(profile_DAL141_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(30)),fl_range(fl(310),fl(310))),time(13,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(14,8,0)),0.84)belongs_to profile_DAL141_1.

the_Segment(profile_DAL141_1,fourD_pt(threeD_pt(twoD_pt(lat_N(59),long_W(40)),fl_range(fl(310),fl(310))),time(14,8,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(50)),fl_range(fl(310),fl(310))),time(14,49,0)),0.84)belongs_to profile_DAL141_1.

the_Aircraft_on_profile(profile_AMX030_1,amx030).

the_Type_of(amx030,b767).

meets_mnps(amx030).

the_Segment(profile_AMX030_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(15)),fl_range(fl(310),fl(310))),time(12,15,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(310),fl(310))),time(12,41,0)),0.8)belongs_to profile_AMX030_1.

the_Segment(profile_AMX030_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48),long_W(20)),fl_range(fl(310),fl(310))),time(12,41,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(310),fl(310))),time(13,40,0)),0.8)belongs_to profile_AMX030_1.

the_Segment(profile_AMX030_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(310),fl(310))),time(13,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(310),fl(310))),time(14,43,0)),0.8)belongs_to profile_AMX030_1.

the_Segment(profile_AMX030_1,fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(310),fl(310))),time(14,43,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(50)),fl_range(fl(310),fl(310))),time(15,48,0)),0.8)belongs_to profile_AMX030_1.

the_Aircraft_on_profile(profile_AJM002_1,ajm002).

the_Type_of(ajm002,ea31).

meets_mnps(ajm002).

the_Segment(profile_AJM002_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(15)),fl_range(fl(290),fl(290))),time(12,12,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(20)),fl_range(fl(290),fl(290))),time(12,36,0)),0.8)belongs_to profile_AJM002_1.

the_Segment(profile_AJM002_1,fourD_pt(threeD_pt(twoD_pt(lat_N(49),long_W(20)),fl_range(fl(290),fl(290))),time(12,36,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(290),fl(290))),time(13,39,0)),0.8)belongs_to profile_AJM002_1.

the_Segment(profile_AJM002_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44),long_W(30)),fl_range(fl(290),fl(290))),time(13,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(290),fl(290))),time(14,41,0)),0.8)belongs_to profile_AJM002_1.

the_Segment(profile_AJM002_1,fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(40)),fl_range(fl(290),fl(290))),time(14,41,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(36),long_W(50)),fl_range(fl(290),fl(290))),time(15,46,0)),0.8)belongs_to profile_AJM002_1.

the_Aircraft_on_profile(profile_VIR011_1,vir011).

the_Type_of(vir011,b747).

meets_mnps(vir011).

the_Segment(profile_VIR011_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(15)),fl_range(fl(330),fl(330))),time(12,15,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(330),fl(330))),time(12,39,0)),0.86)belongs_to profile_VIR011_1.

the_Segment(profile_VIR011_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(20)),fl_range(fl(330),fl(330))),time(12,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(330),fl(330))),time(13,27,0)),0.86)belongs_to profile_VIR011_1.

the_Segment(profile_VIR011_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(30)),fl_range(fl(330),fl(330))),time(13,27,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(330),fl(330))),time(14,14,0)),0.86)belongs_to profile_VIR011_1.

the_Segment(profile_VIR011_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(40)),fl_range(fl(330),fl(330))),time(14,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(50)),fl_range(fl(330),fl(330))),time(15,0,0)),0.86)belongs_to profile_VIR011_1.

the_Aircraft_on_profile(profile_LDA6868_1,lda6868).

the_Type_of(lda6868,b767).

meets_mnps(lda6868).

the_Segment(profile_LDA6868_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46,0),long_W(8,45)),fl_range(fl(310),fl(310))),time(12,15,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(15)),fl_range(fl(330),fl(330))),time(12,47,0)),0.8)belongs_to profile_LDA6868_1.

the_Segment(profile_LDA6868_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(15)),fl_range(fl(330),fl(330))),time(12,47,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(330),fl(330))),time(13,13,0)),0.8)belongs_to profile_LDA6868_1.

the_Segment(profile_LDA6868_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(330),fl(330))),time(13,13,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(330),fl(330))),time(14,10,0)),0.8)belongs_to profile_LDA6868_1.

the_Segment(profile_LDA6868_1,fourD_pt(threeD_pt(twoD_pt(lat_N(42),long_W(30)),fl_range(fl(330),fl(330))),time(14,10,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(39),long_W(40)),fl_range(fl(330),fl(330))),time(15,10,0)),0.8)belongs_to profile_LDA6868_1.

the_Aircraft_on_profile(profile_BAW9696_1,baw9696).

the_Type_of(baw9696,b767).

meets_mnps(baw9696).

the_Segment(profile_BAW9696_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(15)),fl_range(fl(330),fl(330))),time(12,13,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(12,39,0)),0.8)belongs_to profile_BAW9696_1.

the_Segment(profile_BAW9696_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(20)),fl_range(fl(330),fl(330))),time(12,39,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(13,30,0)),0.8)belongs_to profile_BAW9696_1.

the_Segment(profile_BAW9696_1,fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(30)),fl_range(fl(330),fl(330))),time(13,30,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(14,17,0)),0.8)belongs_to profile_BAW9696_1.

the_Segment(profile_BAW9696_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(40)),fl_range(fl(330),fl(330))),time(14,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(56),long_W(50)),fl_range(fl(330),fl(330))),time(15,4,0)),0.8)belongs_to profile_BAW9696_1.

the_Aircraft_on_profile(profile_DAL147_1,dal147).

the_Type_of(dal147,b767).

meets_mnps(dal147).

the_Segment(profile_DAL147_1,fourD_pt(threeD_pt(twoD_pt(lat_N(54),long_W(15)),fl_range(fl(330),fl(330))),time(12,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(12,42,0)),0.81)belongs_to profile_DAL147_1.

the_Segment(profile_DAL147_1,fourD_pt(threeD_pt(twoD_pt(lat_N(55),long_W(20)),fl_range(fl(330),fl(330))),time(12,42,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(13,32,0)),0.81)belongs_to profile_DAL147_1.

the_Segment(profile_DAL147_1,fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(30)),fl_range(fl(330),fl(330))),time(13,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(14,18,0)),0.81)belongs_to profile_DAL147_1.

the_Segment(profile_DAL147_1,fourD_pt(threeD_pt(twoD_pt(lat_N(58),long_W(40)),fl_range(fl(330),fl(330))),time(14,18,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(57),long_W(50)),fl_range(fl(330),fl(330))),time(15,3,0)),0.81)belongs_to profile_DAL147_1.

the_Aircraft_on_profile(profile_TWA841_1,twa841).

the_Type_of(twa841,b747).

meets_mnps(twa841).

the_Segment(profile_TWA841_1,fourD_pt(threeD_pt(twoD_pt(lat_N(50),long_W(15)),fl_range(fl(340),fl(340))),time(12,17,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(50),long_W(20)),fl_range(fl(340),fl(340))),time(12,40,0)),0.84)belongs_to profile_TWA841_1.

the_Segment(profile_TWA841_1,fourD_pt(threeD_pt(twoD_pt(lat_N(50),long_W(20)),fl_range(fl(340),fl(340))),time(12,40,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(340),fl(340))),time(13,32,0)),0.84)belongs_to profile_TWA841_1.

the_Segment(profile_TWA841_1,fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(30)),fl_range(fl(340),fl(340))),time(13,32,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(340),fl(340))),time(14,26,0)),0.84)belongs_to profile_TWA841_1.

the_Segment(profile_TWA841_1,fourD_pt(threeD_pt(twoD_pt(lat_N(53),long_W(40)),fl_range(fl(340),fl(340))),time(14,26,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(52),long_W(50)),fl_range(fl(340),fl(340))),time(15,18,0)),0.84)belongs_to profile_TWA841_1.

the_Aircraft_on_profile(profile_COA063_1,coa063).

the_Type_of(coa063,dc10).

meets_mnps(coa063).

the_Segment(profile_COA063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(44,30),long_W(13,0)),fl_range(fl(280),fl(280))),time(12,6,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(280),fl(280))),time(12,41,0)),0.84)belongs_to profile_COA063_1.

the_Segment(profile_COA063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(280),fl(280))),time(12,41,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(30)),fl_range(fl(280),fl(280))),time(13,33,0)),0.84)belongs_to profile_COA063_1.

the_Segment(profile_COA063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(30)),fl_range(fl(280),fl(280))),time(13,33,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(40)),fl_range(fl(280),fl(280))),time(14,30,0)),0.84)belongs_to profile_COA063_1.

the_Segment(profile_COA063_1,fourD_pt(threeD_pt(twoD_pt(lat_N(46),long_W(40)),fl_range(fl(280),fl(280))),time(14,30,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(50)),fl_range(fl(280),fl(280))),time(15,28,0)),0.84)belongs_to profile_COA063_1.

the_Aircraft_on_profile(profile_AOM427_1,aom427).

the_Type_of(aom427,dc10).

meets_mnps(aom427).

the_Segment(profile_AOM427_1,fourD_pt(threeD_pt(twoD_pt(lat_N(48,0),long_W(8,45)),fl_range(fl(290),fl(290))),time(12,15,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(290),fl(290))),time(13,14,0)),0.84)belongs_to profile_AOM427_1.

the_Segment(profile_AOM427_1,fourD_pt(threeD_pt(twoD_pt(lat_N(45),long_W(20)),fl_range(fl(290),fl(290))),time(13,14,0)),fourD_pt(threeD_pt(twoD_pt(lat_N(40),long_W(30)),fl_range(fl(290),fl(290))),time(14,15,0)),0.84)belongs_to profile_AOM427_1.

the_Aircraft_on_profile(profile_DAL123_1,dal123).

the_Type_of(dal123,b767).

meets_mnps(dal123).


