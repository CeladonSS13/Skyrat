/datum/vote/restart_vote/is_config_enabled()
	return CONFIG_GET(flag/allow_vote_restart) && GLOB.player_list.len < CONFIG_GET(number/vote_restart_max_online)

/datum/vote/restart_vote/can_be_initiated(forced = FALSE)
	. = ..()

	if(. != VOTE_AVAILABLE || forced)
		return .

	var/max_allowed_players = CONFIG_GET(number/vote_restart_max_online)
	if (GLOB.player_list.len < max_allowed_players)
		return .

	return "This vote is only available with less than [max_allowed_players] online!"
