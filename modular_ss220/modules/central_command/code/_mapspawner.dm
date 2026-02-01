#define INIT_ANNOUNCE(X) to_chat(world, span_boldannounce("[X]")); log_world(X)

/datum/controller/subsystem/mapping/loadWorld()
	. = ..()
	var/list/FailedZsRat1984_interlink = list()
	LoadGroup(FailedZsRat1984_interlink, "The Interlink", "map_files/generic", "CentCom_interlink_1984.dmm", default_traits = ZTRAITS_CENTCOM)
	if(LAZYLEN(FailedZsRat1984_interlink))
		var/msg = "RED ALERT! The following map files failed to load: [FailedZsRat1984_interlink[1]]"
		if(FailedZsRat1984_interlink.len > 1)
			for(var/I in 2 to FailedZsRat1984_interlink.len)
				msg += ", [FailedZsRat1984_interlink[I]]"
		msg += ". Yell at your server host!"
		INIT_ANNOUNCE(msg)
	var/list/FailedZsRat1984_centcom = list()
	LoadGroup(FailedZsRat1984_centcom, "CentCom_Station", "map_files/generic", "CentCom_1984.dmm", default_traits = ZTRAITS_CENTCOM)
	if(LAZYLEN(FailedZsRat1984_centcom))
		var/msg = "RED ALERT! The following map files failed to load: [FailedZsRat1984_centcom[1]]"
		if(FailedZsRat1984_centcom.len > 1)
			for(var/I in 2 to FailedZsRat1984_centcom.len)
				msg += ", [FailedZsRat1984_centcom[I]]"
		msg += ". Yell at your server host!"
		INIT_ANNOUNCE(msg)
	//spawn ds-2 if this current map with space
	if(SSmapping.current_map.space_ruin_levels)
		var/list/FailedZsRat1984_syndicate = list()
		LoadGroup(FailedZsRat1984_syndicate, "The Syndicate Area", "RandomRuins/SpaceRuins/nova", "des_two1984.dmm", default_traits = list(ZTRAIT_LINKAGE = CROSSLINKED))
		if(LAZYLEN(FailedZsRat1984_syndicate))
			var/msg = "RED ALERT! The following map files failed to load: [FailedZsRat1984_syndicate[1]]"
			if(FailedZsRat1984_syndicate.len > 1)
				for(var/I in 2 to FailedZsRat1984_syndicate.len)
					msg += ", [FailedZsRat1984_syndicate[I]]"
			msg += ". Yell at your server host!"
			INIT_ANNOUNCE(msg)

#undef INIT_ANNOUNCE
