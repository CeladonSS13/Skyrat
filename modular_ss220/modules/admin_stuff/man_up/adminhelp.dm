/datum/admin_help/Action(action)
	. = ..()
	if (action == "manup")
		man_up()
		var/response = tgui_alert(usr, "Close ticket?", "Ticket", list("Yes", "No"))
		if(response == "Yes")
			Close()

/datum/admin_help/proc/man_up(key_name = key_name_admin(usr), target_user = initiator)
	if(!check_rights(R_ADMIN))
		return

	to_chat(target_user, custom_boxed_message("notice_border thick_border", span_notice("<font size=4>Man up.<br> Deal with it.</font></b><br>Move on.")))
	SEND_SOUND(target_user, sound('modular_ss220/modules/admin_stuff/man_up/sound/voice/manup1.ogg'))

	var/msg = "[key_name] told [key_name(target_user)] to man up and deal with it."
	log_admin(msg)
	message_admins(msg)
