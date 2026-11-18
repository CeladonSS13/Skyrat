/datum/dynamic_ruleset/midround/from_ghosts/cortical_borer
	signup_atom_appearance = /mob/living/basic/cortical_borer
	false_alarm_able = TRUE
	ruleset_flags = RULESET_INVADER
	weight = alist(
		DYNAMIC_TIER_LOW = 3,
		DYNAMIC_TIER_LOWMEDIUM = 2,
		DYNAMIC_TIER_MEDIUMHIGH = 1,
		DYNAMIC_TIER_HIGH = 1,
	)
	min_pop = 5
	max_antag_cap = 3
	min_antag_cap = 1
	repeatable_weight_decrease = 3
	var/datum/weakref/first_vent_ref // harddel paranoid

/datum/dynamic_ruleset/midround/from_ghosts/cortical_borer/can_be_selected()
	if (!..())
		return FALSE

	var/list/vent_list = find_vents()
	if (!vent_list || length(vent_list) < 1)
		return FALSE

	first_vent_ref = WEAKREF(vent_list[1])
	return TRUE

/datum/dynamic_ruleset/midround/from_ghosts/cortical_borer/create_ruleset_body()
	var/loc_to_place
	if (first_vent_ref)
		var/obj/machinery/atmospherics/components/unary/vent_pump = first_vent_ref.resolve()
		if (vent_pump)
			loc_to_place = vent_pump.loc
	else
		first_vent_ref = null

	return new /mob/living/basic/cortical_borer(loc_to_place) // so we place them temporaly here before to avoid runtimes related to nullspace

/datum/dynamic_ruleset/midround/from_ghosts/cortical_borer/execute()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(announce_borers)), rand(375, 600) SECONDS)

/datum/dynamic_ruleset/midround/from_ghosts/cortical_borer/proc/announce_borers()
	priority_announce("Unidentified lifesigns detected coming aboard [station_name()]. Secure any exterior access, including ducting and ventilation.", "Lifesign Alert", ANNOUNCER_ALIENS)

/datum/dynamic_ruleset/midround/from_ghosts/cortical_borer/false_alarm()
	announce_borers()
