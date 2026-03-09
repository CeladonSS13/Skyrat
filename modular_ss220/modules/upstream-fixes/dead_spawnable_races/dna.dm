GLOBAL_LIST_EMPTY(races_valid_for_spawn_dead) // SS1984 ADDITION

/proc/get_roundstart_spawnable_dead_races()
	if (!GLOB.races_valid_for_spawn_dead.len)
		var/list/selectable_species = LAZYCOPY(get_selectable_species()) // it's important to copy, as we getting here GLOB list, yet we want to create new list
		// all unavailable species, only remove with SPECIES defines
		// considering it's done by var/id (which is string), can't declare new method to check it in /datum/species without rewriting upstream logic
		selectable_species -= SPECIES_NUCLEATION
		GLOB.races_valid_for_spawn_dead = selectable_species

	return GLOB.races_valid_for_spawn_dead
