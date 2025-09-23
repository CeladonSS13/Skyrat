#define MEDKIT_TOOLTIP_DELAY 4 MINUTES

/datum/mind
	var/sent_loadout_tip = FALSE

/datum/mind/proc/try_show_loadout_tip(client/player_client)
	if (!sent_loadout_tip)
		sent_loadout_tip = TRUE
		// check loadout
		if (!player_client) // someone invoking proc-call or what?
			return
		if (!player_client.prefs) // weird if null
			return

		var/list/loadout_entries = player_client.prefs.read_preference(/datum/preference/loadout)

		if (!loadout_entries || length(loadout_entries) < 1) // ok looks like he have no loadout
			addtimer(CALLBACK(src, TYPE_PROC_REF(/datum/mind, show_loadout_tip)), MEDKIT_TOOLTIP_DELAY)
			return

		var/list/loadout_list = loadout_entries[player_client.prefs.read_preference(/datum/preference/loadout_index)]

		if (!loadout_list || length(loadout_list) < 1) // same as above
			addtimer(CALLBACK(src, TYPE_PROC_REF(/datum/mind, show_loadout_tip)), MEDKIT_TOOLTIP_DELAY)
			return

		var/skip_tip = FALSE

		for(var/path in loadout_list)
			if (!path)
				continue
			if (ispath(path, /obj/item/storage/medkit)) // unlike loadout datums, that's for actual loadout item path! Skip if there's ANY medkit (including subtypes)
				skip_tip = TRUE
				break

		if (skip_tip) // smart newbie
			return

		addtimer(CALLBACK(src, TYPE_PROC_REF(/datum/mind, show_loadout_tip)), MEDKIT_TOOLTIP_DELAY)

/datum/mind/proc/show_loadout_tip()
	if (!src)
		return

	var/client/player_client = get_player_client(src)

	if (!player_client)
		return

	if (src.current && isliving(src.current))
		to_chat(player_client,
			type = MESSAGE_TYPE_INFO,
			html = custom_boxed_message("purple_box", span_purple("<b>Подсказка: </b> Вы можете еще до прибытия на станцию получить аптечку. Для этого нужно её выбрать в Loadout персонажа (Preferences в левой верхней части экрана - Open Character Preferences). Во вкладке Loadout, в панели Other выберите Medical Kit - First-Aid, либо Medical Kit - Robotics для синтетиков/протезов."))
		)

#undef MEDKIT_TOOLTIP_DELAY
