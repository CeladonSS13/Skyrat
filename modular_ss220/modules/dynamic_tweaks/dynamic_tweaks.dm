/datum/dynamic_ruleset/proc/get_required_threat(population, threat_level)
	pop_per_requirement = pop_per_requirement > 0 ? pop_per_requirement : SSdynamic.pop_per_requirement
	indice_pop = min(requirements.len,round(population/pop_per_requirement)+1)
	return requirements[indice_pop]

/datum/controller/subsystem/dynamic/proc/get_population_for_dynamic_rolling()
	var/list/pop_unfiltered = GLOB.alive_player_list
	if (!pop_unfiltered || length(pop_unfiltered) < 1)
		return 0
	var/pop_filtered_amount = 0
	for(var/mob/living/living_mob in GLOB.alive_player_list)
		if (is_mob_considered_as_valid(living_mob))
			pop_filtered_amount++
	return pop_filtered_amount

/datum/controller/subsystem/dynamic/proc/is_mob_considered_as_valid(var/mob/mob_to_check)
	var/mob/living/living_mob = mob_to_check
	if (!living_mob || !living_mob.ckey || !GET_CLIENT(living_mob) || living_mob.ssd_indicator)
		return FALSE
	if (issilicon(living_mob))
		return TRUE
	var/mob/living/carbon/human/human_mob = living_mob
	if (!human_mob || !human_mob.mind)
		return FALSE
	// No not-crew (ghost roles) or unassigned (at mind, not at card) roles
	if (!human_mob.mind.assigned_role || !(human_mob.mind.assigned_role.job_flags & JOB_CREW_MEMBER))
		return FALSE
	// ok looks like valid player
	return TRUE
