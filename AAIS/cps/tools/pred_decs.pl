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


