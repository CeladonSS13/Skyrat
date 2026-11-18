/datum/mind
	var/list/memories_custom = list()
	var/new_memory_index = 0

/datum/mind/Destroy()
	QDEL_LIST_ASSOC_VAL(memories_custom)
	new_memory_index = 0
	return ..()
