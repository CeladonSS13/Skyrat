/mob/living/update_blood_effects()
	. = ..()
	SEND_SIGNAL(src, COMSIG_BLOOD_UPDATED)
