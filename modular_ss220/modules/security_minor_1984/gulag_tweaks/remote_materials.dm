/datum/component/remote_materials
	var/allow_link_from_mining = TRUE

/datum/component/remote_materials/check_z_level(obj/silo_to_check = silo)
	. = ..()
	if (!.)
		if (!allow_link_from_mining) // vanila way
			return FALSE

		var/turf/source_loc = get_turf(silo_to_check)
		var/turf/checking_loc = get_turf(parent)
		if (!source_loc || !checking_loc)
			return FALSE

		if (is_station_level(source_loc.z) && is_mining_level(checking_loc.z))
			return TRUE

		return source_loc.z == checking_loc.z
	return .
