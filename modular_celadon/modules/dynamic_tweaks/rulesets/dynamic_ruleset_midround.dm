/datum/dynamic_ruleset/midround/from_living/heretic
	name = "Heretic"
	config_tag = "Sleeper Heretic"
	preview_antag_datum = /datum/antagonist/heretic
	midround_type = LIGHT_MIDROUND
	false_alarm_able = FALSE
	pref_flag = ROLE_MIDROUND_HERETIC
	jobban_flag = ROLE_HERETIC
	ruleset_flags = RULESET_VARIATION
	weight = 3
	min_pop = 15
	blacklisted_roles = list(
		JOB_HEAD_OF_PERSONNEL,
	)
	min_enemies = 1

/datum/dynamic_ruleset/midround/from_living/heretic/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/heretic)

/datum/dynamic_ruleset/midround/from_living/changeling
	name = "Changeling"
	config_tag = "Sleeper Changeling"
	preview_antag_datum = /datum/antagonist/changeling
	midround_type = LIGHT_MIDROUND
	false_alarm_able = FALSE
	pref_flag = ROLE_MIDROUND_CHANGELING
	jobban_flag = ROLE_CHANGELING
	ruleset_flags = RULESET_VARIATION
	weight = 3
	min_pop = 15
	blacklisted_roles = list(
		JOB_HEAD_OF_PERSONNEL,
	)
	min_enemies = 1

/datum/dynamic_ruleset/midround/from_living/changeling/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/changeling)

/datum/dynamic_ruleset/midround/from_living/heretic/mass
	name = "Mass Heretics"
	config_tag = "Mass Heretics"
	midround_type = HEAVY_MIDROUND
	min_pop = 25
	min_antag_cap = 2
	max_antag_cap = 4
	repeatable_weight_decrease = 5
	blacklisted_roles = list()
	weight = alist(
		DYNAMIC_TIER_LOW = 0,
		DYNAMIC_TIER_LOWMEDIUM = 1,
		DYNAMIC_TIER_MEDIUMHIGH = 3,
		DYNAMIC_TIER_HIGH = 6,
	)
