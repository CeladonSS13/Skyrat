/datum/controller/subsystem/dynamic/proc/get_population_for_dynamic_rolling(list/source_mob_list = GLOB.alive_player_list)
	if (!source_mob_list || length(source_mob_list) < 1)
		return 0
	var/pop_filtered_amount = 0
	for(var/mob/living/living_mob in source_mob_list)
		if (is_mob_considered_as_valid(living_mob, GET_CLIENT(living_mob), allow_ghost = FALSE))
			pop_filtered_amount++
	return pop_filtered_amount

/datum/controller/subsystem/dynamic/proc/is_mob_considered_as_valid(mob/mob_to_check, client/player_client, allow_ghost = FALSE)
	if (!mob_to_check || !mob_to_check.ckey || !player_client)
		return FALSE
	if (allow_ghost && isobserver(mob_to_check))
		return TRUE
	var/mob/living/living_mob = mob_to_check
	if (!living_mob || living_mob.ssd_indicator)
		return FALSE
	if (issilicon(living_mob))
		return living_mob.mind.assigned_role?.faction & FACTION_STATION // are they station role? AI, cyborgs yes
	var/mob/living/carbon/human/human_mob = living_mob
	if (!human_mob)
		return FALSE
	// No not-crew (ghost roles) or unassigned (at mind, not at card) roles
	if (!human_mob.mind.assigned_role || !(human_mob.mind.assigned_role.job_flags & JOB_CREW_MEMBER))
		return FALSE
	// ok looks like valid player
	return TRUE
