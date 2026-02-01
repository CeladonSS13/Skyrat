/datum/reagent/uranium/radium/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	if (isnucleation(affected_mob))
		var/do_update = FALSE
		if(affected_mob.adjust_brute_loss(-3 * seconds_per_tick * REM, updating_health = FALSE))
			do_update = TRUE
		if(affected_mob.adjust_fire_loss(-3 * seconds_per_tick * REM, updating_health = FALSE))
			do_update = TRUE
		return do_update
	// non nucleation
	return ..()
