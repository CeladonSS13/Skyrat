/datum/world_topic/status/Run(list/input)
	. = list()

	.["round_id"] = GLOB.round_id
	.["players"] = GLOB.clients.len

	var/list/adm = get_admin_counts()
	var/list/presentmins = adm["present"]
	var/list/afkmins = adm["afk"]

	.["admins"] = presentmins.len + afkmins.len //equivalent to the info gotten from adminwho
	.["security_level"] = SSsecurity_level.get_current_level_as_text()
	.["round_duration"] = SSticker ? round((world.time-SSticker.round_start_time)/10) : 0
	.["time_dilation_current"] = SStime_track.time_dilation_current
	.["time_dilation_avg"] = SStime_track.time_dilation_avg
	.["gamestate"] = SSticker.current_state

/datum/world_topic/fixtts
	keyword = "fixtts"
	require_comms_key = TRUE


/datum/world_topic/fixtts/Run(list/input)
	var/datum/tts_provider/silero = SSttsSilero.tts_providers["Silero"]
	log_topic("SStts.tts_providers\[Silero].is_enabled = [silero.is_enabled]")
	if(!silero.is_enabled)
		silero.is_enabled = TRUE
		silero.failed_requests_limit += initial(silero.failed_requests_limit)
		to_chat(world, "<span class='announce'>SERVER: провайдер Silero в подсистеме SStts принудительно включен!</span>")
		return json_encode(list("success" = "SStts\[Silero] was force enabled"))
	return json_encode(list("error" = "SStts\[Silero] is already enabled"))

/datum/world_topic/playerlist
	keyword = "playerlist"

/datum/world_topic/playerlist/Run(list/input)
	var/list/keys = list()
	for(var/I in GLOB.clients)
		var/client/C = I
		keys += C.key

	return json_encode(keys)

/datum/world_topic/playerlist_ext
	keyword = "playerlist_ext"
	require_comms_key = TRUE

/datum/world_topic/playerlist_ext/Run(list/input)
	. = list()
	var/list/players = list()
	var/list/disconnected_observers = list()

	for(var/mob/M in GLOB.dead_mob_list)
		if(!M.ckey)
			continue
		if (M.client)
			continue
		var/ckey = ckey(M.ckey)
		disconnected_observers[ckey] = ckey

	for(var/client/C as anything in GLOB.clients)
		var/ckey = C.ckey
		players[ckey] = ckey
		. += ckey

	for(var/mob/M in GLOB.alive_mob_list)
		if(!M.ckey)
			continue
		var/ckey = ckey(M.ckey)
		if(players[ckey])
			continue
		if(disconnected_observers[ckey])
			continue
		players[ckey] = ckey
		. += ckey

/datum/world_topic/status2
	keyword = "status2"

/datum/world_topic/status2/Run(list/input)
	. = list()
	.["mode"] = "dynamic"
	.["respawn"] = config ? !!CONFIG_GET(flag/allow_respawn) : FALSE
	.["enter"] = !LAZYACCESS(SSlag_switch.measures, DISABLE_NON_OBSJOBS)
	.["roundtime"] = gameTimestamp()
	.["listed"] = GLOB.hub_visibility
	.["players"] = GLOB.clients.len
	.["ticker_state"] = SSticker.current_state
	.["mapname"] = SSmapping.current_map?.map_name || "Loading..."
	.["security_level"] = SSsecurity_level.get_current_level_as_text()
	.["round_duration"] = SSticker ? round((world.time-SSticker.round_start_time)/10) : 0
