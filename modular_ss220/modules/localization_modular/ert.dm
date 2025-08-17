/datum/antagonist/ert/New()
	. = ..()
	if (!owner?.current)
		return

	var/mob/living/carbon/carbon_mob = owner.current
	if (carbon_mob && carbon_mob.gender == "female" && name_source == GLOB.last_names)
		name_source = GLOB.last_names_female
