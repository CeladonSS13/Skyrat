SUBSYSTEM_DEF(server_monitoring)
	name = "Server Monitoring"
	flags = SS_BACKGROUND
	wait = 30 SECONDS // Default wait time before fire() invoked
	runlevels = RUNLEVEL_LOBBY | RUNLEVEL_SETUP | RUNLEVEL_GAME | RUNLEVEL_POSTGAME

/datum/controller/subsystem/server_monitoring/Initialize()
	if (!CONFIG_GET(flag/compatible_to_server_monitoring) || !CONFIG_GET(string/server_monitoring_filesave_path))
		return SS_INIT_FAILURE // it's ok, server just not configured to use it

	return SS_INIT_SUCCESS

/datum/controller/subsystem/server_monitoring/fire()
	var/fpath = CONFIG_GET(string/server_monitoring_filesave_path)
	if (!fpath)
		return
	var/datum/json_savefile/savefile = new /datum/json_savefile(fpath)
	var/map_name = SSmapping.current_map?.map_name // don't even try to exploit it with VV, it's validated on monitoring server anyway
	if (!map_name)
		map_name = "?"

	var/list/adminstuff_list = get_list_of_admins()
	var/adminstuff_count = 0
	if (adminstuff_list)
		adminstuff_count = adminstuff_list.len
	// STATION_TIME would be incorrect to use here, as it could result in something like 23:55:30... and so on when round is not started, but lobby loaded (because of SSticker.round_start_time), so instead using world.time (ticks)
	var/round_time = "[world.time > MIDNIGHT_ROLLOVER ? "[round(world.time/MIDNIGHT_ROLLOVER)]:[gameTimestamp(wtime=world.time)]" : gameTimestamp(wtime=world.time)]"
	if (!round_time)
		round_time = "?"

	savefile.set_entry("OnlineTotal", GLOB.clients.len)
	savefile.set_entry("OnlineAdminStuff", adminstuff_count)
	savefile.set_entry("RoundTime", round_time)
	savefile.set_entry("UpdatedAt", time2text(world.timeofday, "YYYY-MM-DD hh:mm:ss"))
	savefile.set_entry("Map", map_name)

	savefile.save()
