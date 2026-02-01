/mob/proc/manipulate_emotes()
	if(!mind)
		return
	var/list/available_emotes = list()
	var/list/all_emotes = list()

	// code\modules\mob\emote.dm
	var/static/list/mob_emotes = list(
		/mob/proc/emote_flip,
		/mob/proc/emote_spin
	)
	all_emotes += mob_emotes

	// code\modules\mob\living\emote.dm
	var/static/list/living_emotes = list(
		/mob/living/proc/emote_blush,
		/mob/living/proc/emote_bow,
		/mob/living/proc/emote_burp,
		/mob/living/proc/emote_choke,
		/mob/living/proc/emote_cross,
		/mob/living/proc/emote_chuckle,
		/mob/living/proc/emote_collapse,
		/mob/living/proc/emote_cough,
		/mob/living/proc/emote_dance,
		/mob/living/proc/emote_drool,
		/mob/living/proc/emote_faint,
		/mob/living/proc/emote_flap,
		/mob/living/proc/emote_aflap,
		/mob/living/proc/emote_frown,
		/mob/living/proc/emote_gag,
		/mob/living/proc/emote_giggle,
		/mob/living/proc/emote_glare,
		/mob/living/proc/emote_grin,
		/mob/living/proc/emote_groan,
		/mob/living/proc/emote_grimace,
		/mob/living/proc/emote_jump,
		/mob/living/proc/emote_kiss,
		/mob/living/proc/emote_laugh,
		/mob/living/proc/emote_look,
		/mob/living/proc/emote_nod,
		// SS1984 REMOVAL /mob/living/proc/emote_nodnod,
		/mob/living/proc/emote_point,
		/mob/living/proc/emote_pout,
		/mob/living/proc/emote_scream,
		/mob/living/proc/emote_scowl,
		/mob/living/proc/emote_shake,
		/mob/living/proc/emote_shiver,
		/mob/living/proc/emote_sigh,
		/mob/living/proc/emote_sit,
		/mob/living/proc/emote_smile,
		/mob/living/proc/emote_sneeze,
		/mob/living/proc/emote_smug,
		/mob/living/proc/emote_sniff,
		/mob/living/proc/emote_stare,
		/mob/living/proc/emote_strech,
		/mob/living/proc/emote_sulk,
		/mob/living/proc/emote_sway,
		/mob/living/proc/emote_tilt,
		/mob/living/proc/emote_tremble,
		/mob/living/proc/emote_twitch,
		/mob/living/proc/emote_twitch_s,
		/mob/living/proc/emote_wave,
		/mob/living/proc/emote_whimper,
		/mob/living/proc/emote_wsmile,
		/mob/living/proc/emote_yawn,
		/mob/living/proc/emote_gurgle,
		/mob/living/proc/emote_inhale,
		/mob/living/proc/emote_exhale,
		/mob/living/proc/emote_swear
	)
	all_emotes += living_emotes

	// code\modules\mob\living\carbon\emote.dm
	var/static/list/carbon_emotes = list(
		/mob/living/carbon/proc/emote_airguitar,
		/mob/living/carbon/proc/emote_blink,
		/mob/living/carbon/proc/emote_blink_r,
		/mob/living/carbon/proc/emote_crack,
		/mob/living/carbon/proc/emote_circle,
		/mob/living/carbon/proc/emote_moan,
		/mob/living/carbon/proc/emote_slap,
		/mob/living/carbon/proc/emote_wink
	)
	all_emotes += carbon_emotes

	// code\modules\mob\living\carbon\human\emote.dm
	var/static/list/human_emotes = list(
		/mob/living/carbon/human/proc/emote_cry,
		/mob/living/carbon/human/proc/emote_eyebrow,
		/mob/living/carbon/human/proc/emote_grumble,
		/mob/living/carbon/human/proc/emote_mumble,
		/mob/living/carbon/human/proc/emote_pale,
		/mob/living/carbon/human/proc/emote_raise,
		/mob/living/carbon/human/proc/emote_salute,
		/mob/living/carbon/human/proc/emote_shrug,
		/mob/living/carbon/human/proc/emote_wag,
		/mob/living/carbon/human/proc/emote_wing
	)
	all_emotes += human_emotes

	// modular_nova\modules\emotes\code\emote.dm
	// SS1984 REMOVAL START
	// var/static/list/nova_living_emotes = list(
	// 	/mob/living/proc/emote_peep,
	// 	/mob/living/proc/emote_peep2,
	// 	/mob/living/proc/emote_snap,
	// 	/mob/living/proc/emote_snap2,
	// 	/mob/living/proc/emote_snap3,
	// 	/mob/living/proc/emote_awoo,
	// 	/mob/living/proc/emote_nya,
	// 	/mob/living/proc/emote_weh,
	// 	/mob/living/proc/emote_mothsqueak,
	// 	/mob/living/proc/emote_mousesqueak,
	// 	/mob/living/proc/emote_merp,
	// 	/mob/living/proc/emote_bark,
	// 	/mob/living/proc/emote_squish,
		// /mob/living/proc/emote_bubble,
		// /mob/living/proc/emote_pop,
	// 	/mob/living/proc/emote_meow,
	// 	/mob/living/proc/emote_hiss1,
	// 	/mob/living/proc/emote_chitter,
	// 	/mob/living/proc/emote_snore,
	// 	/mob/living/proc/emote_clap,
	// 	/mob/living/proc/emote_clap1,
	// 	/mob/living/proc/emote_headtilt,
	// 	/mob/living/proc/emote_blink2,
	// 	/mob/living/proc/emote_rblink,
	// 	/mob/living/proc/emote_squint,
	// 	/mob/living/proc/emote_smirk,
	// 	/mob/living/proc/emote_eyeroll,
	// 	/mob/living/proc/emote_huff,
	// 	/mob/living/proc/emote_etwitch,
	// 	/mob/living/proc/emote_clear,
	// 	/mob/living/proc/emote_bawk,
	// 	/mob/living/proc/emote_caw,
	// 	/mob/living/proc/emote_caw2,
	// 	/mob/living/proc/emote_whistle,
	// 	/mob/living/proc/emote_blep,
	// 	/mob/living/proc/emote_bork,
	// 	/mob/living/proc/emote_hoot,
	// 	/mob/living/proc/emote_growl,
	// 	/mob/living/proc/emote_woof,
	// 	/mob/living/proc/emote_baa,
	// 	/mob/living/proc/emote_baa2,
	// 	/mob/living/proc/emote_wurble,
	// 	/mob/living/proc/emote_rattle,
	// 	/mob/living/proc/emote_cackle,
	// 	/mob/living/proc/emote_warble,
	// 	/mob/living/proc/emote_trills,
	// 	/mob/living/proc/emote_rpurr,
	// 	/mob/living/proc/emote_purr,
	// 	/mob/living/proc/emote_moo,
	// 	/mob/living/proc/emote_honk1,
	// 	/mob/living/proc/emote_mggaow,
	// 	/mob/living/proc/emote_mrrp,
	// 	/mob/living/proc/emote_prbt,
		// /mob/living/proc/emote_yip,
		// /mob/living/proc/emote_fwhine,
		// /mob/living/proc/emote_awuff,
		// /mob/living/proc/emote_arf,
		// /mob/living/proc/emote_coyhowl,
		// /mob/living/proc/emote_wolfhowl,
		// /mob/living/proc/emote_dwhine,
		// /mob/living/proc/emote_dgrowl,
		// /mob/living/proc/emote_aggrobark,
		// /mob/living/proc/emote_dcomplain,
		// /mob/living/proc/emote_meowdeep,
		// /mob/living/proc/emote_teshchirp,
		// /mob/living/proc/emote_teshsqueak,
		// /mob/living/proc/emote_teshtrill,
		// /mob/living/proc/emote_gecker,
	// )
	// all_emotes += nova_living_emotes
	// SS1984 REMOVAL END

	// code\modules\mob\living\brain\emote.dm
	var/static/list/brain_emotes = list(
		/mob/living/brain/proc/emote_alarm,
		/mob/living/brain/proc/emote_alert,
		/mob/living/brain/proc/emote_flash,
		/mob/living/brain/proc/emote_notice,
		/mob/living/brain/proc/emote_whistle_brain
	)
	all_emotes += brain_emotes

	// code\modules\mob\living\carbon\alien\emote.dm
	var/static/list/alien_emotes = list(
		/mob/living/carbon/alien/proc/emote_gnarl,
		/mob/living/carbon/alien/proc/emote_hiss,
		/mob/living/carbon/alien/proc/emote_roar
	)
	all_emotes += alien_emotes

	// modular_nova\modules\emotes\code\synth_emotes.dm
	// SS1984 REMOVAL START
	// var/static/list/synth_emotes = list(
	// 	/mob/living/proc/emote_dwoop,
	// 	/mob/living/proc/emote_yes,
	// 	/mob/living/proc/emote_no,
	// 	/mob/living/proc/emote_boop,
	// 	/mob/living/proc/emote_buzz,
	// 	/mob/living/proc/emote_beep,
	// 	/mob/living/proc/emote_beep2,
	// 	/mob/living/proc/emote_buzz2,
	// 	/mob/living/proc/emote_chime,
	// 	/mob/living/proc/emote_honk,
	// 	/mob/living/proc/emote_ping,
	// 	/mob/living/proc/emote_sad,
	// 	/mob/living/proc/emote_warn,
	// 	/mob/living/proc/emote_slowclap
	// )
	// all_emotes += synth_emotes
	// var/static/list/allowed_species_synth = list(
	// 	/datum/species/synthetic
	// )
	// SS1984 REMOVAL END

	// modular_nova\modules\emotes\code\additionalemotes\overlay_emote.dm
	// SS1984 REMOVAL START
	// var/static/list/nova_living_emotes_overlay = list(
	// 	/mob/living/proc/emote_sweatdrop,
	// 	/mob/living/proc/emote_exclaim,
	// 	/mob/living/proc/emote_question,
	// 	/mob/living/proc/emote_realize,
	// 	/mob/living/proc/emote_annoyed,
	// 	/mob/living/proc/emote_glasses
	// )
	// all_emotes += nova_living_emotes_overlay
	// SS1984 REMOVAL END

	// modular_nova\modules\emotes\code\additionalemotes\turf_emote.dm
	// SS1984 REMOVAL all_emotes += /mob/living/proc/emote_mark_turf

	// Clearing all emotes before applying new ones
	verbs -= all_emotes

	// Checking if preferences allow emote panel
	if(!src.client?.prefs?.read_preference(/datum/preference/toggle/emote_panel))
		return

	// Checking emote availability
	if(isbrain(src))
		// Only brains in MMI have emotes
		var/mob/living/brain/current_brain = src
		if(current_brain.container && istype(current_brain.container, /obj/item/mmi))
			available_emotes += brain_emotes
	else
		if(ismob(src))
			available_emotes += mob_emotes
		if(isliving(src))
			available_emotes += living_emotes
			// SS1984 REMOVAL START
			// available_emotes += nova_living_emotes
			// available_emotes += nova_living_emotes_overlay
			// available_emotes += /mob/living/proc/emote_mark_turf
			// Checking if should apply Synth emotes
			// if(HAS_TRAIT(src, TRAIT_SILICON_EMOTES_ALLOWED))
			// 	available_emotes += synth_emotes
			// SS1984 REMOVAL END
		if(iscarbon(src))
			available_emotes += carbon_emotes
		if(ishuman(src))
			available_emotes += human_emotes
			var/mob/living/carbon/human/current_mob = src
			// Checking if can wag tail
			var/obj/item/organ/tail/tail = current_mob.get_organ_slot(ORGAN_SLOT_EXTERNAL_TAIL)
			if(!(tail?.wag_flags & WAG_ABLE))
				available_emotes -= /mob/living/carbon/human/proc/emote_wag
			// Checking if has wings
			if(!current_mob.get_organ_slot(ORGAN_SLOT_EXTERNAL_WINGS))
				available_emotes -= /mob/living/carbon/human/proc/emote_wing
		if(isalien(src))
			available_emotes += alien_emotes

	// Applying emote panel if preferences allow
	for(var/emote in available_emotes)
		verbs |= emote

/mob/mind_initialize()
	. = ..()
	manipulate_emotes()

// code\modules\mob\emote.dm
/mob/proc/emote_flip()
	set name = "| Кувырок |" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("flip", intentional = TRUE)

/mob/proc/emote_spin()
	set name = "| Крутиться |" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("spin", intentional = TRUE)

// code\modules\mob\living\emote.dm

/mob/living/proc/emote_blush()
	set name = "~ Краснеть" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("blush", intentional = TRUE)

/mob/living/proc/emote_bow()
	set name = "~ Поклониться" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("bow", intentional = TRUE)

/mob/living/proc/emote_burp()
	set name = "> Отрыгнуть" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("burp", intentional = TRUE)

/mob/living/proc/emote_choke()
	set name = "~ Подавиться" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("choke", intentional = TRUE)

/mob/living/proc/emote_cross()
	set name = "~ Скрестить руки" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("cross", intentional = TRUE)

/mob/living/proc/emote_chuckle()
	set name = "~ Посмеиваться" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("chuckle", intentional = TRUE)

/mob/living/proc/emote_collapse()
	set name = "~ Потерять сознание" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("collapse", intentional = TRUE)

/mob/living/proc/emote_cough()
	set name = "> Кашлять" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("cough", intentional = TRUE)

/mob/living/proc/emote_dance()
	set name = "~ Танцевать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("dance", intentional = TRUE)

/mob/living/proc/emote_drool()
	set name = "~ Нести чепуху" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("drool", intentional = TRUE)

/mob/living/proc/emote_faint()
	set name = "~ Упасть в обморок" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("faint", intentional = TRUE)

/mob/living/proc/emote_flap()
	set name = "~ Махать крыльями" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("flap", intentional = TRUE)

/mob/living/proc/emote_aflap()
	set name = "~ Агрессивно махать крыльями" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("aflap", intentional = TRUE)

/mob/living/proc/emote_frown()
	set name = "~ Хмуриться" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("frown", intentional = TRUE)

/mob/living/proc/emote_gag()
	set name = "~ Выворачивать наизнанку" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("gag", intentional = TRUE)

/mob/living/proc/emote_giggle()
	set name = "~ Хихикать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("giggle", intentional = TRUE)


/mob/living/proc/emote_glare()
	set name = "~ Свирепо смотреть" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("glare", intentional = TRUE)

/mob/living/proc/emote_grin()
	set name = "~ Скалиться в улыбке" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("grin", intentional = TRUE)

/mob/living/proc/emote_groan()
	set name = "~ Болезненно вздыхать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("groan", intentional = TRUE)

/mob/living/proc/emote_grimace()
	set name = "~ Изобразить гримасу" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("grimace", intentional = TRUE)

/mob/living/proc/emote_jump()
	set name = "~ Прыгать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("jump", intentional = TRUE)

/mob/living/proc/emote_kiss()
	set name = "| Воздушный поцелуй |" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("kiss", intentional = TRUE)

/mob/living/proc/emote_laugh()
	set name = "> Смеяться" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("laugh", intentional = TRUE)

/mob/living/proc/emote_look()
	set name = "~ Смотреть" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("look", intentional = TRUE)

/mob/living/proc/emote_nod()
	set name = "~ Кивать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("nod", intentional = TRUE)

// SS1984 REMOVAL START
// /mob/living/proc/emote_nodnod()
// 	set name = "~ Nodnod"
// 	set category = "Emotes"
// 	usr.emote("nod2", intentional = TRUE)
// SS1984 REMOVAL END

/mob/living/proc/emote_point()
	set name = "~ Указывать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("point", intentional = TRUE)

/mob/living/proc/emote_pout()
	set name = "~ Надуть губы" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("pout", intentional = TRUE)

/mob/living/proc/emote_scream()
	set name = "> Кричать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("scream", intentional = TRUE)

/mob/living/proc/emote_scowl()
	set name = "~ Мрачно смотреть"// SS1984 EDIT
	set category = "Emotes"
	usr.emote("scowl", intentional = TRUE)

/mob/living/proc/emote_shake()
	set name = "~ Трясти головой" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("shake", intentional = TRUE)

/mob/living/proc/emote_shiver()
	set name = "~ Дрожать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("shiver", intentional = TRUE)

/mob/living/proc/emote_sigh()
	set name = "> Вздохнуть"// SS1984 EDIT
	set category = "Emotes"
	usr.emote("sigh", intentional = TRUE)

/mob/living/proc/emote_sit()
	set name = "~ Сесть" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("sit", intentional = TRUE)

/mob/living/proc/emote_smile()
	set name = "~ Улыбаться" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("smile", intentional = TRUE)

/mob/living/proc/emote_sneeze()
	set name = "> Чихать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("sneeze", intentional = TRUE)

/mob/living/proc/emote_smug()
	set name = "~ Ухмыляться" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("smug", intentional = TRUE)

/mob/living/proc/emote_sniff()
	set name = "> Нюхать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("sniff", intentional = TRUE)

/mob/living/proc/emote_stare()
	set name = "~ Пялиться" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("stare", intentional = TRUE)

/mob/living/proc/emote_strech()
	set name = "~ Размять конечности" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("stretch", intentional = TRUE)

/mob/living/proc/emote_sulk()
	set name = "~ Дуться" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("sulk", intentional = TRUE)

/mob/living/proc/emote_sway()
	set name = "~ Кружиться" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("sway", intentional = TRUE)

/mob/living/proc/emote_tilt()
	set name = "~ Наклонить голову" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("tilt", intentional = TRUE)

/mob/living/proc/emote_tremble()
	set name = "~ Дрожать в ужасе" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("tremble", intentional = TRUE)

/mob/living/proc/emote_twitch()
	set name = "~ Сильно дергаться" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("twitch", intentional = TRUE)

/mob/living/proc/emote_twitch_s()
	set name = "~ Дергаться" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("twitch_s", intentional = TRUE)

/mob/living/proc/emote_wave()
	set name = "~ Махать рукой" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("wave", intentional = TRUE)

/mob/living/proc/emote_whimper()
	set name = "~ Хныкать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("whimper", intentional = TRUE)

/mob/living/proc/emote_wsmile()
	set name = "~ Слабо улыбнуться" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("wsmile", intentional = TRUE)

/mob/living/proc/emote_yawn()
	set name = "~ Зевать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("yawn", intentional = TRUE)

/mob/living/proc/emote_gurgle()
	set name = "~ Булькать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("gurgle", intentional = TRUE)

/mob/living/proc/emote_inhale()
	set name = "~ Вдохнуть" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("inhale", intentional = TRUE)

/mob/living/proc/emote_exhale()
	set name = "~ Выдохнуть" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("exhale", intentional = TRUE)

/mob/living/proc/emote_swear()
	set name = "~ Ругаться" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("swear", intentional = TRUE)

// code\modules\mob\living\carbon\emote.dm

/mob/living/carbon/proc/emote_airguitar()
	set name = "~ Играть на гитаре" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("airguitar", intentional = TRUE)

/mob/living/carbon/proc/emote_blink()
	set name = "~ Моргать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("blink", intentional = TRUE)

/mob/living/carbon/proc/emote_blink_r()
	set name = "~ Быстро моргать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("blink_r", intentional = TRUE)

/mob/living/carbon/proc/emote_crack()
	set name = "> Хрустеть кистями" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("crack", intentional = TRUE)

/mob/living/carbon/proc/emote_circle()
	set name = "| Нарисовать круг |" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("circle", intentional = TRUE)

/mob/living/carbon/proc/emote_moan()
	set name = "~ Стонать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("moan", intentional = TRUE)

/mob/living/carbon/proc/emote_slap()
	set name = "| Шлёпнуть |" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("slap", intentional = TRUE)

/mob/living/carbon/proc/emote_wink()
	set name = "~ Трясти хвостом" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("wink", intentional = TRUE)

// code\modules\mob\living\carbon\human\emote.dm

/mob/living/carbon/human/proc/emote_cry()
	set name = "~ Плакать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("cry", intentional = TRUE)

/mob/living/carbon/human/proc/emote_eyebrow()
	set name = "~ Поднять брови" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("eyebrow", intentional = TRUE)

/mob/living/carbon/human/proc/emote_grumble()
	set name = "~ Ворчать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("grumble", intentional = TRUE)

/mob/living/carbon/human/proc/emote_mumble()
	set name = "~ Бормотать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("mumble", intentional = TRUE)

/mob/living/carbon/human/proc/emote_pale()
	set name = "~ Бледнеть" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("pale", intentional = TRUE)

/mob/living/carbon/human/proc/emote_raise()
	set name = "~ Поднять руку" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("raise", intentional = TRUE)

/mob/living/carbon/human/proc/emote_salute()
	set name = "~ Салютовать" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("salute", intentional = TRUE)

/mob/living/carbon/human/proc/emote_shrug()
	set name = "~ Пожать плечами" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("shrug", intentional = TRUE)

/mob/living/carbon/human/proc/emote_wag()
	set name = "| Вилять хвостом |" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("wag", intentional = TRUE)

/mob/living/carbon/human/proc/emote_wing()
	set name = "| Расправить крылья |" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("wing", intentional = TRUE)

/* SS1984 REMOVAL START
// modular_nova\modules\emotes\code\emote.dm

/mob/living/proc/emote_peep()
	set name = "> Peep"
	set category = "Emotes+"
	usr.emote("peep", intentional = TRUE)

/mob/living/proc/emote_peep2()
	set name = "> Peep Twice"
	set category = "Emotes+"
	usr.emote("peep2", intentional = TRUE)

/mob/living/proc/emote_snap()
	set name = "> Snap"
	set category = "Emotes+"
	usr.emote("snap", intentional = TRUE)

/mob/living/proc/emote_snap2()
	set name = "> Snap Twice"
	set category = "Emotes+"
	usr.emote("snap2", intentional = TRUE)

/mob/living/proc/emote_snap3()
	set name = "> Snap Thrice"
	set category = "Emotes+"
	usr.emote("snap3", intentional = TRUE)

/mob/living/proc/emote_awoo()
	set name = "> Awoo"
	set category = "Emotes+"
	usr.emote("awoo", intentional = TRUE)

/mob/living/proc/emote_yip()
	set name = "> Yip"
	set category = "Emotes+"
	usr.emote("yip", intentional = TRUE)

/mob/living/proc/emote_gecker()
	set name = "> Gecker"
	set category = "Emotes+"
	usr.emote("gecker", intentional = TRUE)

/mob/living/proc/emote_fwhine()
	set name = "> Fox Whine"
	set category = "Emotes+"
	usr.emote("fwhine", intentional = TRUE)

/mob/living/proc/emote_nya()
	set name = "> Nya"
	set category = "Emotes+"
	usr.emote("nya", intentional = TRUE)

/mob/living/proc/emote_weh()
	set name = "> Weh"
	set category = "Emotes+"
	usr.emote("weh", intentional = TRUE)

/mob/living/proc/emote_mothsqueak()
	set name = "> Moth Squeak"
	set category = "Emotes+"
	usr.emote("msqueak", intentional = TRUE)

/mob/living/proc/emote_mousesqueak()
	set name = "> Mouse Squeak"
	set category = "Emotes+"
	usr.emote("squeak", intentional = TRUE)

/mob/living/proc/emote_merp()
	set name = "> Merp"
	set category = "Emotes+"
	usr.emote("merp", intentional = TRUE)

/mob/living/proc/emote_bark()
	set name = "> Bark"
	set category = "Emotes+"
	usr.emote("bark", intentional = TRUE)

/mob/living/proc/emote_squish()
	set name = "> Squish"
	set category = "Emotes+"
	usr.emote("squish", intentional = TRUE)

/mob/living/proc/emote_bubble()
	set name = "> Bubble"
	set category = "Emotes+"
	usr.emote("bubble", intentional = TRUE)

/mob/living/proc/emote_pop()
	set name = "> Pop"
	set category = "Emotes+"
	usr.emote("pop", intentional = TRUE)

/mob/living/proc/emote_meow()
	set name = "> Meow"
	set category = "Emotes+"
	usr.emote("meow", intentional = TRUE)

/mob/living/proc/emote_hiss1()
	set name = "> Hiss"
	set category = "Emotes+"
	usr.emote("hiss", intentional = TRUE)

/mob/living/proc/emote_chitter()
	set name = "> Chitter"
	set category = "Emotes+"
	usr.emote("chitter", intentional = TRUE)

/mob/living/proc/emote_snore()
	set name = "> Snore"
	set category = "Emotes+"
	usr.emote("snore", intentional = TRUE)

/mob/living/proc/emote_clap()
	set name = "> Clap"
	set category = "Emotes+"
	usr.emote("clap", intentional = TRUE)

/mob/living/proc/emote_clap1()
	set name = "> Clap once"
	set category = "Emotes+"
	usr.emote("clap1", intentional = TRUE)

/mob/living/proc/emote_headtilt()
	set name = "~ Head Hilt"
	set category = "Emotes+"
	usr.emote("tilt", intentional = TRUE)

/mob/living/proc/emote_blink2()
	set name = "~ Blink Twice"
	set category = "Emotes+"
	usr.emote("blink2", intentional = TRUE)

/mob/living/proc/emote_rblink()
	set name = "~ Blink Rapidly"
	set category = "Emotes+"
	usr.emote("rblink", intentional = TRUE)

/mob/living/proc/emote_squint()
	set name = "~ Squint"
	set category = "Emotes+"
	usr.emote("squint", intentional = TRUE)

/mob/living/proc/emote_smirk()
	set name = "~ Smirk"
	set category = "Emotes+"
	usr.emote("smirk", intentional = TRUE)

/mob/living/proc/emote_eyeroll()
	set name = "~ Eyeroll"
	set category = "Emotes+"
	usr.emote("eyeroll", intentional = TRUE)

/mob/living/proc/emote_huff()
	set name = "~ Huff"
	set category = "Emotes+"
	usr.emote("huffs", intentional = TRUE)

/mob/living/proc/emote_etwitch()
	set name = "~ Ears twitch"
	set category = "Emotes+"
	usr.emote("etwitch", intentional = TRUE)

/mob/living/proc/emote_clear()
	set name = "~ Clear Throat"
	set category = "Emotes+"
	usr.emote("clear", intentional = TRUE)

/mob/living/proc/emote_bawk()
	set name = "> Bawk"
	set category = "Emotes+"
	usr.emote("bawk", intentional = TRUE)

/mob/living/proc/emote_caw()
	set name = "> Caw"
	set category = "Emotes+"
	usr.emote("caw", intentional = TRUE)

/mob/living/proc/emote_caw2()
	set name = "> Caw-caw"
	set category = "Emotes+"
	usr.emote("caw2", intentional = TRUE)

/mob/living/proc/emote_whistle()
	set name = "~ Whistle"
	set category = "Emotes+"
	usr.emote("whistle", intentional = TRUE)

/mob/living/proc/emote_blep()
	set name = "~ Blep"
	set category = "Emotes+"
	usr.emote("blep", intentional = TRUE)

/mob/living/proc/emote_bork()
	set name = "> Bork"
	set category = "Emotes+"
	usr.emote("bork", intentional = TRUE)

/mob/living/proc/emote_hoot()
	set name = "> Hoot"
	set category = "Emotes+"
	usr.emote("hoot", intentional = TRUE)

/mob/living/proc/emote_growl()
	set name = "> Growl"
	set category = "Emotes+"
	usr.emote("growl", intentional = TRUE)

/mob/living/proc/emote_woof()
	set name = "> Woof"
	set category = "Emotes+"
	usr.emote("woof", intentional = TRUE)

/mob/living/proc/emote_baa()
	set name = "> Baa"
	set category = "Emotes+"
	usr.emote("baa", intentional = TRUE)

/mob/living/proc/emote_baa2()
	set name = "> Bleat"
	set category = "Emotes+"
	usr.emote("baa2", intentional = TRUE)

/mob/living/proc/emote_wurble()
	set name = "> Wurble"
	set category = "Emotes+"
	usr.emote("wurble", intentional = TRUE)
/mob/living/proc/emote_rattle()
	set name = "> Rattle"
	set category = "Emotes+"
	usr.emote("rattle", intentional = TRUE)

/mob/living/proc/emote_cackle()
	set name = "> Cackle"
	set category = "Emotes+"
	usr.emote("cackle", intentional = TRUE)

/mob/living/proc/emote_warble()
	set name = "> Warble"
	set category = "Emotes+"
	usr.emote("warble", intentional = TRUE)

/mob/living/proc/emote_trills()
	set name = "> Trills"
	set category = "Emotes+"
	usr.emote("trills", intentional = TRUE)

/mob/living/proc/emote_rpurr()
	set name = "> Raptor"
	set category = "Emotes+"
	usr.emote("rpurr", intentional = TRUE)

/mob/living/proc/emote_purr()
	set name = "> Purr"
	set category = "Emotes+"
	usr.emote("purr", intentional = TRUE)

/mob/living/proc/emote_moo()
	set name = "> Moo"
	set category = "Emotes+"
	usr.emote("moo", intentional = TRUE)

/mob/living/proc/emote_honk1()
	set name = "> Honk"
	set category = "Emotes+"
	usr.emote("honk1", intentional = TRUE)

/mob/living/proc/emote_mggaow()
	set name = "> Mggaow"
	set category = "Emotes+"
	usr.emote("mggaow", intentional = TRUE)

/mob/living/proc/emote_mrrp()
	set name = "> Mrrp"
	set category = "Emotes+"
	usr.emote("mrrp", intentional = TRUE)

/mob/living/proc/emote_prbt()
	set name = "> Prbt"
	set category = "Emotes+"
	usr.emote("prbt", intentional = TRUE)

/mob/living/proc/emote_awuff()
	set name = "> Ah Woof"
	set category = "Emotes+"
	usr.emote("awuff", intentional = TRUE)

/mob/living/proc/emote_arf()
	set name = "> Arf"
	set category = "Emotes+"
	usr.emote("arf", intentional = TRUE)

/mob/living/proc/emote_coyhowl()
	set name = "> Coyote Howl"
	set category = "Emotes+"
	usr.emote("coyhowl", intentional = TRUE)

/mob/living/proc/emote_wolfhowl()
	set name = "> Wolf Howl"
	set category = "Emotes+"
	usr.emote("wolfhowl", intentional = TRUE)

/mob/living/proc/emote_dwhine()
	set name = "> Dog Whine"
	set category = "Emotes+"
	usr.emote("dwhine", intentional = TRUE)

/mob/living/proc/emote_dgrowl()
	set name = "> Dog Growl"
	set category = "Emotes+"
	usr.emote("dgrowl", intentional = TRUE)

/mob/living/proc/emote_aggrobark()
	set name = "> Aggressive Bark"
	set category = "Emotes+"
	usr.emote("aggrobark", intentional = TRUE)

/mob/living/proc/emote_dcomplain()
	set name = "> Dog Complain"
	set category = "Emotes+"
	usr.emote("dcomplain", intentional = TRUE)

/mob/living/proc/emote_meowdeep()
	set name = "> Meow Deeply"
	set category = "Emotes+"
	usr.emote("meowdeep", intentional = TRUE)

/mob/living/proc/emote_teshchirp()
	set name = "> Tesh Chirp"
	set category = "Emotes+"
	usr.emote("teshchirp", intentional = TRUE)

/mob/living/proc/emote_teshsqueak()
	set name = "> Tesh Squeak"
	set category = "Emotes+"
	usr.emote("teshsqueak", intentional = TRUE)

/mob/living/proc/emote_teshtrill()
	set name = "> Tesh Trill"
	set category = "Emotes+"
	usr.emote("teshtrill", intentional = TRUE)

SS1984 REMOVAL END */

// code\modules\mob\living\brain\emote.dm

/mob/living/brain/proc/emote_alarm()
	set name = "< Издать предупреждающий звук >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("alarm", intentional = TRUE)

/mob/living/brain/proc/emote_alert()
	set name = "< Издать тревожный шум >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("alert", intentional = TRUE)

/mob/living/brain/proc/emote_flash()
	set name = "< Мерцать светом >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("flash", intentional = TRUE)

/mob/living/brain/proc/emote_notice()
	set name = "< Издать громкий звук >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("notice", intentional = TRUE)

/mob/living/brain/proc/emote_whistle_brain()
	set name = "< Свистеть >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("whistle", intentional = TRUE)

// code\modules\mob\living\carbon\alien\emote.dm

/mob/living/carbon/alien/proc/emote_gnarl()
	set name = "< Обнажить зубы >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("gnarl", intentional = TRUE)

/mob/living/carbon/alien/proc/emote_hiss()
	set name = "< Шипеть >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("hiss", intentional = TRUE)

/mob/living/carbon/alien/proc/emote_roar()
	set name = "< Рычать >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("roar", intentional = TRUE)

//modular_nova\modules\emotes\code\synth_emotes.dm

/* SS1984 REMOVAL START
/mob/living/proc/emote_dwoop()
	set name = "< Dwoop >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("dwoop", intentional = TRUE)

/mob/living/proc/emote_yes()
	set name = "< Yes >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("yes", intentional = TRUE)

/mob/living/proc/emote_no()
	set name = "< No >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("no", intentional = TRUE)

/mob/living/proc/emote_boop()
	set name = "< Boop >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("boop", intentional = TRUE)

/mob/living/proc/emote_buzz()
	set name = "< Buzz >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("buzz", intentional = TRUE)

/mob/living/proc/emote_beep()
	set name = "< Beep >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("beep", intentional = TRUE)

/mob/living/proc/emote_beep2()
	set name = "< Beep Sharply >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("beep2", intentional = TRUE)

/mob/living/proc/emote_buzz2()
	set name = "< Buzz Twice >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("buzz2", intentional = TRUE)

/mob/living/proc/emote_chime()
	set name = "< Chime >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("chime", intentional = TRUE)

/mob/living/proc/emote_honk()
	set name = "< Honk >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("honk", intentional = TRUE)

/mob/living/proc/emote_ping()
	set name = "< Ping >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("ping", intentional = TRUE)

/mob/living/proc/emote_sad()
	set name = "< Sad >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("sad", intentional = TRUE)

/mob/living/proc/emote_warn()
	set name = "< Warn >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("warn", intentional = TRUE)

/mob/living/proc/emote_slowclap()
	set name = "< Slow Clap >" // SS1984 EDIT
	set category = "Emotes"
	usr.emote("slowclap", intentional = TRUE)
SS1984 REMOVAL END */

/* SS1984 REMOVAL START

// modular_nova\modules\emotes\code\additionalemotes\overlay_emote.dm
/mob/living/proc/emote_sweatdrop()
	set name = "| Sweatdrop |"
	set category = "Emotes+"
	usr.emote("sweatdrop", intentional = TRUE)

/mob/living/proc/emote_exclaim()
	set name = "| Exclaim |"
	set category = "Emotes+"
	usr.emote("exclaim", intentional = TRUE)

/mob/living/proc/emote_question()
	set name = "| Question |"
	set category = "Emotes+"
	usr.emote("question", intentional = TRUE)

/mob/living/proc/emote_realize()
	set name = "| Realize |"
	set category = "Emotes+"
	usr.emote("realize", intentional = TRUE)

/mob/living/proc/emote_annoyed()
	set name = "| Annoyed |"
	set category = "Emotes+"
	usr.emote("annoyed", intentional = TRUE)

/mob/living/proc/emote_glasses()
	set name = "| Adjust Glasses |"
	set category = "Emotes+"
	usr.emote("glasses", intentional = TRUE)

//modular_nova\modules\emotes\code\additionalemotes\turf_emote.dm
/mob/living/proc/emote_mark_turf()
	set name = "| Mark Turf |"
	set category = "Emotes+"
	usr.emote("turf", intentional = TRUE)

SS1984 REMOVAL END */
