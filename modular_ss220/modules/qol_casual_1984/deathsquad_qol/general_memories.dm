/datum/memory/station_nuke_code_know
	story_value = STORY_VALUE_KEY
	memory_flags = MEMORY_NO_STORY|MEMORY_FLAG_NOMOOD|MEMORY_FLAG_NOLOCATION|MEMORY_FLAG_NOPERSISTENCE|MEMORY_FLAG_NOSTATIONNAME
	var/nuke_code

/datum/memory/station_nuke_code_know/New(
	datum/mind/memorizer_mind,
	atom/protagonist,
	atom/deuteragonist,
	atom/antagonist,
	nuke_code,
)
	src.nuke_code = nuke_code
	return ..()

/datum/memory/station_nuke_code_know/get_names()
	return list("[/obj/machinery/nuclearbomb/selfdestruct::name] code: [nuke_code]")
