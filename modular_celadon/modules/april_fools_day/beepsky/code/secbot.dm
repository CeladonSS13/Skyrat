/mob/living/simple_animal/bot/secbot/threat_react(threatlevel)
	if(check_holidays(APRIL_FOOLS))
		speak("Угроза [threatlevel]-го уровня!")
		playsound(src, pick(
			'modular_celadon/modules/april_fools_day/beepsky/sounds/gad.ogg',
			'modular_celadon/modules/april_fools_day/beepsky/sounds/trahnu.ogg',
			'modular_celadon/modules/april_fools_day/beepsky/sounds/dog_shit.ogg',
			), 100, FALSE)
	else
		..()

/datum/sound_effect/law_april
	key = "law_april"
	file_paths = list(
		'modular_celadon/modules/april_fools_day/beepsky/sounds/zasranets.ogg',
		'modular_celadon/modules/april_fools_day/beepsky/sounds/asshole.ogg',
		'modular_celadon/modules/april_fools_day/beepsky/sounds/40let.ogg',
		'modular_celadon/modules/april_fools_day/beepsky/sounds/goroh.ogg',
		'modular_celadon/modules/april_fools_day/beepsky/sounds/ubludok.ogg',
		'modular_celadon/modules/april_fools_day/beepsky/sounds/voba.ogg',
	)
