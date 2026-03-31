/mob/living/silicon/Initialize(mapload)
	..()
	if (check_holidays(APRIL_FOOLS))
		death_sound = 'modular_celadon/modules/april_fools_day/borgs/sounds/borg_deathsound.ogg'
