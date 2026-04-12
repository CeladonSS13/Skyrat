#define INIT_ANNOUNCE(X) to_chat(world, span_boldannounce("[X]")); log_world(X)

/datum/controller/subsystem/mapping/loadWorld()
	. = ..()
	var/list/FailedZsRatCeladon_interlink = list()
	LoadGroup(FailedZsRatCeladon_interlink, "The Interlink", "map_files/generic", "CentCom_interlink_Celadon.dmm", default_traits = ZTRAITS_CENTCOM)
	if(LAZYLEN(FailedZsRatCeladon_interlink))
		var/msg = "RED ALERT! The following map files failed to load: [FailedZsRatCeladon_interlink[1]]"
		if(FailedZsRatCeladon_interlink.len > 1)
			for(var/I in 2 to FailedZsRatCeladon_interlink.len)
				msg += ", [FailedZsRatCeladon_interlink[I]]"
		msg += ". Yell at your server host!"
		INIT_ANNOUNCE(msg)
	var/list/FailedZsRatCeladon_centcom = list()
	LoadGroup(FailedZsRatCeladon_centcom, "CentCom_Station", "map_files/generic", "CentCom_Celadon.dmm", default_traits = ZTRAITS_CENTCOM)
	if(LAZYLEN(FailedZsRatCeladon_centcom))
		var/msg = "RED ALERT! The following map files failed to load: [FailedZsRatCeladon_centcom[1]]"
		if(FailedZsRatCeladon_centcom.len > 1)
			for(var/I in 2 to FailedZsRatCeladon_centcom.len)
				msg += ", [FailedZsRatCeladon_centcom[I]]"
		msg += ". Yell at your server host!"
		INIT_ANNOUNCE(msg)
	//spawn ds-2 if this current map with space
	if(SSmapping.current_map.space_ruin_levels)
		var/list/FailedZsRatCeladon_syndicate = list()
		LoadGroup(FailedZsRatCeladon_syndicate, "The Syndicate Area", "RandomRuins/SpaceRuins/nova", "des_two_celadon.dmm", default_traits = list(ZTRAIT_LINKAGE = CROSSLINKED))
		if(LAZYLEN(FailedZsRatCeladon_syndicate))
			var/msg = "RED ALERT! The following map files failed to load: [FailedZsRatCeladon_syndicate[1]]"
			if(FailedZsRatCeladon_syndicate.len > 1)
				for(var/I in 2 to FailedZsRatCeladon_syndicate.len)
					msg += ", [FailedZsRatCeladon_syndicate[I]]"
			msg += ". Yell at your server host!"
			INIT_ANNOUNCE(msg)

#undef INIT_ANNOUNCE
