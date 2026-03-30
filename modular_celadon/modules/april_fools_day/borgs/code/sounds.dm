/mob/living/silicon/Initialize(mapload)
	..()
	if (check_holidays(APRIL_FOOLS))
		death_sound = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-shutdown.ogg'


/datum/emote/silicon/beep/get_sound(mob/living/user)
	if (check_holidays(APRIL_FOOLS))
		sound = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-hardware-moddif.ogg'

/datum/emote/silicon/buzz/get_sound(mob/living/user)
	if (check_holidays(APRIL_FOOLS))
		sound = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-battery-low.ogg'

/datum/emote/silicon/buzz2/get_sound(mob/living/user)
	if (check_holidays(APRIL_FOOLS))
		sound = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-battery-critical.ogg'

/datum/emote/silicon/chime/get_sound(mob/living/user)
	if (check_holidays(APRIL_FOOLS))
		sound = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-chime-moddif.ogg'

/datum/emote/silicon/ping/get_sound(mob/living/user)
	if (check_holidays(APRIL_FOOLS))
		sound = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-error.ogg'

/datum/emote/silicon/sad/get_sound(mob/living/user)
	if (check_holidays(APRIL_FOOLS))
		sound = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-sad-moddif.ogg'

/datum/emote/silicon/warn/get_sound(mob/living/user)
	if (check_holidays(APRIL_FOOLS))
		sound = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-warning-modif.ogg'
