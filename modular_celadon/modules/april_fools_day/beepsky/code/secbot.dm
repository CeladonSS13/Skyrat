/datum/sound_effect/law_april // tbh it's better to move that to other file later on
	key = "law_april"
	file_paths = list(
		'modular_celadon/modules/april_fools_day/beepsky/sounds/zasranets.ogg',
		'modular_celadon/modules/april_fools_day/beepsky/sounds/asshole.ogg',
		'modular_celadon/modules/april_fools_day/beepsky/sounds/40let.ogg',
		'modular_celadon/modules/april_fools_day/beepsky/sounds/goroh.ogg',
		'modular_celadon/modules/april_fools_day/beepsky/sounds/ubludok.ogg',
		'modular_celadon/modules/april_fools_day/beepsky/sounds/voba.ogg',
	)

/mob/living/basic/bot/secbot/post_arrest(mob/living/carbon/current_target)
	playsound(src, check_holidays(APRIL_FOOLS) ? "law_april" : SFX_LAW, 50, FALSE)
