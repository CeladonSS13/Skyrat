/datum/controller/subsystem/autotransfer/fire()
	if (!GLOB.player_list || !GLOB.player_list.len || GLOB.player_list.len < 1)
		return
	..()
