/datum/dynamic_ruleset/midround/from_living/trim_candidates()
	..()
	candidates = living_players
	for(var/mob/living/candidate in candidates)
		var/client/candidate_client = GET_CLIENT(candidate)
		if (!candidate_client || !candidate.mind) // Are they connected?
			candidates -= candidate
			continue

		if (candidate.ssd_indicator) // no ssd to be considered
			candidates -= candidate
			continue
