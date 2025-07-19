/datum/dynamic_ruleset
	var/list/restricted_species = list()

/datum/dynamic_ruleset/trim_candidates()
	..()
	if (!candidates || candidates.len < 1 || !restricted_species || restricted_species.len < 1)
		return

	for(var/mob/candidate_player in candidates)
		var/client/candidate_client = GET_CLIENT(candidate_player)
		if (!candidate_client || !candidate_player.mind) // Are they connected?
			continue // is handled by parent proc, this check here only for safety, not removal

		var/datum/species/species_type = candidate_client.prefs?.read_preference(/datum/preference/choiced/species)

		if (!species_type)
			continue

		var/species_text_path = "[species_type]"
		if (species_text_path in restricted_species)
			candidates -= candidate_player
