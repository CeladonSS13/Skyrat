/datum/mind
	var/sent_navigation_tip = FALSE

/datum/mind/proc/try_show_navigation_tip()
	if (!sent_navigation_tip)
		sent_navigation_tip = TRUE
		addtimer(CALLBACK(src, TYPE_PROC_REF(/datum/mind, show_navigate_tip)), 2 MINUTES)

/datum/mind/proc/show_navigate_tip()
	if (!src)
		return

	var/client/player_client = get_player_client(src)

	if (!player_client)
		return

	if (src.current && isliving(src.current))
		to_chat(player_client,
			type = MESSAGE_TYPE_INFO,
			html = custom_boxed_message("purple_box", span_purple("<b>Подсказка: </b> Если не понятно как найти нужное место, используйте кнопку navigate в правом нижнем углу интерфейса - чуть выше над надписью COMBAT"))
		)
