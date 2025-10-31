/datum/dynamic_ruleset/midround/from_ghosts/cortical_borer
	signup_atom_appearance = /mob/living/basic/cortical_borer
	false_alarm_able = TRUE
	ruleset_flags = RULESET_INVADER
	weight = list(
		DYNAMIC_TIER_LOW = 3,
		DYNAMIC_TIER_LOWMEDIUM = 2,
		DYNAMIC_TIER_MEDIUMHIGH = 1,
		DYNAMIC_TIER_HIGH = 1,
	)
	min_pop = 5
	max_antag_cap = 3
	min_antag_cap = 1
	repeatable_weight_decrease = 3

/datum/dynamic_ruleset/midround/from_ghosts/cortical_borer/can_be_selected()
	return ..() && length(find_vents()) > 0

/datum/dynamic_ruleset/midround/from_ghosts/cortical_borer/execute()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(announce_borers)), rand(375, 600) SECONDS)

/datum/dynamic_ruleset/midround/from_ghosts/cortical_borer/proc/announce_borers()
	priority_announce("Unidentified lifesigns detected coming aboard [station_name()]. Secure any exterior access, including ducting and ventilation.", "Lifesign Alert", ANNOUNCER_ALIENS)

/datum/dynamic_ruleset/midround/from_ghosts/cortical_borer/false_alarm()
	announce_borers()
