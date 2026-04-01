/mob/living/silicon/Initialize(mapload)
	..()
	if (check_holidays(APRIL_FOOLS))
		death_sound = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-shutdown.ogg'

/datum/emote
	/// Special sound for fools day
	var/sound_april

// Return special sound for fools day
/datum/emote/proc/get_sound_april(mob/living/user)
	if (sound_april)
		return sound_april
	return sound

/datum/emote/silicon/beep
	sound_april = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-hardware-moddifogg.ogg'

/datum/emote/silicon/buzz
	sound_april = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-battery-low.ogg'

/datum/emote/silicon/buzz2
	sound_april = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-battery-critical.ogg'

/datum/emote/silicon/chime
	sound_april = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-chime-moddif.ogg'

/datum/emote/silicon/ping
	sound_april = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-error.ogg'

/datum/emote/silicon/sad
	sound_april = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-sad-moddif.ogg'

/datum/emote/silicon/warn
	sound_april = 'modular_celadon/modules/april_fools_day/borgs/sound/windows-xp-warning-modif.ogg'

