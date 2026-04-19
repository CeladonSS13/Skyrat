/datum/dynamic_ruleset
	var/list/restricted_species = list() // list of all species type strings like "/datum/species/synthetic", inheritance is not supported

/datum/dynamic_ruleset/is_valid_candidate(mob/candidate, client/candidate_client)
	. = ..()
	if (!.)
		return .
	if (!restricted_species || restricted_species.len < 1)
		return .

	if (!candidate_client || isnull(candidate.mind)) // Are they connected?
		return FALSE

	var/mob/living/carbon/living_carbon = candidate
	var/datum/species/species_type
	if (living_carbon)
		var/datum/dna/present_dna = living_carbon.has_dna()
		if (present_dna)
			species_type = present_dna.species

	if (!species_type)
		species_type = candidate_client.prefs?.read_preference(/datum/preference/choiced/species)

	if (!species_type)
		return FALSE // some broken mob?

	if ("[species_type.type]" in restricted_species) // no inheritance will be supported here, so be careful
		return FALSE
	return TRUE
