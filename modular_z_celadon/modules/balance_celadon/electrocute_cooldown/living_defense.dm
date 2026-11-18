#define ELECTROCUTE_IMMUNITY_TIME 2 SECONDS

/mob/living
	var/last_electrocute_time = 0

/mob/living/electrocute_act(shock_damage, source, siemens_coeff = 1, flags = NONE)
	if (world.time - last_electrocute_time < ELECTROCUTE_IMMUNITY_TIME)
		return FALSE

	last_electrocute_time = world.time

	return ..()
