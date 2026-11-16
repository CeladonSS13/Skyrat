/datum/dynamic_ruleset/latejoin/heretic
	name = "Heretic"
	config_tag = "Latejoin Heretic"
	preview_antag_datum = /datum/antagonist/heretic
	pref_flag = ROLE_HERETIC_SMUGGLER
	jobban_flag = ROLE_HERETIC
	weight = 3
	min_pop = 30 // Ensures good spread of sacrifice targets
	ruleset_lazy_templates = list(LAZY_TEMPLATE_KEY_HERETIC_SACRIFICE)
	blacklisted_roles = list(
		JOB_HEAD_OF_PERSONNEL,
	)

/datum/dynamic_ruleset/latejoin/heretic/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/heretic)
