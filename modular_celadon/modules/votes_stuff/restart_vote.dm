/// maximum online when restart vote is available to players
/datum/config_entry/number/vote_restart_max_online
	default = 999
	integer = TRUE
	min_val = 0

/datum/vote/restart_vote/can_be_initiated(forced = FALSE)
	. = ..()

	if(. != VOTE_AVAILABLE || forced)
		return .

	var/max_allowed_players = CONFIG_GET(number/vote_restart_max_online)
	if (GLOB.player_list.len < max_allowed_players)
		return .

	return "This vote is only available with less than [max_allowed_players] online!"
