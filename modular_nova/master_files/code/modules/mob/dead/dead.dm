/mob/dead/get_status_tab_items()
	. = ..()
	if(SSticker.HasRoundStarted())
		return
	var/time_remaining = SSticker.GetTimeLeft()
	if(time_remaining > 0)
		. += "Time To Start: [round(time_remaining/10)]s"
	else if(time_remaining == -10)
		. += "Time To Start: DELAYED"
	else
		. += "Time To Start: SOON"

	. += "Players: [LAZYLEN(GLOB.clients)]"
	if(client.holder)
		. += "Players Ready: [SSticker.totalPlayersReady]"
		. += "Admins Ready: [SSticker.total_admins_ready] / [length(GLOB.admins)]"
	if(length(SSstatpanels.player_ready_data) || length(SSstatpanels.command_player_ready_data))
		// SS1984 ADDITION START
		// In case it was disabled in config: show only to non-deadminned admins
		var/show_stat = CONFIG_GET(flag/show_job_estimation)
		if (!show_stat)
			show_stat = (client in GLOB.admins)
			if (show_stat)
				show_stat = !(client in GLOB.deadmins)
		if (!show_stat)
			return .
		// SS1984 ADDITION END
		. += SSstatpanels.get_job_estimation()

