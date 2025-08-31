#define DEFAULT_WHO_CELLS_PER_ROW 4
#define NO_ADMINS_ONLINE_MESSAGE "Однако вы по прежнему можете создавать тикеты." //SS1984 EDIT

/client/verb/who()
	set name = "Who"
	set category = "OOC"

	var/msg = ""

	var/list/Lines = list()
	var/columns_per_row = DEFAULT_WHO_CELLS_PER_ROW

	if(holder)
		if (check_rights(R_ADMIN,0) && isobserver(src.mob))//If they have +ADMIN and are a ghost they can see players IC names and statuses.
			columns_per_row = 1
			var/mob/dead/observer/G = src.mob
			if(!G.started_as_observer)//If you aghost to do this, KorPhaeron will deadmin you in your sleep.
				log_admin("[key_name(usr)] checked advanced who in-round")
			for(var/client/client in GLOB.clients)
				var/entry = "\t[client.key]"
				if(client.holder && client.holder.fakekey)
					entry += " <i>(как [client.holder.fakekey])</i>" //SS1984 EDIT
				if (isnewplayer(client.mob))
					entry += " - <font color='darkgray'><b>В лобби</b></font>" //SS1984 EDIT
				else
					entry += " - Играет за [client.mob.real_name]" //SS1984 EDIT
					switch(client.mob.stat)
						if(UNCONSCIOUS, HARD_CRIT)
							entry += " - <font color='darkgray'><b>Без сознания</b></font>" //SS1984 EDIT
						if(DEAD)
							if(isobserver(client.mob))
								var/mob/dead/observer/O = client.mob
								if(O.started_as_observer)
									entry += " - <font color='gray'>Наблюдает</font>" //SS1984 EDIT
								else
									entry += " - <font color='black'><b>МЕРТВ</b></font>" //SS1984 EDIT
							else
								entry += " - <font color='black'><b>МЕРТВ</b></font>" //SS1984 EDIT
					if(client.mob.is_antag())
						entry += " - <b><font color='red'>Антагонист</font></b>" //SS1984 EDIT
				entry += " [ADMIN_QUE(client.mob)]"
				entry += " ([round(client.avgping, 1)]ms)"
				Lines += entry
		else//If they don't have +ADMIN, only show hidden admins
			for(var/client/client in GLOB.clients)
				var/entry = "[client.key]"
				if(client.holder && client.holder.fakekey)
					entry += " <i>(как [client.holder.fakekey])</i>" //SS1984 EDIT
				entry += " ([round(client.avgping, 1)]ms)"
				Lines += entry
	else
		for(var/client/client in GLOB.clients)
			if(client.holder && client.holder.fakekey)
				Lines += "[client.holder.fakekey] ([round(client.avgping, 1)]ms)"
			else
				Lines += "[client.key] ([round(client.avgping, 1)]ms)"

	var/num_lines = 0
	msg += "<table style='width: 100%; table-layout: fixed'><tr>"
	for(var/line in sort_list(Lines))
		msg += "<td>[line]</td>"

		num_lines += 1
		if (num_lines == columns_per_row)
			num_lines = 0
			msg += "</tr><tr>"
	msg += "</tr></table>"

	msg += "<b>Всего игроков: [length(Lines)]</b>" //SS1984 EDIT
	to_chat(src, fieldset_block(span_bold("Текущие игроки"), span_infoplain(msg), "boxed_message"), type = MESSAGE_TYPE_INFO) //SS1984 EDIT

/client/verb/adminwho()
	set category = "Admin"
	set name = "Adminwho"

	var/list/lines = list()
	var/payload_string = generate_adminwho_string()
	var/header = (payload_string == NO_ADMINS_ONLINE_MESSAGE) ? "Никого из админсостава нет онлайн" : "Онлайн из админсостава" //SS1984 EDIT

	lines += span_bold(header)

	// SS1984 EDIT
	payload_string = replacetext(payload_string, "\[Host\]", "\[<font color='#1ABC9C'>Хост</font>\]")
	payload_string = replacetext(payload_string, "\[Head Admin\]", "\[<font color='#f02f2f'>Главный Администратор</font>\]")
	payload_string = replacetext(payload_string, "\[Admin\]",	"\[<font color='#ee8f29'>Админ</font>\]")
	payload_string = replacetext(payload_string, "\[Trial Admin\]", "\[<font color='#cfc000'>Триал Админ</font>\]")
	payload_string = replacetext(payload_string, "\[Moderator\]",	"\[<font color='#9db430'>Модератор</font>\]")
	payload_string = replacetext(payload_string, "\[Mentor\]", "\[<font color='#67761e'>Ментор</font>\]")
	payload_string = replacetext(payload_string, "\[Head Developer\]", "\[<font color='#2ecc71'>Главный Разработчик</font>\]")
	payload_string = replacetext(payload_string, "\[Developer\]",	"\[<font color='#2ecc71'>Разработчик</font>\]")
	// SS1984 EDIT END

	lines += payload_string

	to_chat(src, fieldset_block(span_bold("Админсостав"), jointext(lines, "\n"), "boxed_message"), type = MESSAGE_TYPE_INFO) //SS1984 EDIT

/// Proc that generates the applicable string to dispatch to the client for adminwho.
/client/proc/generate_adminwho_string()
	var/list/list_of_admins = get_list_of_admins()
	if(isnull(list_of_admins) || list_of_admins.len < 1)
		return NO_ADMINS_ONLINE_MESSAGE

	var/list/message_strings = list()
	if(isnull(holder))
		message_strings += get_general_adminwho_information(list_of_admins)
	else
		message_strings += get_sensitive_adminwho_information(list_of_admins)

	return jointext(message_strings, "\n")

/// Proc that returns a list of cliented admins. Remember that this list can contain nulls!
/// Also, will return null if we don't have any admins.
/proc/get_list_of_admins()
	var/returnable_list = list()

	for(var/client/admin in GLOB.admins)
		returnable_list += admin

	if(length(returnable_list) == 0)
		return null

	return returnable_list

/// Proc that will return the applicable display name, linkified or not, based on the input client reference.
/proc/get_linked_admin_name(client/admin)
	var/feedback_link = admin.holder.feedback_link()
	return isnull(feedback_link) ? admin : "<a href=[feedback_link]>[admin]</a>"

/// Proc that gathers adminwho information for a general player, which will only give information if an admin isn't AFK, and handles potential fakekeying.
/// Will return a list of strings.
/proc/get_general_adminwho_information(list/checkable_admins)
	var/returnable_list = list()

	for(var/client/admin in checkable_admins)
		if(admin.is_afk() || !isnull(admin.holder.fakekey))
			continue //Don't show afk or fakekeyed admins to adminwho

		returnable_list += "[get_linked_admin_name(admin)] \[[admin.holder.rank_names()]\]" //SS1984 EDIT ADMINWHO

	return returnable_list

/// Proc that gathers adminwho information for admins, which will contain information on if the admin is AFK, readied to join, etc. Only arg is a list of clients to use.
/// Will return a list of strings.
/proc/get_sensitive_adminwho_information(list/checkable_admins)
	var/returnable_list = list()

	for(var/client/admin in checkable_admins)
		var/list/admin_strings = list()

		admin_strings += "[get_linked_admin_name(admin)] \[[admin.holder.rank_names()]\]" //SS1984 EDIT ADMINWHO

		if(admin.holder.fakekey)
			admin_strings += "<i>(как [admin.holder.fakekey])</i>" //SS1984 EDIT

		if(isobserver(admin.mob))
			admin_strings += "- Наблюдает" //SS1984 EDIT
		else if(isnewplayer(admin.mob))
			if(SSticker.current_state <= GAME_STATE_PREGAME)
				var/mob/dead/new_player/lobbied_admin = admin.mob
				if(lobbied_admin.ready == PLAYER_READY_TO_PLAY)
					admin_strings += "- В лобби (Готов)" //SS1984 EDIT
				else
					admin_strings += "- В Лобби (Не готов)" //SS1984 EDIT
			else
				admin_strings += "- В Лобби" //SS1984 EDIT
		else
			admin_strings += "- Играет" //SS1984 EDIT

		if(admin.is_afk())
			admin_strings += "(АФК)" //SS1984 EDIT

		returnable_list += jointext(admin_strings, " ")

	return returnable_list

#undef DEFAULT_WHO_CELLS_PER_ROW
#undef NO_ADMINS_ONLINE_MESSAGE
