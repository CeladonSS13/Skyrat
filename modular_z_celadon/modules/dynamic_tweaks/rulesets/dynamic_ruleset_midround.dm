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

/datum/dynamic_ruleset/midround/from_living/obsesed
	var/required_security_to_receive_security_obsession = 3
	VAR_PRIVATE/last_valid_enemies_count = 0 // required to run expensive operations only once, it's "last" in terms of variable name, but actually usage as if it's current now
	var/list/apply_security_amount_for_extra_roles = list(
		JOB_NT_REP,
	)

/datum/dynamic_ruleset/midround/from_living/obsesed/collect_candidates()
	. = ..()
	last_valid_enemies_count = length(get_all_valid_enemies_for_midround_latejoin()) // cache it each time at this stage

/datum/dynamic_ruleset/midround/from_living/obsesed/is_valid_candidate(mob/candidate, client/candidate_client)
	. = ..()
	if (!.)
		return .

	var/jobtitle = "[candidate.mind.assigned_role.title]"
	if ((jobtitle in enemy_roles) || (jobtitle in apply_security_amount_for_extra_roles))
		// if at least 3 - then true, otherwise false
		return !(last_valid_enemies_count < required_security_to_receive_security_obsession)
	return .

/datum/dynamic_ruleset/midround/from_living/obsesed/get_blacklisted_roles()
	return get_always_blacklisted_roles() // SKIPS CONFIG BLACKLISTED ROLES (such as security, because they are protected)
