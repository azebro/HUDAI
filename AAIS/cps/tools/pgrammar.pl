/* ************************************************************************
This file is 'grammar.pl', part of 'PATT' (Parsing and Translation Tool).
PATT is a program which parses expressions in 'Theoretical Form' (TF) and
translates them into 'Execution Form' (EF) or 'Validation Form' (VF).

grammar.pl contains the grammar for parsing TF.

-- Update 1/97 - TLMc - I've added some more airline prefixes
   and type atoms

-- Update 6/97 - TLMc -  Any Prefix will do.
------------------------------------------------------------------------ */

/* Portability:
\+(, not( --> not__(		DONE
Exponentiation (pow vs. exp)	DONE
*/

/* ************************************************************************

 ------------------------------------------------------------------------ */

:- op(250, xfx, &).
:- op(250, xfx, or).	
:- op(250, xfx, =>).
:- op(250, xfx, <=>).


/* ************************************************************************
Compound wffs.
------------------------------------------------------------------------ */

wff(W) -->
    enclosed_wff(W1), !,
    (   [&], !, unbr_conj(W2), {W = (W1 & W2)}
	;
	[<=>], !, enclosed_wff(W2), {W = (W1 <=> W2)}
	;
	[=>], !, enclosed_wff(W2), {W = (W1 => W2)}
	;
	[or], !, unbr_disj(W2), {W = (W1 or W2)}
	;
	{W = W1}
    ), !.


unbr_conj(C) -->
    enclosed_wff(C1), !,
    (	[&], !, unbr_conj(C2), {C = (C1 & C2)}
	;
	{C = C1}
    ), !.


unbr_disj(D) -->
    enclosed_wff(D1), !,
    (	[or], !, unbr_disj(D2), {D = (D1 or D2)}
	;
	{D = D1}
    ), !.


enclosed_wff(W) --> 
    (	['['], !, 
	enclosed_wff(W1),
	(    [&], !, unbr_conj(W2), {W = (W1 & W2)}
	     ;
	     [<=>], !, enclosed_wff(W2), {W = (W1 <=> W2)}
	     ;
	     [=>], !, enclosed_wff(W2), {W = (W1 => W2)}
	     ;
	     [or], !, unbr_disj(W2), {W = (W1 or W2)}
	),
	[']']
	;
	['U'], !, varseq(Vs), enclosed_wff(W1), {univ_wff(Vs, W1, W)}
	;
	['E'], !, varseq(Vs), enclosed_wff(W1), {ex_wff(Vs, W1, W)}
	;
	[not], !, enclosed_wff(W1), {W = not__(W1)}
	;
	val_term(T1), (	[=], !, val_term(T2), {W = =('Val',T1,T2)}
			;
			['#'], !, val_term(T2), {W = not__(=('Val',T1,T2))})
  %% altered from \= for debugging purposes MMW 14/3/96
	;
	term(Sort, T1), ( [=], !, term(Sort, T2), {W = =(Sort,T1,T2)}
			  ;
			  ['#'], !, term(Sort, T2), {W = not__(=(Sort,T1,T2))})
  %% altered from \= for debugging purposes MMW 14/3/96
	;
	['('], atomic_wff(W), !, [')']
	;
	atomic_wff(W)
    ), !.



ex_wff([], Wff, Wff):- !.  
ex_wff([Var|Vars], Wff, exists(Var,Rest)):-
	ex_wff(Vars, Wff, Rest), !.

univ_wff([], Wff, Wff):- !.
univ_wff([Var|Vars], Wff, all(Var,Rest)):-
	univ_wff(Vars, Wff, Rest), !.

varseq(Seq) --> 
	variable(_, V),  !,
	(	[','], !, varseq(Vs), {Seq = [V|Vs]}
		;
		{Seq = [V]}
	), !.


/* ***********************************************************************
Value terms.  
----------------------------------------------------------------------- */

val_term(T) -->
	enclosed_val_term(T1), !,
	(	[+], !, unbr_plus_minus_term(T2), {T = (T1 + T2)}
		;
		[-], !, unbr_plus_minus_term(T2), {T = (T1 - T2)}
		;
		[*], !, unbr_mult_term(T2), {T = (T1 * T2)}
		;
		[/], !, enclosed_val_term(T2), {T = (T1 / T2)}
		;
		[mod], !, enclosed_val_term(T2), {T = (T1 mod T2)}
		;
		[^], !, enclosed_val_term(T2), 
		{power_functor_name__(N), T =.. [N,T1,T2]}
		;
		{T = T1}
	), !.
/* N.B. Functor name for 'power' (i.e. exponentiation) functor is system-
specific. Parse '^' into 'pow' for Quintus, 'exp' for Sicstus. */

enclosed_val_term(T) -->
	(	['('], 
		enclosed_val_term(T1), !,
		(	[+], !, unbr_plus_minus_term(T2), {T = (T1 + T2)}
			;
			[-], !, unbr_plus_minus_term(T2), {T = (T1 - T2)}
			;
			[*], !, unbr_mult_term(T2), {T = (T1 * T2)}
			;
			[/], !, enclosed_val_term(T2), {T = (T1 / T2)}
			;
			[mod], !, enclosed_val_term(T2), {T = (T1 mod T2)}
			;
			[^], !, enclosed_val_term(T2), 
			{power_functor_name__(N), T =.. [N,T1,T2]}
		),
		[')']
		;
		[-], !, enclosed_val_term(T1), {T = -T1}
		;
		[T], {number(T)}
	), !.


unbr_plus_minus_term(T) -->
	enclosed_val_term(T1), !,
	(	[+], !, unbr_plus_minus_term(T2), {T = (T1 + T2)}
		;
		[-], !, unbr_plus_minus_term(T2), {T = (T1 - T2)}
		;
		{T = T1}
	), !.


unbr_mult_term(T) -->
	enclosed_val_term(T1), !,
	(	[*], !, unbr_mult_term(T2), {T = (T1 * T2)}
		;
		{T = T1}
	), !.


% Lexical rules for 'enclosed_val_terms' now follow.

enclosed_val_term(the_basic_min_longitudinal_sep_Val_in_mins_required_for(Segment1,Segment2)) -->  
	['the_basic_min_longitudinal_sep_Val_in_mins_required_for'], ['('], 
	term('Segment',Segment1), [','], term('Segment',Segment2),  [')'], !.

enclosed_val_term(the_machno_Val_on(Segment)) --> 
	['the_machno_Val_on'], ['('], term('Segment',Segment) , [')'], !.

enclosed_val_term(abs(Vals))  --> 
	['abs'], ['('], val_term(Vals) , [')'], !.

enclosed_val_term(sqrt(Vals))  --> 
	['sqrt'], ['('], val_term(Vals) , [')'], !.

enclosed_val_term(round(Vals))  --> 
	['round'], ['('], val_term(Vals) , [')'], !.

enclosed_val_term(integer(Vals))  --> 
	['integer'], ['('], val_term(Vals) , [')'], !.
/* Power functor name is system-specific, e.g.'pow' for Quintus, 'exp' for Sicstus. */
enclosed_val_term(T)  --> 	/* Val1 to the power of Val2 */
	['('], enclosed_val_term(Val1) ,  ['^'],  enclosed_val_term(Val2) , [')'], 
	{power_functor_name(N), T =.. [N,Val1,Val2]}, !.

enclosed_val_term(max(Val1,Val2))  --> 
	['max'], ['('], val_term(Val1) , [','], val_term(Val2) , [')'], !.

enclosed_val_term(min(Val1,Val2))  --> 
	['min'], ['('], val_term(Val1) , [','], val_term(Val2) , [')'], !.

enclosed_val_term(the_long_arc_mins_dist_Val_between(Val1,Val2)) -->
	['the_long_arc_mins_dist_Val_between'], ['('], val_term(Val1), [','],
	val_term(Val2), [')'], !.

enclosed_val_term(the_long_arc_mins_eastward_Val_from(Val1,Val2)) -->
	['('], ['the_long_arc_mins_eastward_Val_from'], val_term(Val1), ['to'],
	val_term(Val2), [')'], !.

enclosed_val_term(the_long_arc_mins_westward_Val_from(Val1,Val2)) -->
	['('], ['the_long_arc_mins_westward_Val_from'], val_term(Val1), ['to'],
	val_term(Val2), [')'], !.

enclosed_val_term(the_total_Val_in_arc_mins_of_lat(Lat)) --> 
	['the_total_Val_in_arc_mins_of'], ['('], term('Lat', Lat) , [')'], !.

enclosed_val_term(the_total_Val_in_arc_mins_of_long(Long)) --> 
	['the_total_Val_in_arc_mins_of'], ['('], term('Long', Long) , [')'], !.

enclosed_val_term(the_arc_mins_eastward_Val_from(Long1,Long2))  -->  
	 ['('],  ['the_arc_mins_eastward_Val_from'], term('Long', Long1), ['to'], 
	term('Long', Long2), [')'], !.

enclosed_val_term(the_arc_mins_westward_Val_from(Long1,Long2))  -->  
	 ['('],  ['the_arc_mins_westward_Val_from'], term('Long', Long1), ['to'], 
	term('Long', Long2), [')'], !.

enclosed_val_term(the_Val_in_100s_of_feet_of(Flight_level)) --> 
	['the_Val_in_100s_of_feet_of'], ['('], term('Flight_level',  Flight_level) , [')'], !.

enclosed_val_term(the_Val_in_feet_of(Flight_level)) --> 
	['the_Val_in_feet_of'], ['('], term('Flight_level',  Flight_level) , [')'], !.

enclosed_val_term(the_total_Val_in_mins_of(Time)) --> 
	['the_total_Val_in_mins_of'], ['('], term('Time',Time) , [')'], !.

enclosed_val_term(the_nm_linear_dist_Val_between_2D_pts(TwoD_pt1,TwoD_pt2)) --> 
	['the_nm_linear_dist_Val_between'], ['('], term('2D_pt',TwoD_pt1),
	[','], term('2D_pt',TwoD_pt2) , [')'], !.

enclosed_val_term(the_lat_Val_in_arc_mins_of(TwoD_pt)) --> 
	['the_lat_Val_in_arc_mins_of'], ['('], term('2D_pt',TwoD_pt), [')'], !.

enclosed_val_term(the_long_Val_in_arc_mins_of(TwoD_pt)) --> 
	['the_long_Val_in_arc_mins_of'], ['('], term('2D_pt',TwoD_pt), [')'], !.

enclosed_val_term(the_cruise_climb_status_Val_of(Segment)) --> 
	['the_cruise_climb_status_Val_of'], ['('], term('Segment',Segment) , [')'], !.

enclosed_val_term(the_entry_lat_Val_in_arc_mins_of(Segment)) --> 
	['the_entry_lat_Val_in_arc_mins_of'], ['('], term('Segment',Segment) , [')'], !.

enclosed_val_term(the_exit_lat_Val_in_arc_mins_of(Segment)) --> 
	['the_exit_lat_Val_in_arc_mins_of'], ['('], term('Segment',Segment) , [')'], !.

enclosed_val_term(the_entry_long_Val_in_arc_mins_of(Segment)) --> 
	['the_entry_long_Val_in_arc_mins_of'], ['('], term('Segment',Segment) , [')'], !.

enclosed_val_term(the_exit_long_Val_in_arc_mins_of(Segment)) --> 
	['the_exit_long_Val_in_arc_mins_of'], ['('], term('Segment',Segment) , [')'], !.

enclosed_val_term(the_entry_time_Val_in_mins_of(Segment)) -->
	['the_entry_time_Val_in_mins_of'], ['('], term('Segment',Segment), [')'], !.

enclosed_val_term(the_exit_time_Val_in_mins_of(Segment))  -->
	['the_exit_time_Val_in_mins_of'], ['('], term('Segment',Segment), [')'], !.

enclosed_val_term(the_lat_over_long_gradient_Val_of(Segment))  --> 
	['the_lat_over_long_gradient_Val_of'], ['('], term('Segment',Segment) , [')'], !.

enclosed_val_term(the_nm_linear_track_length_Val_of(Segment))  --> 
	['the_nm_linear_track_length_Val_of'], ['('], term('Segment',Segment) , [')'], !.

enclosed_val_term(the_lat_length_Val_in_arc_mins_of(Segment))  --> 
	['the_lat_length_Val_in_arc_mins_of'], ['('], term('Segment',Segment) , [')'], !.

enclosed_val_term(the_long_length_Val_in_arc_mins_of(Segment))  --> 
	['the_long_length_Val_in_arc_mins_of'], ['('], term('Segment',Segment) , [')'], !.

enclosed_val_term(the_offset_const_Val_for_linear_track_of(Segment))  --> 
	['the_offset_const_Val_for_linear_track_of'], ['('], term('Segment',Segment) , [')'], !.

enclosed_val_term(the_average_lat_Val_in_arc_mins_of(Segment))  --> 
	['the_average_lat_Val_in_arc_mins_of'], ['('], term('Segment',Segment) , [')'], !.

enclosed_val_term(the_time_to_fly_Val_in_mins_of(Segment))  --> 
	['the_time_to_fly_Val_in_mins_of'], ['('], term('Segment',Segment) , [')'], !.

enclosed_val_term(the_min_vertical_sep_Val_in_feet_required_for(Flight_level1,Segment1,Flight_level2,Segment2)) -->  
	 ['('], ['the_min_vertical_sep_Val_in_feet_required_for'],
	term('Flight_level',  Flight_level1), [of],
	term('Segment',Segment1), [and], term('Flight_level',  Flight_level2), [of], 
	term('Segment',Segment2),  [')'], !.

enclosed_val_term(the_min_lateral_sep_Val_in_nm_required_for(Segment1,Segment2)) -->  
	['the_min_lateral_sep_Val_in_nm_required_for'], ['('], 
	term('Segment',Segment1), [','], term('Segment',Segment2),  [')'], !.

enclosed_val_term(the_min_longitudinal_sep_Val_in_mins_required_for(Segment1,Segment2)) -->  
	['the_min_longitudinal_sep_Val_in_mins_required_for'], ['('], 
	term('Segment',Segment1), [','], term('Segment',Segment2),  [')'], !.

enclosed_val_term(the_prox_airfield_long_sep_adjustment_Val_in_mins_required_for(Segment1,Segment2)) -->  
	['the_prox_airfield_long_sep_adjustment_Val_in_mins_required_for'], 
	['('], term('Segment',Segment1), [','], term('Segment',Segment2),  [')'], !.

enclosed_val_term(the_time_gap_Val_in_mins_between(Segment1,Segment2))  -->  
	['the_time_gap_Val_in_mins_between'], ['('], term('Segment',Segment1), [','],
	term('Segment',Segment2), [')'], !.

enclosed_val_term(the_required_lateral_half_box_dimension_Val_for_wrt(Segment1,Segment2)) -->  
	 ['('], ['the_required_lateral_half_box_dimension_Val_for'], 
	term('Segment',Segment1), [wrt], term('Segment',Segment2),  [')'], !.

enclosed_val_term(the_required_longitudinal_half_box_dimension_Val_for_wrt(Segment1,Segment2)) -->  
	 ['('], ['the_required_longitudinal_half_box_dimension_Val_for'], 
	term('Segment',Segment1), [wrt], term('Segment',Segment2),  [')'], !.

enclosed_val_term(the_lat_Val_on_linear_track_of_at(Segment,Long)) -->
	['('], ['the_lat_Val_on_linear_track_of'], term('Segment',Segment),
	['at'], term('Long', Long),  [')'], !.

enclosed_val_term(the_total_time_Val_in_mins_at(Linear_track_pt)) -->  
	['the_total_time_Val_in_mins_at'], ['('], 
	term('Linear_track_pt',Linear_track_pt), [')'], !.

enclosed_val_term(the_lat_Val_in_arc_mins_of(Linear_track_pt)) -->  
	['the_lat_Val_in_arc_mins_of'], ['('], 
	term('Linear_track_pt',Linear_track_pt), [')'], !.

enclosed_val_term(the_long_Val_in_arc_mins_of(Linear_track_pt)) -->  
	['the_long_Val_in_arc_mins_of'], ['('], 
	term('Linear_track_pt',Linear_track_pt), [')'], !.

enclosed_val_term(the_segment_entry_lat_Val_in_arc_mins_for(Linear_track_pt)) -->  
	['the_segment_entry_lat_Val_in_arc_mins_for'], ['('], 
	term('Linear_track_pt',Linear_track_pt), [')'], !.

enclosed_val_term(the_segment_exit_lat_Val_in_arc_mins_for(Linear_track_pt)) -->  
	['the_segment_exit_lat_Val_in_arc_mins_for'], ['('], 
	term('Linear_track_pt',Linear_track_pt), [')'], !.

enclosed_val_term(the_segment_entry_long_Val_in_arc_mins_for(Linear_track_pt)) -->  
	['the_segment_entry_long_Val_in_arc_mins_for'], ['('], 
	term('Linear_track_pt',Linear_track_pt), [')'], !.

enclosed_val_term(the_segment_exit_long_Val_in_arc_mins_for(Linear_track_pt)) -->  
	['the_segment_exit_long_Val_in_arc_mins_for'], ['('], 
	term('Linear_track_pt',Linear_track_pt), [')'], !.

enclosed_val_term(the_nm_linear_dist_Val_between_linear_track_pts(Linear_track_pt1,Linear_track_pt2)) -->  
	['the_nm_linear_dist_Val_between'], ['('], 
	term('Linear_track_pt',Linear_track_pt1), [','], 
	term('Linear_track_pt',Linear_track_pt2), [')'], !.

enclosed_val_term(the_segment_entry_time_Val_in_mins_for(Linear_track_pt)) -->  
	['the_segment_entry_time_Val_in_mins_for'], ['('], 
	term('Linear_track_pt',Linear_track_pt), [')'], !.

enclosed_val_term(the_segment_exit_time_Val_in_mins_for(Linear_track_pt)) -->  
	['the_segment_exit_time_Val_in_mins_for'], ['('], 
	term('Linear_track_pt',Linear_track_pt), [')'], !.

enclosed_val_term(sin(Vals))  --> 
	['sin'], ['('], val_term(Vals) , [')'], !.

enclosed_val_term(cos(Vals))  --> 
	['cos'], ['('], val_term(Vals) , [')'], !.

enclosed_val_term(tan(Vals))  --> 
	['tan'], ['('], val_term(Vals) , [')'], !.


% Rules for variable and numerical subsort 'enclosed_val_terms'.

enclosed_val_term(V) --> variable('Val',V), !.
enclosed_val_term(T) --> int_0_to_23_term(T), !.
enclosed_val_term(T) --> int_0_to_59_term(T), !.
enclosed_val_term(T) --> int_0_to_89_term(T), !.
enclosed_val_term(T) --> int_0_to_90_term(T), !.
enclosed_val_term(T) --> int_0_to_179_term(T), !.
enclosed_val_term(T) --> int_0_to_180_term(T), !.
enclosed_val_term(T) --> int_0_to_1000_term(T), !.
enclosed_val_term(T) --> int_gte_0_term(T), !.



/* ***********************************************************************
Numerical subsort terms.
----------------------------------------------------------------------- */

int_0_to(Limit, N) -->
	[N],
	{integer(N),
	 N >= 0,
	 N =< Limit}, !.
int_gte_0_term(N) -->
	[N],
	{integer(N),
	 N >= 0}, !.

int_0_to_23_term(N) --> int_0_to(23, N), !.
int_0_to_59_term(N) --> int_0_to(59, N), !.
int_0_to_89_term(N) --> int_0_to(89, N), !.
int_0_to_90_term(N) --> int_0_to(90, N), !.
int_0_to_179_term(N) --> int_0_to(179, N), !.
int_0_to_180_term(N) --> int_0_to(180, N), !.
int_0_to_1000_term(N) --> int_0_to(1000, N), !.

int_0_to_23_term(V) --> variable('Int_0_to_23', V), !.
int_0_to_59_term(V) --> variable('Int_0_to_59', V), !.
int_0_to_89_term(V) --> variable('Int_0_to_89', V), !.
int_0_to_90_term(V) --> variable('Int_0_to_90', V), !.
int_0_to_179_term(V) --> variable('Int_0_to_179', V), !.
int_0_to_180_term(V) --> variable('Int_0_to_180', V), !.
int_0_to_1000_term(V) --> variable('Int_0_to_1000', V), !.
int_gte_0_term(V) --> variable('Int_gte_0', V), !.


/* ************************************************************************
Aircraft terms.
------------------------------------------------------------------------ */

term('Aircraft',the_Aircraft_on_segment(Segment)) -->
	['the_Aircraft_on'], ['('], term('Segment',Segment) ,[')'], !.

term('Aircraft',the_Aircraft_on_profile(Profile)) -->
	['the_Aircraft_on'], ['('], term('Profile',Profile), [')'], !.


% Rules for individual non-standard aircraft constant terms. Note that
% constants MUST be parsed into forms which are standard unquoted Prolog
% atoms, i.e. which begin with a lowercase letter. Otherwise, errors will
% arise in translation to Prolog.

term('Aircraft', noroom) --> ['NOROOM'], !.
term('Aircraft', clang1) --> ['CLANG1'], !.
term('Aircraft', clang1) --> ['CLANG2'], !.

% Special parameterised rule for aircraft constant terms:

term('Aircraft', C1) -->
	[C],
	{atomic(C),
	 name(C, Chars),
	 airline_prefix(Prefix),
	 append(Prefix, Rest, Chars),
	 all_alphanumeric_or_underscore_chars(Rest),
	 lowercase_form(C, C1)}, !.

% N.B. 'Cuts' should not be added to the 'airline_prefix' clauses.

airline_prefix("BAW").
airline_prefix("RAX").
airline_prefix("ELY").
airline_prefix("AFR").
airline_prefix("GFA").
airline_prefix("DLH").
airline_prefix("AIC").
airline_prefix("RRR").
airline_prefix("BAL").
airline_prefix("AZA").
airline_prefix("KLM").
airline_prefix("LTU").
airline_prefix("TWA").
airline_prefix("NWA").
airline_prefix("MAH").
airline_prefix("UAL").
airline_prefix("DAL").
airline_prefix("COA").
airline_prefix("TAP").
airline_prefix("AOM").
airline_prefix("ACA").
airline_prefix("TSC").
airline_prefix("THY").
airline_prefix("SAS").
airline_prefix("CRL").
airline_prefix("FIN").
airline_prefix("AFL").
airline_prefix("AAL").
airline_prefix("CFG").
airline_prefix("UPS").
airline_prefix("UKR").
airline_prefix("MPH").
airline_prefix("LOT").
airline_prefix("HLF").
airline_prefix("MKA").
airline_prefix("SAB").
airline_prefix("AUA").
airline_prefix("RJA").
airline_prefix("LDI").
airline_prefix("CDN").
airline_prefix("DOA").
airline_prefix("BEA").
airline_prefix("CKT").
airline_prefix("AEL").
airline_prefix("VRB").
airline_prefix("BWA").
airline_prefix("GAF").
airline_prefix("TOW").
airline_prefix("AVA").
airline_prefix("ULE").
airline_prefix("VIR").
airline_prefix("FDX").
airline_prefix("SWR").
airline_prefix("CKT").
airline_prefix("M38").
airline_prefix("LTE").
airline_prefix("CLI").
airline_prefix("ROY").
airline_prefix("ROT").
airline_prefix("AMT").
airline_prefix("IBE").
airline_prefix("MRI").
airline_prefix("LDA").
airline_prefix("AMT").
airline_prefix("OAL").
airline_prefix("N20").
airline_prefix("EIN").
airline_prefix("PIA").
airline_prefix("M80").
airline_prefix("M50").

airline_prefix("RIA").
airline_prefix("ANZ").
airline_prefix("DHL").
airline_prefix("CLX").
airline_prefix("N81").
airline_prefix("SVA").
airline_prefix("FGP").
airline_prefix("EWW").
airline_prefix("XAA").
airline_prefix("M21").
airline_prefix("USA").

airline_prefix("E60").
airline_prefix("SIA").
airline_prefix("M17").
airline_prefix("HLA").
airline_prefix("M00").
airline_prefix("N13").
airline_prefix("KAC").
airline_prefix("N72").
airline_prefix("N50").
airline_prefix("SNT").
airline_prefix("AMM").
airline_prefix("M50").
airline_prefix("N74").
airline_prefix("TUR").
airline_prefix("BBC").
airline_prefix("N90").
airline_prefix("MON").
airline_prefix("GOL").
airline_prefix("MSR").
airline_prefix("CUB").
airline_prefix("SIA").
airline_prefix("093").
airline_prefix("LIB").

% Marg's 3/98 new ones

airline_prefix("GBOAE").
airline_prefix("N623MS").
airline_prefix("RRV04A").
 
 
airline_prefix("N663MN").
airline_prefix("N468GA").
airline_prefix("N226G").
airline_prefix("RCH8").
airline_prefix("RCH7").
airline_prefix("RCH6").
airline_prefix("RCH5").
airline_prefix("RCH4").
airline_prefix("RCHGDF").
airline_prefix("RCHG3").
airline_prefix("RCHZ").
airline_prefix("RCHJHF").
airline_prefix("CSA").
airline_prefix("LAZ").
airline_prefix("AIH").
airline_prefix("CMM").
airline_prefix("KEYS").
airline_prefix("HZHR").
airline_prefix("I2").
airline_prefix("EARL").
airline_prefix("LKR").
airline_prefix("SPAR").
airline_prefix("AEA").
airline_prefix("CTM1").
airline_prefix("IAF").
airline_prefix("CTB").
airline_prefix("VRCYM").
airline_prefix("VVJW").
airline_prefix("VVLA").
airline_prefix("VDA9").
airline_prefix("VV").
airline_prefix("KSINO").
airline_prefix("RAM").
airline_prefix("LIB").
airline_prefix("PAT").
airline_prefix("TUAF").
airline_prefix("N191BE").
airline_prefix("AMX").
airline_prefix("NRN").
airline_prefix("LIB").
airline_prefix("JERSY").
airline_prefix("NAF").
airline_prefix("ADB3").
airline_prefix("N145W").
airline_prefix("N464QS").
airline_prefix("N383MB").
airline_prefix("MTM").
airline_prefix("PKH").
airline_prefix("AMY").
airline_prefix("TRA").

% mine for 1/96 data

airline_prefix("BH").
airline_prefix("BLUE").
airline_prefix("GOLD").
airline_prefix("CKS").
airline_prefix("CTM").
airline_prefix("M10").
airline_prefix("M70").
airline_prefix("M60").
airline_prefix("BBB").
airline_prefix("QUID").
airline_prefix("FUZ").
airline_prefix("N").
% airline_prefix("N31V").
% airline_prefix("N105Y").
% airline_prefix("N71PG").
airline_prefix("VV5").
airline_prefix("RRR").
airline_prefix("0906").
airline_prefix("906").
airline_prefix("1008").
airline_prefix("1132").
airline_prefix("IFB").
airline_prefix("MDQ").

airline_prefix("W").
airline_prefix("S").
airline_prefix("T").
airline_prefix("A").
airline_prefix("V").
airline_prefix("5").
airline_prefix("M").
airline_prefix("FCL").
airline_prefix("XASEC").
airline_prefix("RCH").
airline_prefix("KFS").
airline_prefix("SVA").
airline_prefix("GTI").
airline_prefix("VV5").
airline_prefix("EIA").
airline_prefix("XBSOL").
airline_prefix("OEIMI").
airline_prefix("RATS").
airline_prefix("XAVTO").
airline_prefix("N818LS").
airline_prefix("N549QS").
airline_prefix("E7R2").
airline_prefix("OEHIT").
airline_prefix("FAF").
airline_prefix("HZ").
airline_prefix("RH").
airline_prefix("RFR").
all_alphanumeric_or_underscore_chars([]):- !.
all_alphanumeric_or_underscore_chars([Char|Chars]):-
	(alphanumeric_char(Char) ; Char = 95),	% 95 is ASCII for '_'
	all_alphanumeric_or_underscore_chars(Chars), !.

lowercase_form(Atom, LC_atom):-
	name(Atom, Chars),
	lowercase_forms_of_chars(Chars, LC_chars),
	name(LC_atom, LC_chars), !.

lowercase_forms_of_chars([], []):- !.
lowercase_forms_of_chars([Char|Chars], [LC_char|LC_chars]):-
	Char >= 65,	% ASCII value for 'A'
	Char =< 90, !,	% ASCII value for 'Z'
	LC_char is Char + 32,
	lowercase_forms_of_chars(Chars, LC_chars), !.
lowercase_forms_of_chars([Char|Chars], [Char|LC_chars]):-
%	Any other Char
	lowercase_forms_of_chars(Chars, LC_chars), !.


/* ************************************************************************
Type terms (i.e. aircraft-type terms).
------------------------------------------------------------------------ */

term('Type', the_Type_of(Aircraft)) -->
	['the_Type_of'], ['('], term('Aircraft',Aircraft) ,[')'], !.

% Generic rule for parsing non-standard type constants, i.e. those 
% which do not have the prefix 'type_'.

term('Type', C1) -->
	[C],
	{atomic(C),
	 type_atom(C),
	 lowercase_form(C, C1)}, !.

% 'Type' constant atoms. 


type_atom('AC6T'):- !.
type_atom('AC56'):- !.
type_atom('AN4'):- !.
type_atom('AN4R'):- !.
type_atom('ATLA'):- !.
type_atom('B52'):- !.
type_atom('B707'):- !.
type_atom('B727'):- !.
type_atom('B737'):- !.
type_atom('B73S'):- !.
type_atom('B747'):- !.
type_atom('B74F'):- !.
type_atom('B74S'):- !.
type_atom('B757'):- !.
type_atom('B767'):- !.
type_atom('B777'):- !.
type_atom('B73F'):- !.
type_atom('BA11'):- !.
type_atom('BA10'):- !.
type_atom('BA31'):- !.
type_atom('BA32'):- !.
type_atom('BA46'):- !.
type_atom('BE20'):- !.
type_atom('BE30'):- !.
type_atom('C2'):- !.
type_atom('C20'):- !.
type_atom('C5A'):- !.
type_atom('C5'):- !.
type_atom('C9'):- !.
type_atom('C12'):- !.
type_atom('C17'):- !.
type_atom('CA20A'):- !.
type_atom('C21'):- !.
type_atom('C130'):- !.
type_atom('C135'):- !.
type_atom('C137'):- !.
type_atom('C140'):- !.
type_atom('C141'):- !.
type_atom('C404'):- !.
type_atom('C441'):- !.
type_atom('C500'):- !.
type_atom('CONC'):- !.
type_atom('CL60'):- !.
type_atom('CL64'):- !.
type_atom('CL65'):- !.
type_atom('DA20'):- !.
type_atom('DA50'):- !.
type_atom('DA90'):- !.
type_atom('DC8'):- !.
type_atom('DC8S'):- !.
type_atom('DC86'):- !.
type_atom('DC9'):- !.
type_atom('DC10'):- !.
type_atom('DH4'):- !.
type_atom('DH5'):- !.
type_atom('DH7'):- !.
type_atom('DH8'):- !.
type_atom('EA30'):- !.
type_atom('EA31'):- !.
type_atom('EA32'):- !.
type_atom('EA33'):- !.
type_atom('EA34'):- !.
type_atom('E3A'):- !.
type_atom('E3'):- !.
type_atom('E4A'):- !.
type_atom('E6'):- !.
type_atom('F111'):- !.
type_atom('F4'):- !.
type_atom('F14'):- !.
type_atom('F15'):- !.
type_atom('F16'):- !.
type_atom('F18'):- !.
type_atom('FK28'):- !.
type_atom('G2'):- !.
type_atom('G3'):- !.
type_atom('G4'):- !.
type_atom('G5'):- !.
type_atom('HAR'):- !.
type_atom('HS25'):- !.
type_atom('HS74'):- !.
type_atom('IL62'):- !.
type_atom('IL86'):- !.
type_atom('KC10'):- !.
type_atom('KC35'):- !.
type_atom('L101'):- !.
type_atom('L329'):- !.
type_atom('LR35'):- !.
type_atom('LR36'):- !.
type_atom('LR55'):- !.
type_atom('LR60'):- !.
type_atom('L382'):- !.
type_atom('MD11'):- !.
type_atom('MD80'):- !.
type_atom('MRC'):- !.
type_atom('N265'):- !.
type_atom('ND16'):- !.
type_atom('NIM'):- !.
type_atom('P140'):- !.
type_atom('P3'):- !.
type_atom('P3C'):- !.
type_atom('P3A'):- !.
type_atom('PA30'):- !.
type_atom('PA31'):- !.
type_atom('PA34'):- !.
type_atom('PA42'):- !.
type_atom('PA60'):- !.
type_atom('TU34'):- !.
type_atom('T39'):- !.
type_atom('VC10'):- !.
type_atom('VCTR'):- !.
type_atom('U2'):- !.
type_atom('Y'):- !.


% Group below are used in FIS, although their significance is not clear -
% they appear to refer to generic 'performance types' of aircraft rather
% than being abbreviations for makes of aircraft.

type_atom('TYP1'):- !.
type_atom('TYP2'):- !.
type_atom('TYP3'):- !.
type_atom('TYP4'):- !.
type_atom('TYP5'):- !.
type_atom('TYP6'):- !.
type_atom('TYP7'):- !.


/* ************************************************************************
4D_pt terms.
------------------------------------------------------------------------ */

term('4D_pt', fourD_pt(ThreeD_pt,Time) ) -->
	term('3D_pt',ThreeD_pt), [';'], term('Time',Time), !.

term('4D_pt', the_entry_4D_pt_of(Segment)) --> 
	['the_entry_4D_pt_of'], ['('], term('Segment',Segment) , [')'], !.

term('4D_pt',the_exit_4D_pt_of(Segment)) --> 
	['the_exit_4D_pt_of'], ['('], term('Segment',Segment) , [')'], !.

term('4D_pt',the_first_4D_pt_of(Profile)) --> 
	['the_first_4D_pt_of'], ['('], term('Profile',Profile) , [')'], !.

term('4D_pt',the_first_recognised_4D_pt_for_oceanic_cpr_of(Profile)) --> 
	['the_first_recognised_4D_pt_for_oceanic_cpr_of'], ['('], 		
	term('Profile',Profile) , [')'], !.

term('4D_pt',the_last_recognised_4D_pt_for_oceanic_cpr_of(Profile)) --> 
	['the_last_recognised_4D_pt_for_oceanic_cpr_of'], ['('], 
	term('Profile',Profile) , [')'], !.


/* ************************************************************************
3D_pt terms.
------------------------------------------------------------------------ */

term('3D_pt',threeD_pt(TwoD_pt,Flight_level_range))   --> 
	term('2D_pt',TwoD_pt), [';'], term('Flight_level_range', 
	Flight_level_range), !.

term('3D_pt',the_3D_pt_of(FourD_pt))  --> 
	['the_3D_pt_of'], ['('], term('4D_pt',FourD_pt) , [')'], !.


/* ************************************************************************
2D_pt terms.
------------------------------------------------------------------------ */

term('2D_pt',twoD_pt(Lat,Long)) --> 
	term('Lat', Lat), [';'], term('Long', Long), !.

term('2D_pt',the_2D_pt_of_3D_pt(ThreeD_pt))  --> 
	['the_2D_pt_of'], ['('], term('3D_pt',ThreeD_pt) , [')'], !.

term('2D_pt',the_2D_pt_of_4D_pt(FourD_pt))  --> 
	['the_2D_pt_of'], ['('], term('4D_pt',FourD_pt) , [')'], !.

term('2D_pt',the_entry_2D_pt_of(Segment)) --> 
	['the_entry_2D_pt_of'], ['('], term('Segment',Segment) , [')'], !.

term('2D_pt',the_exit_2D_pt_of(Segment)) --> 
	['the_exit_2D_pt_of'], ['('], term('Segment',Segment) , [')'], !.


/* ************************************************************************
Flight_level_range terms.
------------------------------------------------------------------------ */

term('Flight_level_range',  fl_range(Flight_level1,Flight_level2)) -->  
	term('Flight_level', Flight_level1), [';'], 
	term('Flight_level', Flight_level2), !.

term('Flight_level_range',  the_Flight_level_range_of_3D_pt(ThreeD_pt)) -->
	['the_Flight_level_range_of'], ['('], term('3D_pt',ThreeD_pt), [')'], !.

term('Flight_level_range',  the_Flight_level_range_of_4D_pt(FourD_pt)) -->
	['the_Flight_level_range_of'], ['('], term('4D_pt',FourD_pt), [')'], !.

term('Flight_level_range',  the_entry_Flight_level_range_of(Segment)) -->
	['the_entry_Flight_level_range_of'], ['('], term('Segment',Segment), [')'], !.

term('Flight_level_range',  the_exit_Flight_level_range_of(Segment)) -->
	['the_exit_Flight_level_range_of'], ['('], term('Segment',Segment), [')'], !.


/* ************************************************************************
Latitude terms.
------------------------------------------------------------------------ */

term('Lat', lat_N(Degs_val)) --> int_0_to_90_term(Degs_val), ['N'], !.

term('Lat', lat_S(Degs_val)) --> int_0_to_90_term(Degs_val), ['S'], !.

term('Lat', lat_N(Degs_val, Mins_val)) --> 
	int_0_to_89_term(Degs_val),   int_0_to_59_term(Mins_val), ['N'], !.

term('Lat', lat_S(Degs_val, Mins_val)) -->
	int_0_to_89_term(Degs_val),   int_0_to_59_term(Mins_val), ['S'], !.

term('Lat', the_Lat_of_2D_pt(TwoD_pt)) -->
	['the_Lat_of'], ['('], term('2D_pt',TwoD_pt), [')'], !.

term('Lat', the_Lat_of_4D_pt(FourD_pt)) -->
	['the_Lat_of'], ['('], term('4D_pt',FourD_pt), [')'], !.

term('Lat', the_entry_Lat_of(Segment)) -->
	['the_entry_Lat_of'], ['('], term('Segment',Segment), [')'], !.

term('Lat', the_exit_Lat_of(Segment)) -->
	['the_exit_Lat_of'], ['('], term('Segment',Segment), [')'], !.

term('Lat', the_most_northerly_Lat_of(Segment)) -->
	['the_most_northerly_Lat_of'], ['('], term('Segment',Segment), [')'], !.

term('Lat', the_most_southerly_Lat_of(Segment)) -->
	['the_most_southerly_Lat_of'], ['('], term('Segment',Segment), [')'], !.


/* ************************************************************************
Longitude terms.
------------------------------------------------------------------------ */

term('Long', long_E(Degs_val)) --> int_0_to_180_term(Degs_val), ['E'], !.

term('Long', long_W(Degs_val)) --> int_0_to_180_term(Degs_val), ['W'], !.

term('Long', long_E(Degs_val,Mins_val)) -->
	int_0_to_179_term(Degs_val),   int_0_to_59_term(Mins_val), ['E'], !.

term('Long', long_W(Degs_val,Mins_val)) -->
	int_0_to_179_term(Degs_val),   int_0_to_59_term(Mins_val), ['W'], !.

term('Long', the_Long_of_2D_pt(TwoD_pt)) -->
	['the_Long_of'], ['('], term('2D_pt',TwoD_pt), [')'], !.

term('Long', the_Long_of_4D_pt(FourD_pt)) -->
	['the_Long_of'], ['('], term('4D_pt',FourD_pt), [')'], !.

term('Long', the_entry_Long_of(Segment)) -->
	['the_entry_Long_of'], ['('], term('Segment',Segment), [')'], !.

term('Long', the_exit_Long_of(Segment)) -->
	['the_exit_Long_of'], ['('], term('Segment',Segment), [')'], !.

term('Long', the_most_westerly_Long_of(Segment)) -->
	['the_most_westerly_Long_of'], ['('], term('Segment',Segment), [')'], !.

term('Long', the_most_easterly_Long_of(Segment)) -->
	['the_most_easterly_Long_of'], ['('], term('Segment',Segment), [')'], !.


/* ************************************************************************
Flight_level terms.
------------------------------------------------------------------------ */

term('Flight_level',  fl(Int_0_to_1000)) -->  ['FL'], int_0_to_1000_term(Int_0_to_1000), !.

term('Flight_level',  the_max_Flight_level_of_fl_range(Flight_level_range)) -->
	['the_max_Flight_level_of'], ['('],
        term('Flight_level_range',Flight_level_range), [')'], !.

term('Flight_level',  the_min_Flight_level_of_fl_range(Flight_level_range)) -->
	['the_min_Flight_level_of'], ['('],
        term('Flight_level_range',Flight_level_range), [')'], !.

term('Flight_level',  the_Flight_level_of_3D_pt(ThreeD_pt)) -->
	['the_Flight_level_of'], ['('], term('3D_pt',ThreeD_pt) ,[')'], !.

term('Flight_level',  the_Flight_level_of_4D_pt(FourD_pt)) -->
	['the_Flight_level_of'], ['('], term('4D_pt',FourD_pt) ,[')'], !.

term('Flight_level',  the_max_Flight_level_of_segment(Segment)) -->
	['the_max_Flight_level_of'], ['('], term('Segment',Segment) ,[')'], !.

term('Flight_level',  the_min_Flight_level_of_segment(Segment)) -->
	['the_min_Flight_level_of'], ['('], term('Segment',Segment) ,[')'], !.

term('Flight_level',  the_max_entry_Flight_level_of(Segment)) -->
	['the_max_entry_Flight_level_of'], ['('], term('Segment',Segment), [')'], !.

term('Flight_level',  the_max_exit_Flight_level_of(Segment)) -->
	['the_max_exit_Flight_level_of'], ['('], term('Segment',Segment), [')'], !.

term('Flight_level',  the_min_entry_Flight_level_of(Segment)) -->
	['the_min_entry_Flight_level_of'], ['('], term('Segment',Segment), [')'], !.

term('Flight_level',  the_min_exit_Flight_level_of(Segment)) -->
	['the_min_exit_Flight_level_of'], ['('], term('Segment',Segment), [')'], !.


/* ************************************************************************
Time terms.
------------------------------------------------------------------------ */

term('Time',time(Hrs_val,Mins_val,Day_val)) -->
	int_0_to_23_term(Hrs_val),   int_0_to_59_term(Mins_val), ['GMT'], 
	['day'], int_gte_0_term(Day_val), !.

term('Time',the_next_integer_Time_in_mins_after(Time)) -->
	['the_next_integer_Time_in_mins_after'], ['('], term('Time',Time), [')'], !.

term('Time',the_Time_of(FourD_pt)) -->
	['the_Time_of'], ['('], term('4D_pt',FourD_pt), [')'], !.

term('Time',the_entry_Time_of(Segment)) -->
	['the_entry_Time_of'], ['('], term('Segment',Segment), [')'], !.

term('Time',the_exit_Time_of(Segment))  -->
	['the_exit_Time_of'], ['('], term('Segment',Segment), [')'], !.

term('Time',the_overlap_window_start_Time_for(Segment1,Segment2)) -->  
	['the_overlap_window_start_Time_for'], ['('], term('Segment',Segment1), [','],
 	term('Segment',Segment2),  [')'], !.

term('Time',the_overlap_window_end_Time_for(Segment1,Segment2)) -->  
	['the_overlap_window_end_Time_for'], ['('], term('Segment',Segment1), [','],
 	term('Segment',Segment2),  [')'], !.

term('Time', time_of_current_conflict_probe) -->
	[time_of_current_conflict_probe], !.


/* ************************************************************************
Profile terms. 
------------------------------------------------------------------------ */

term('Profile',the_Profile_containing(Segment))  --> 
	['the_Profile_containing'], ['('], term('Segment',Segment) , [')'], !.


/* ***********************************************************************
Segment terms.
----------------------------------------------------------------------- */

term('Segment',the_Segment(Profile,FourD_pt1,FourD_pt2,Val))  --> 
	['the_Segment'], ['('], term('Profile',Profile), [','], term('4D_pt',FourD_pt1),
	[','], term('4D_pt',FourD_pt2),[','], val_term(Val),
	[')'], !.

term('Segment',the_entry_Segment_of(Profile)) -->  
	['the_entry_Segment_of'], ['('], term('Profile',Profile), [')'], !.

term('Segment',the_exit_Segment_of(Profile)) -->  
	['the_exit_Segment_of'], ['('], term('Profile',Profile), [')'], !.

term('Segment',the_earlier_Segment_of(Segment1,Segment2)) -->  
	['the_earlier_Segment_of'], ['('], term('Segment',Segment1), [','], 
        term('Segment',Segment2), [')'], !.

term('Segment',the_later_Segment_of(Segment1,Segment2)) -->  
	['the_later_Segment_of'], ['('], term('Segment',Segment1), [','], 
        term('Segment',Segment2), [')'], !.

term('Segment',the_Segment_of(Linear_track_pt)) -->  
	['the_Segment_of'], ['('], term('Linear_track_pt',Linear_track_pt), [')'], !.


/* ***********************************************************************
Linear_track_pt terms.
----------------------------------------------------------------------- */

term('Linear_track_pt',the_entry_Linear_track_pt_of(Segment))  --> 
	['the_entry_Linear_track_pt_of'], ['('], term('Segment',Segment) , [')'], !.

term('Linear_track_pt',the_exit_Linear_track_pt_of(Segment))  --> 
	['the_exit_Linear_track_pt_of'], ['('], term('Segment',Segment) , [')'], !.

term('Linear_track_pt',the_Linear_track_pt(Segment,Val)) -->  
	['the_Linear_track_pt'], ['('], term('Segment',Segment), [','], 
	val_term(Val), [')'], !.


/* ************************************************************************
Airspace terms.
------------------------------------------------------------------------ */

term('Airspace','mnps') --> ['MNPS'], !.
term('Airspace','shanwick') --> ['Shanwick'], !.
term('Airspace','gander') --> ['Gander'], !.
term('Airspace','oceanic') --> ['Oceanic'], !.

/* ***********************************************************************
New generic rules for variable and constant terms - keep as last two 'term' clauses for efficiency reasons. 
----------------------------------------------------------------------- */

% Generic rule for variable terms.

term(Sort, V) --> variable(Sort, V), !.

variable(Sort, V) -->
	[V],
	{atomic(V),
	 sortname(Sort),
	 name(Sort, Sort_prefix),
	 name(V, V_chars),
	 all_alphanumeric(V_chars),
	 append(Sort_prefix, _, V_chars)}, !.


% Generic rule for standard-format constants.

term(Sort, C) -->
	[C],
	{atomic(C),
	 sortname(Sort),
	 name(Sort, Sort_chars),
	 lowercase_version(Sort_chars, Sort_prefix),
	 name(C, C_chars),
	 all_alphanumeric(C_chars),
	 append(Sort_prefix, _, C_chars)}, !.



% N.B. Sortnames should all begin with either an uppercase letter or a
% numeral. No 'cuts' should be added to 'sortname' clauses. Also, if
% one sortname is a prefix of another, the clause for the longer of the
% two should be above the shorter one (e.g. the clause for 
% 'Flight_level_range' should be above the clause for 'Flight_level'.
% If this is not so, errors will occasionally arise in the parsing of
% constants and variables.

sortname('Val').
sortname('Segment').
sortname('Profile').
sortname('Aircraft').
sortname('Type').
sortname('Lat').
sortname('Long').
sortname('Flight_level_range').   
sortname('Flight_level').
sortname('Time').
sortname('2D_pt').
sortname('3D_pt').
sortname('4D_pt').
sortname('Linear_track_pt').
sortname('Airspace').

% Names of numerical subsorts.
sortname('Int_0_to_23').
sortname('Int_0_to_59').
sortname('Int_0_to_89').
sortname('Int_0_to_90').
sortname('Int_0_to_179').
sortname('Int_0_to_180').
sortname('Int_0_to_1000').
sortname('Int_gte_0').


lowercase_version([Char|Chars], [99,Char|Chars]):-  % 99 is 'c'
	numeric_char(Char), !.
lowercase_version([Char|Chars], [NewChar|Chars]):-
	Char >= 65, % 'A'
	Char =< 90, % 'Z'
	NewChar is Char + 32, !.
lowercase_version(Chars, Chars).


/* ***********************************************************************
Lexicon of atomic wffs.
----------------------------------------------------------------------- */

/* ************************************************************************
Type wffs.
------------------------------------------------------------------------ */

atomic_wff(is_a_jet_type(Type)) --> 
         term('Type', Type),  ['is_a_jet_type'], !.

/* ************************************************************************
Aircraft wffs.
------------------------------------------------------------------------ */

atomic_wff(meets_mnps(Aircraft)) --> 
         term('Aircraft',Aircraft),  ['meets_mnps'], !.

atomic_wff(are_jets(Aircraft1,Aircraft2)) -->
	term('Aircraft',Aircraft1), [and], term('Aircraft',Aircraft2), 
	['are_jets'], !.

atomic_wff(meet_mnps(Aircraft1,Aircraft2)) -->
	term('Aircraft',Aircraft1), [and], term('Aircraft',Aircraft2), 
	['meet_mnps'], !.

atomic_wff(one_or_both_do_not_meet_mnps(Aircraft1,Aircraft2)) -->
	['one_or_both_of'], term('Aircraft',Aircraft1), [and], 
	term('Aircraft',Aircraft2), ['do_not_meet_mnps'], !.

atomic_wff(is_a_turbo_type(Type)) --> 
         term('Type', Type),  ['is_a_turbo_type'], !.

atomic_wff(is_a_piston_type(Type)) --> 
         term('Type', Type),  ['is_a_piston_type'], !.


/* ************************************************************************
Vals wffs. N.B. Rules for three-argument ordering predicates should be kept
before rules for two-argument ordering predicates in order to avoid 
parsing errors.
------------------------------------------------------------------------ */

atomic_wff(((Val1 =< Val2) & (Val2 =< Val3))) -->  
	val_term(Val1), ['=<'], val_term(Val2), ['=<'], val_term(Val3), !.

atomic_wff(((Val1 =< Val2) & (Val2 < Val3)))  -->  
	val_term(Val1), ['=<'], val_term(Val2), ['<'], val_term(Val3), !.

atomic_wff(((Val1 < Val2) & (Val2 < Val3))) -->  
	val_term(Val1), ['<'], val_term(Val2), ['<'], val_term(Val3), !.

atomic_wff(((Val1 < Val2) & (Val2 =< Val3)))  -->  
	val_term(Val1), ['<'], val_term(Val2), ['=<'], val_term(Val3), !.

atomic_wff((Val1 < Val2))   -->  
	val_term(Val1), ['<'], val_term(Val2), !.

atomic_wff((Val1 > Val2))   -->  
	val_term(Val1), ['>'], val_term(Val2), !.

atomic_wff((Val1 =< Val2))   -->  
	val_term(Val1), ['=<'], val_term(Val2), !.

atomic_wff((Val1 >= Val2))   -->  
	val_term(Val1), ['>='], val_term(Val2), !.

% atomic_wff(integer(Val)) -->
%	['integer'], ['('], val_term(Val), [')'], !.

atomic_wff(non_negative_integer(Val)) -->
	['non_negative_integer'], ['('], val_term(Val), [')'], !.


/* ************************************************************************
Lats wffs.
------------------------------------------------------------------------ */

:- op(100, xfx, is_north_of).
atomic_wff((Lat1 is_north_of Lat2))  -->  
	term('Lat', Lat1), ['is_north_of'], term('Lat', Lat2), !.

:- op(100, xfx, is_at_or_north_of).
atomic_wff((Lat1 is_at_or_north_of Lat2))  -->  
	term('Lat', Lat1), ['is_at_or_north_of'], term('Lat', Lat2), !.

:- op(100, xfx, is_south_of).
atomic_wff((Lat1 is_south_of Lat2))  -->  
	term('Lat', Lat1), ['is_south_of'], term('Lat', Lat2), !.

:- op(100, xfx, is_at_or_south_of).
atomic_wff((Lat1 is_at_or_south_of Lat2))  -->  
	term('Lat', Lat1), ['is_at_or_south_of'], term('Lat', Lat2), !.

atomic_wff(are_separated_by_at_least_one_degree(Lat1,Lat2)) -->
	term('Lat', Lat1), [and], term('Lat', Lat2),
	['are_separated_by_at_least_one_degree'], !.


/* ************************************************************************
Longs wffs.
------------------------------------------------------------------------ */

:- op(100, xfx, is_east_of).
atomic_wff((Long1 is_east_of Long2))  -->  
	term('Long', Long1), ['is_east_of'], term('Long', Long2), !.

:- op(100, xfx, is_west_of).
atomic_wff((Long1 is_west_of Long2))  -->  
	term('Long', Long1), ['is_west_of'], term('Long', Long2), !.

:- op(100, xfx, is_at_or_west_of).
atomic_wff((Long1 is_at_or_west_of Long2))  -->  
	term('Long', Long1), ['is_at_or_west_of'], term('Long', Long2), !.

atomic_wff(are_on_the_eastern_boundary_of_the_Shanwick_OCA(Long1,Long2)) -->
	term('Long', Long1), [and], term('Long', Long2),
	['are_on_the_eastern_boundary_of_the_Shanwick_OCA'], !.

% atomic_wff(is_on_the_eastern_boundary_of_the_Shanwick_OCA(Long)) -->
% 	term('Long', Long), 
% 	['is_on_the_eastern_boundary_of_the_Shanwick_OCA'], !.

atomic_wff(is_at_or_is_west_of_the_eastern_Shanwick_OCA_boundary(Long)) -->
	term('Long', Long), 
	['is_at_or_is_west_of_the_eastern_Shanwick_OCA_boundary'], !.

atomic_wff(is_west_of_the_eastern_Shanwick_OCA_boundary(Long)) -->
	term('Long', Long), 
	['is_west_of_the_eastern_Shanwick_OCA_boundary'], !.

atomic_wff(is_at_or_is_east_of_the_eastern_Shanwick_OCA_boundary(Long)) -->
	term('Long', Long), 
	['is_at_or_is_east_of_the_eastern_Shanwick_OCA_boundary'], !.

atomic_wff(is_east_of_the_eastern_Shanwick_OCA_boundary(Long)) -->
	term('Long', Long), 
	['is_east_of_the_eastern_Shanwick_OCA_boundary'], !.

atomic_wff(is_at_the_last_recognised_pt_for_oceanic_cpr_of(Long,Profile)) -->
	term('Long', Long),
	['is_at_the_last_recognised_pt_for_oceanic_cpr_of'], term('Profile',Profile), !.

/* ************************************************************************
Flight_level wffs.
------------------------------------------------------------------------ */

:- op(100, xfx, is_at_or_above).
atomic_wff((Flight_level1 is_at_or_above Flight_level2))  -->  
	term('Flight_level',  Flight_level1), ['is_at_or_above'], 
	term('Flight_level',  Flight_level2), !.

:- op(100, xfx, is_at_or_below).
atomic_wff((Flight_level1 is_at_or_below Flight_level2))  -->  
	term('Flight_level',  Flight_level1), ['is_at_or_below'], 
	term('Flight_level',  Flight_level2), !.

:- op(100, xfx, is_above).
atomic_wff((Flight_level1 is_above Flight_level2))  -->  
	term('Flight_level',  Flight_level1), ['is_above'], 
	term('Flight_level',  Flight_level2), !.

:- op(100, xfx, is_below).
atomic_wff((Flight_level1 is_below Flight_level2))  -->  
	term('Flight_level',  Flight_level1), ['is_below'], 
	term('Flight_level',  Flight_level2), !.

atomic_wff(both_are_at_or_below(Flight_level1,Flight_level2,Flight_level3)) -->
	['both'], term('Flight_level',  Flight_level1), [and], 
	term('Flight_level',  Flight_level2),
	['are_at_or_below'],  term('Flight_level',  Flight_level3), !.

atomic_wff(both_are_above(Flight_level1,Flight_level2,Flight_level3)) -->
	['both'], term('Flight_level',  Flight_level1), [and], 
	term('Flight_level',  Flight_level2),
	['are_above'],  term('Flight_level',  Flight_level3), !.

atomic_wff(one_or_both_are_at_or_below(Flight_level1,Flight_level2,Flight_level3)) -->
	['one_or_both_of'], term('Flight_level',  Flight_level1), [and], 
	term('Flight_level',  Flight_level2), ['are_at_or_below'],  
	term('Flight_level',  Flight_level3), !.

atomic_wff(one_or_both_are_above(Flight_level1,Flight_level2,Flight_level3)) -->
	['one_or_both_of'], term('Flight_level',  Flight_level1), [and], 
	term('Flight_level',  Flight_level2), ['are_above'],  term('Flight_level',  Flight_level3), !.


/* ************************************************************************
Times wffs.
------------------------------------------------------------------------ */

:- op(100, xfx, is_at_or_later_than).
atomic_wff((Time1 is_at_or_later_than Time2))  -->  
	term('Time',Time1), ['is_at_or_later_than'], term('Time',Time2), !.

:- op(100, xfx, is_at_or_earlier_than).
atomic_wff((Time1 is_at_or_earlier_than Time2))  -->  
	term('Time',Time1), ['is_at_or_earlier_than'], term('Time',Time2), !.

:- op(100, xfx, is_earlier_than).
atomic_wff((Time1 is_earlier_than Time2))  -->  
	term('Time',Time1), ['is_earlier_than'], term('Time',Time2), !.

:- op(100, xfx, is_later_than).
atomic_wff((Time1 is_later_than Time2))  -->  
	term('Time',Time1), ['is_later_than'], term('Time',Time2), !.


/* ************************************************************************
2D_pts wffs.
------------------------------------------------------------------------ */ 

atomic_wff(is_a_prox_airfield_pt(TwoD_pt)) -->  
	 term('2D_pt',TwoD_pt), ['is_a_prox_airfield_pt'], !.

atomic_wff(is_on_the_Shanwick_OCA_boundary(TwoD_pt)) -->  
	 term('2D_pt',TwoD_pt), ['is_on_the_Shanwick_OCA_boundary'], !.

atomic_wff(is_on_the_eastern_boundary_of_the_Shanwick_OCA(TwoD_pt)) -->  
	 term('2D_pt',TwoD_pt), 
	 ['is_on_the_eastern_boundary_of_the_Shanwick_OCA'], !.

atomic_wff(is_on_the_western_boundary_of_the_Shanwick_OCA(TwoD_pt)) -->  
	 term('2D_pt',TwoD_pt),
	 ['is_on_the_western_boundary_of_the_Shanwick_OCA'], !.

atomic_wff(is_on_the_northern_boundary_of_the_Shanwick_OCA(TwoD_pt)) -->  
	 term('2D_pt',TwoD_pt),
	 ['is_on_the_northern_boundary_of_the_Shanwick_OCA'], !.

atomic_wff(is_on_the_southern_boundary_of_the_Shanwick_OCA(TwoD_pt)) -->  
	 term('2D_pt',TwoD_pt),
	 ['is_on_the_southern_boundary_of_the_Shanwick_OCA'], !.

atomic_wff(is_a_2D_pt_west_of_the_eastern_Shanwick_OCA_boundary(TwoD_pt)) -->
	 term('2D_pt',TwoD_pt),
	['is_a_2D_pt_west_of_the_eastern_Shanwick_OCA_boundary'], !.

/* ************************************************************************
3D_pts wffs. (none apart from equality and inequality)
------------------------------------------------------------------------ */ 


/* ************************************************************************
4D_pts wffs. (none apart from equality and inequality)
------------------------------------------------------------------------ */ 


/* ************************************************************************
Profiles wffs.
------------------------------------------------------------------------ */

atomic_wff(is_a_min_long_sep_value_in_mins_entered_via_the_mst_command(Profile,Val)) -->  
	val_term(Val),  ['is_a_min_long_sep_value_in_mins_for'],
	term('Profile',Profile), ['entered_via_the_mst_command'], !.

atomic_wff(is_wholly_or_partly_in_the_mnps_airspace(Profile)) -->  
	term('Profile',Profile), ['is_wholly_or_partly_in_the_mnps_airspace'], 
	!.

atomic_wff(is_wholly_outside_the_mnps_airspace(Profile)) -->  
	term('Profile',Profile), ['is_wholly_outside_the_mnps_airspace'], !.

atomic_wff(is_wholly_within_the_mnps_airspace(Profile)) -->  
	term('Profile',Profile), ['is_wholly_within_the_mnps_airspace'], !.

atomic_wff(is_wholly_or_partly_in_oca(Profile)) -->  
	term('Profile',Profile), ['is_wholly_or_partly_in_oca'], !.

atomic_wff(profiles_are_in_oceanic_conflict(Segment1,Profile1,Segment2,Profile2)) -->  
	term('Segment',Segment1), [of], term('Profile',Profile1),  
        [and], term('Segment',Segment2), [of], term('Profile',Profile2), 
	['are_in_oceanic_conflict'], !.

atomic_wff(both_aircraft_on_are_grounded_at_prox_airfields_at_time_of_current_conflict_probe(Profile1,Profile2)) -->
	['both_aircraft_on'], 
	 term('Profile',Profile1), [and], term('Profile',Profile2),
	 ['are_grounded_at_prox_airfields_at_time_of_current_conflict_probe'], 
	 !.

atomic_wff(only_one_of_the_aircraft_on_is_grounded_at_a_prox_airfield_at_time_of_current_conflict_probe(Profile1,Profile2)) -->
	['only_one_of_the_aircraft_on'], 
	 term('Profile',Profile1), [and], term('Profile',Profile2),
	 ['is_grounded_at_a_prox_airfield_at_time_of_current_conflict_probe'], 
	 !.

atomic_wff(neither_of_the_aircraft_on_is_grounded_at_prox_airfields_at_time_of_current_conflict_probe(Profile1,Profile2)) -->
	['neither_of_the_aircraft_on'], 
	 term('Profile',Profile1),  [and], term('Profile',Profile2),
	 ['is_grounded_at_a_prox_airfield_at_time_of_current_conflict_probe'], 
	 !.

atomic_wff(aircraft_on_is_grounded_at_a_prox_airfield_at_time_of_current_conflict_probe(Profile)) -->
	['aircraft_on'], 
	 term('Profile',Profile), 
	 ['is_grounded_at_a_prox_airfield_at_time_of_current_conflict_probe'], 	
	!.

atomic_wff(are_wholly_or_partly_in_the_mnps_airspace(Profile1,Profile2)) -->
	term('Profile',Profile1), [and], term('Profile',Profile2),
	['are_wholly_or_partly_in_the_mnps_airspace'], !.

atomic_wff(one_or_both_of_is_wholly_outside_the_mnps_airspace(Profile1,Profile2)) -->
	['one_or_both_of'], term('Profile',Profile1), [and], 
	term('Profile',Profile2),  ['is_wholly_outside_the_mnps_airspace'], !.

atomic_wff(are_wholly_within_the_mnps_airspace(Profile1,Profile2)) -->
	term('Profile',Profile1), [and], term('Profile',Profile2),
	['are_wholly_within_the_mnps_airspace'], !.

atomic_wff(the_linear_tracks_of_continuously_diverge_to_provide_at_least_120NM_separation_by_20_degrees_west(Profile1,Profile2)) -->
	['the_linear_tracks_of'], term('Profile',Profile1), [and], term('Profile',Profile2),
	['continuously_diverge_to_provide_at_least_120NM_separation_by_20_degrees_west'], !.

atomic_wff(the_linear_tracks_of_are_separated_by_at_least_120NM_at_20_degrees_west(Profile1,Profile2)) -->
	['the_linear_tracks_of'], term('Profile',Profile1), [and], term('Profile',Profile2),
	['are_separated_by_at_least_120NM_separation_at_20_degrees_west'], !.

atomic_wff(are_laterally_separated_at_the_eastern_Shanwick_OCA_boundary(Profile1,Profile2)) -->
	term('Profile',Profile1),
	[and], term('Profile',Profile2), ['are_laterally_separated_at_the_eastern_Shanwick_OCA_boundary'], !.

atomic_wff(the_linear_tracks_of_from_the_eastern_Shanwick_OCA_boundary_do_not_cross_prior_to_their_respective_last_recognised_points(Profile1,Profile2)) -->
	['the_linear_tracks_of'], term('Profile',Profile1), [and], term('Profile',Profile2),
	['from_the_eastern_Shanwick_OCA_boundary_do_not_cross_prior_to_their_respective_last_recognised_points'], !.

atomic_wff(are_not_cleared_to_the_same_last_recognised_pt(Profile1,Profile2)) -->
	term('Profile',Profile1),
	[and], term('Profile',Profile2), ['are_not_cleared_to_the_same_last_recognised_pt'], !.

atomic_wff(the_linear_tracks_of_diverge_continuously(Profile1,Profile2)) -->
	['the_linear_tracks_of'], term('Profile',Profile1), [and], term('Profile',Profile2),
	['diverge_continuously'], !.

/* ************************************************************************
Segments wffs.
------------------------------------------------------------------------ */ 

atomic_wff(time_periods_overlap(Segment1,Segment2)) -->  
	['time_periods_of'], term('Segment',Segment1), [and], 
	term('Segment',Segment2), ['overlap'], !.

atomic_wff(flight_level_ranges_overlap(Segment1,Segment2)) -->  
	['flight_level_ranges_of'], term('Segment',Segment1), [and], 
	term('Segment',Segment2), ['overlap'], !.

:- op(100, xfx, lies_in_flight_level_range_of).
atomic_wff((Flight_level lies_in_flight_level_range_of Segment)) -->  
	term('Flight_level',  Flight_level), ['lies_in_flight_level_range_of'], 
	term('Segment',Segment), !.

atomic_wff(belong_to_profiles_for_different_aircraft(Segment1,Segment2))  -->  
	term('Segment',Segment1), [and], 
	term('Segment',Segment2), ['belong_to_profiles_for_different_aircraft'],
	!.

atomic_wff(one_or_both_start_later_than(Segment1,Segment2,Time)) -->  
	['one_or_both_of'], term('Segment',Segment1), [and], 
	term('Segment',Segment2), ['start_later_than'], term('Time',Time), !.

atomic_wff(is_westerly(Segment)) -->  
	 term('Segment',Segment), ['is_westerly'], !.

atomic_wff(is_easterly(Segment)) -->  
	 term('Segment',Segment), ['is_easterly'], !.

atomic_wff(finishes_at_or_earlier_than_starts(Segment1,Segment2)) -->  
	term('Segment',Segment1), ['finishes_at_or_earlier_than'], 
	term('Segment',Segment2), ['starts'], !.

atomic_wff(regular(Segment))  -->  
	['regular'], ['('], term('Segment',Segment),  [')'], !.

atomic_wff(irregular(Segment)) -->  
	['irregular'], ['('], term('Segment',Segment),  [')'], !.

atomic_wff(is_cruise_climbed(Segment)) -->  
	 term('Segment',Segment), ['is_cruise_climbed'], !.

:- op(100, xfx, is_during_time_period_of).
atomic_wff((Time is_during_time_period_of Segment)) --> 
	 term('Time',Time), ['is_during_time_period_of'], 
	 term('Segment',Segment), !.
	
:- op(100, xfx, belongs_to).
atomic_wff((Segment belongs_to Profile)) --> 
          term('Segment',Segment) , ['belongs_to'], term('Profile',Profile), !.

atomic_wff(segments_are_in_oceanic_conflict(Segment1,Segment2)) -->  
	term('Segment',Segment1),  [and], term('Segment',Segment2), 
	['are_in_oceanic_conflict'], !.

atomic_wff(are_in_vertical_oceanic_conflict(Segment1,Segment2)) -->  
	term('Segment',Segment1),  [and], term('Segment',Segment2), 
	['are_in_vertical_oceanic_conflict'], !.

atomic_wff(are_in_lateral_and_longitudinal_oceanic_conflict(Segment1,Segment2)) -->  
	term('Segment',Segment1),  [and], term('Segment',Segment2), 
	['are_in_lateral_and_longitudinal_oceanic_conflict'], !.

atomic_wff(are_subject_to_oceanic_cpr(Segment1,Segment2)) -->  
	term('Segment',Segment1),  [and], term('Segment',Segment2), 
	['are_subject_to_oceanic_cpr'], !.

atomic_wff(oceanic_separation_rules_are_applicable_to(Segment)) -->  
	['oceanic_separation_rules_are_applicable_to'], ['('], 
	term('Segment',Segment),  [')'], !.

atomic_wff(starts_at_or_after_first_recognised_pt_for_oceanic_cpr(Segment)) --> 
        term('Segment',Segment) , 
	['starts_at_or_after_first_recognised_pt_for_oceanic_cpr'], !.

atomic_wff(ends_at_or_before_last_recognised_pt_for_oceanic_cpr(Segment)) --> 
        term('Segment',Segment) ,
	['ends_at_or_before_last_recognised_pt_for_oceanic_cpr'], !.

atomic_wff(box_conflict_exists_between_linear_tracks_of_at_some_time_at_or_between(Segment1,Segment2,Time1,Time2)) -->  
	['box_conflict_exists_between_linear_tracks_of'],
 	term('Segment',Segment1),  [and], term('Segment',Segment2), 
	['at_some_time_at_or_between'],  term('Time',Time1),  [and],
	term('Time',Time2), !.

atomic_wff(box_conflict_exists_between_linear_tracks_of_at(Segment1,Segment2,Time)) -->  
	['box_conflict_exists_between_linear_tracks_of'],
 	term('Segment',Segment1),  [and], term('Segment',Segment2), 
	['at'],  term('Time',Time), !.

atomic_wff(steep(Segment)) -->  
	['steep'], ['('], term('Segment',Segment),  [')'], !.

atomic_wff(are_deemed_to_be_laterally_separated(Segment1,Segment2)) -->  
	term('Segment',Segment1),  [and], term('Segment',Segment2), 
	['are_deemed_to_be_laterally_separated'], !.

atomic_wff(are_westerly_and_deemed_to_be_laterally_separated(Segment1,Segment2)) -->  
	term('Segment',Segment1),  [and], term('Segment',Segment2), 
	['are_westerly_and_deemed_to_be_laterally_separated'], !.

atomic_wff(are_easterly_and_deemed_to_be_laterally_separated(Segment1,Segment2)) -->  
	term('Segment',Segment1),  [and], term('Segment',Segment2), 
	['are_easterly_and_deemed_to_be_laterally_separated'], !.

atomic_wff(both_are_flown_in_level_flight(Segment1,Segment2)) -->
	['both'], term('Segment',Segment1), [and], term('Segment',Segment2), 
	['are_flown_in_level_flight'], !.

atomic_wff(one_or_both_of_is_not_flown_in_level_flight(Segment1,Segment2)) -->
	['one_or_both_of'], term('Segment',Segment1), [and], 
	term('Segment',Segment2), ['is_not_flown_in_level_flight'], !.

atomic_wff(are_cruise_climbed(Segment1,Segment2)) -->
	term('Segment',Segment1), [and], term('Segment',Segment2),
	['are_cruise_climbed'], !.

atomic_wff(are_not_cruise_climbed(Segment1,Segment2)) -->
	term('Segment',Segment1), [and], term('Segment',Segment2),
	['are_not_cruise_climbed'], !.

atomic_wff(or_cruise_climbed(Segment1,Segment2)) -->
	term('Segment',Segment1), ['or'], term('Segment',Segment2),
	['is_cruise_climbed'], !.

atomic_wff(is_flown_in_level_flight(Segment)) -->
	term('Segment',Segment), ['is_flown_in_level_flight'], !.

atomic_wff(both_are_flown_at_supersonic_speed(Segment1,Segment2)) -->
	['both'], term('Segment',Segment1), [and], term('Segment',Segment2), 
	['are_flown_at_supersonic_speed'], !.

atomic_wff(one_or_both_of_are_flown_at_subsonic_speed(Segment1,Segment2)) -->
	['one_or_both_of'], term('Segment',Segment1), [and], 
	term('Segment',Segment2), ['are_flown_at_subsonic_speed'], !.

atomic_wff(both_are_flown_at_subsonic_speed(Segment1,Segment2)) -->
	['both'], term('Segment',Segment1), [and], term('Segment',Segment2), 
	['are_flown_at_subsonic_speed'], !.

atomic_wff(one_or_both_of_are_flown_at_supersonic_speed(Segment1,Segment2)) -->
	['one_or_both_of'], term('Segment',Segment1), [and], 
	term('Segment',Segment2), ['are_flown_at_supersonic_speed'], !.

atomic_wff(both_are_flown_at_the_same_mach_number_in_level_flight(Segment1,Segment2)) -->
	['both'], term('Segment',Segment1), [and], term('Segment',Segment2), 
	['are_flown_at_the_same_mach_number_in_level_flight'], !.

atomic_wff(both_are_flown_at_the_same_mach_number(Segment1,Segment2)) -->
	['both'], term('Segment',Segment1), [and], term('Segment',Segment2), 
	['are_flown_at_the_same_mach_number'], !.

atomic_wff(one_or_both_of_finish_at_or_after(Segment1,Segment2,Time)) -->
	['one_or_both_of'], term('Segment',Segment1), [and],
	term('Segment',Segment2), ['finish_at_or_after'], term('Time',Time), !.

atomic_wff(both_finish_before(Segment1,Segment2,Time)) -->
	['both'], term('Segment',Segment1), [and],
	term('Segment',Segment2), ['finish_before'], term('Time',Time), !.

atomic_wff(is_in_overlap_time_window_for(Time,Segment1,Segment2)) -->
	term('Time',Time), ['is_in_overlap_time_window_for'], 
	term('Segment',Segment1), [and], term('Segment',Segment2), !.

atomic_wff(min_flight_level_of_upper_segment_of_is_above_max_flight_level_of_lower_segment_by_less_than_required_min_vert_sep(Segment1,Segment2)) -->
	['min_flight_level_of_upper_segment_of'], 
	term('Segment',Segment1), [and], term('Segment',Segment2), 
	['is_above_max_flight_level_of_lower_segment_by_less_than_required_min_vert_sep'], !.

atomic_wff(exit_flight_level_of_does_not_have_required_vert_sep_wrt(Segment1,Segment2)) -->
	['exit_flight_level_of'], term('Segment',Segment1),
	['does_not_have_required_vert_sep_wrt'], term('Segment',Segment2), !.

atomic_wff(no_segment_after_which_has_been_exited_by_has_a_flight_level_with_at_least_required_min_vert_sep_wrt(Segment1,Time,Segment2)) -->
	['no_segment_after'], term('Segment',Segment1),
	['which_has_been_exited_by'], term('Time',Time),
 	['has_a_flight_level_with_at_least_required_min_vert_sep_wrt'],
	term('Segment',Segment2), !.

atomic_wff(entry_flight_level_of_has_required_vert_sep_wrt(Segment1,Segment2)) -->
	['entry_flight_level_of'], term('Segment',Segment1),
	['has_required_vert_sep_wrt'], term('Segment',Segment2), !.

atomic_wff(exit_flight_level_of_has_required_vert_sep_wrt(Segment1,Segment2)) -->
	['exit_flight_level_of'], term('Segment',Segment1),
	['has_required_vert_sep_wrt'], term('Segment',Segment2), !.

atomic_wff(abs_magnitude_of_lat_over_long_gradient_of_exceeds(Segment,Val)) -->
	['abs_magnitude_of_lat_over_long_gradient_of'], term('Segment',Segment),
	['exceeds'], val_term(Val),  !.

atomic_wff(position_on_linear_track_of_at_is(Segment,Time,Linear_track_pt)) -->
	['position_on_linear_track_of'], term('Segment',Segment),
	['at'], term('Time',Time), ['is'], term('Linear_track_pt',Linear_track_pt), !.

atomic_wff(is_on_linear_track_or_extended_linear_track_of_at_the_intersection_with_longitude_coord(Linear_track_pt,Segment,Val)) -->
	term('Linear_track_pt',Linear_track_pt),
	['is_on_linear_track_or_extended_linear_track_of'], 
	term('Segment',Segment),
	['at_the_intersection_with_longitude_coord'], val_term(Val), !.

atomic_wff(is_on_linear_track_or_extended_linear_track_of_at_the_intersection_with_latitude_coord(Linear_track_pt,Segment,Val)) -->
	term('Linear_track_pt',Linear_track_pt),
	['is_on_linear_track_or_extended_linear_track_of'], 
	term('Segment',Segment),
	['at_the_intersection_with_latitude_coord'], val_term(Val), !.

atomic_wff(starts_at_or_crosses_the_eastern_Shanwick_OCA_boundary(Segment)) -->
	term('Segment',Segment),
	['starts_at_or_crosses_the_eastern_Shanwick_OCA_boundary'], !.

atomic_wff(are_laterally_separated(Segment1,Segment2)) -->
	term('Segment',Segment1),
	[and], term('Segment',Segment2), ['are_laterally_separated'], !.

atomic_wff(the_linear_tracks_of_cross(Segment1,Segment2)) -->
	['the_linear_tracks_of'], term('Segment',Segment1),
	[and], term('Segment',Segment2), ['cross'], !.

atomic_wff(is_wholly_outside_oca(Segment)) -->
	term('Segment',Segment), ['is_wholly_outside_oca'], !.

atomic_wff(reduced_separation_conditions_apply_to(Segment1,Segment2)) -->
	['reduced_separation_conditions_apply_to'], term('Segment',Segment1), 
	[and], term('Segment',Segment2), !.

atomic_wff(the_linear_tracks_of_diverge(Segment1,Segment2)) -->
	['the_linear_tracks_of'], term('Segment',Segment1), [and], term('Segment',Segment2),
	['diverge'], !.

atomic_wff(the_linear_tracks_of_do_not_cross(Segment1,Segment2)) -->
	['the_linear_tracks_of'], term('Segment',Segment1), [and], 
	term('Segment',Segment2), ['do_not_cross'], !.

atomic_wff(is_on_the_linear_track_of(TwoD_pt,Segment)) -->
	term('2D_pt',TwoD_pt), ['is_on_the_linear_track_of'], 	
	term('Segment',Segment), !.

atomic_wff(are_after_a_common_pt_from_which_profile_tracks_are_same_or_diverging_thereafter_and_at_which_both_aircraft_have_already_reported_by(Segment1,Segment2,Time)) -->
	term('Segment',Segment1),
	[and], term('Segment',Segment2), ['are_after_a_common_pt_from_which_profile_tracks_are_same_or_diverging_thereafter_and_at_which_both_aircraft_have_already_reported_by'],	term('Time',Time), !.

atomic_wff(are_after_a_common_pt_from_which_profile_tracks_are_same_thereafter(Segment1,Segment2)) -->
	term('Segment',Segment1),
	[and], term('Segment',Segment2), ['are_after_a_common_pt_from_which_profile_tracks_are_same_thereafter'], !.

atomic_wff(are_after_a_common_pt_from_which_profile_tracks_are_diverging_thereafter(Segment1,Segment2)) -->
	term('Segment',Segment1),
	[and], term('Segment',Segment2), ['are_after_a_common_pt_from_which_profile_tracks_are_diverging_thereafter'], !.

atomic_wff(the_preceding_aircraft_on_or_on_is_not_faster_by_or_more(Segment1,Segment2,Val)) -->
	['the_preceding_aircraft_on'], term('Segment',Segment1), 
	['or_on'], term('Segment',Segment2),
	['is_not_faster_by'], val_term(Val), ['mach_or_more'], !.

atomic_wff(the_preceding_aircraft_on_or_on_is_faster_by(Segment1,Segment2,Val)) -->
	['the_preceding_aircraft_on'], term('Segment',Segment1), 
	['or_on'], term('Segment',Segment2),
	['is_faster_by'], val_term(Val), ['mach'], !.

atomic_wff(the_preceding_aircraft_on_or_on_is_faster_by_at_least(Segment1,Segment2,Val)) -->
	['the_preceding_aircraft_on'], term('Segment',Segment1), 
	['or_on'], term('Segment',Segment2),
	['is_faster_by_at_least'], val_term(Val),  ['mach'], !.

atomic_wff(the_preceding_aircraft_on_or_on_is_faster_by_at_least_mach_but_not_more_than(Segment1,Segment2,Val1,Val2)) -->
	['the_preceding_aircraft_on'], term('Segment',Segment1), 
	['or_on'], term('Segment',Segment2),
	['is_faster_by_at_least'], val_term(Val1), ['mach_but_not_more_than'],
	val_term(Val2),  ['mach'], !.

atomic_wff(the_aircraft_on_segment1_precedes_the_aircraft_on_segment2(Segment1,Segment2)) -->
	['the_aircraft_on'], term('Segment',Segment1), 
	['precedes_the_aircraft_on'], term('Segment',Segment2), !.

atomic_wff(the_linear_tracks_of_are_the_same(Segment1,Segment2)) -->
	['the_linear_tracks_of'], term('Segment',Segment1),
	[and], term('Segment',Segment2), ['are_the_same'], !.

atomic_wff(are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_same_or_diverging_thereafter(Segment1,Segment2)) -->
	term('Segment',Segment1), [and], term('Segment',Segment2),
	['are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_same_or_diverging_thereafter'],
	!.

atomic_wff(are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_same_thereafter(Segment1,Segment2)) -->
	term('Segment',Segment1), [and], term('Segment',Segment2),
	['are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_same_thereafter'], !.

atomic_wff(are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_diverging_thereafter(Segment1,Segment2)) -->
	term('Segment',Segment1), [and], term('Segment',Segment2),
	['are_after_a_common_pt_on_the_shanwick_boundary_from_which_profile_tracks_are_diverging_thereafter'], !.

/* ************************************************************************
Linear_track_pts wffs.
------------------------------------------------------------------------ */ 

atomic_wff(is_within_conflict_box_of(Linear_track_pt2,Linear_track_pt1)) -->  
	term('Linear_track_pt',Linear_track_pt2), ['is_within_conflict_box_of'],
	term('Linear_track_pt',Linear_track_pt1), !.

atomic_wff(is_not_in_lateral_conflict_with(Linear_track_pt2,Linear_track_pt1)) -->  
	term('Linear_track_pt',Linear_track_pt2), 
	['is_not_in_lateral_conflict_with'],
	term('Linear_track_pt',Linear_track_pt1), !.

/* ************************************************************************
Airspace wffs.
------------------------------------------------------------------------ */ 

atomic_wff(is_the_max_flight_level_for(Flight_level,Airspace)) -->
	term('Flight_level',  Flight_level),
	['is_the_max_flight_level_for'], 
	term('Airspace',Airspace), ['airspace'], !.

atomic_wff(is_the_min_flight_level_for(Flight_level,Airspace)) -->
	term('Flight_level',  Flight_level),
	['is_the_min_flight_level_for'], 
	term('Airspace',Airspace), ['airspace'], !.

atomic_wff(overlaps_with_the_flight_level_range_of_airspace(Flight_level_range,Airspace)) -->
	term('Flight_level_range',  Flight_level_range),
	['overlaps_with_the_flight_level_range_of_the'], 
	term('Airspace',Airspace), ['airspace'], !.

atomic_wff(is_the_max_flight_level_for_airspaces(Flight_level,Airspace1,Airspace2)) -->
	term('Flight_level',  Flight_level),
	['is_the_max_flight_level_for'], 
	term('Airspace',Airspace1), ['and'], term('Airspace',Airspace2),
	['airspaces'], !.

atomic_wff(is_the_min_flight_level_for_airspaces(Flight_level,Airspace1,Airspace2)) -->
	term('Flight_level',  Flight_level),
	['is_the_min_flight_level_for'], 
	term('Airspace',Airspace1), ['and'], term('Airspace',Airspace2),
	['airspaces'], !.

atomic_wff(are_vertices_for(TwoD_pt1,TwoD_pt2,Airspace)) -->
	term('2D_pt',  TwoD_pt1),
	['and'], term('2D_pt',  TwoD_pt2),
        ['are_vertices_for'], term('Airspace', Airspace),
	['airspace'], !.

/* ************************************************************************
Wffs involving undefined predicates (for which axiomatic definitions will
be added to conflict prediction spec. later).
------------------------------------------------------------------------ */ 

atomic_wff(if_are_on_profiles_which_diverge_then_longitudinal_separation_is_at_least_5_mins_where_lateral_separation_of_60nm_is_achieved(Segment1,Segment2)) -->
	['if'], term('Segment',Segment1), 
	[and], term('Segment',Segment2),
	['are_on_profiles_which_diverge_then_longitudinal_separation_is_at_least_5_mins_where_lateral_separation_of_60nm_is_achieved'], !.

atomic_wff(is_within_lateral_and_longitudinal_boundaries_of_airspace(TwoD_pt,Airspace)) -->
	term('2D_pt',TwoD_pt),
	['is_within_lateral_and_longitudinal_boundaries_of_the'], 
	term('Airspace',Airspace), ['airspace'], !.


