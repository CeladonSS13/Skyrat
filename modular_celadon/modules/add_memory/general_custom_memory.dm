/datum/memory/general_custom_memory
	story_value = STORY_VALUE_NONE
	memory_flags = MEMORY_FLAG_NOMOOD|MEMORY_FLAG_NOLOCATION|MEMORY_FLAG_NOPERSISTENCE|MEMORY_SKIP_UNCONSCIOUS|MEMORY_NO_STORY // No story for this
	var/custom_desc

/datum/memory/general_custom_memory/New(
	datum/mind/memorizer_mind,
	atom/protagonist,
	atom/deuteragonist,
	atom/antagonist,
	custom_desc,
)
	src.custom_desc = custom_desc
	return ..()

/datum/memory/general_custom_memory/get_names()
	return list(custom_desc)
