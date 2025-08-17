/datum/job/prisoner/get_latejoin_spawn_point()
	. = ..()
	var/turf/spawn_point_original = .
	if (!spawn_point_original)
		return .
	var/turf/spawn_point
	var/list/turf/possible_turfs = list()
	for(var/obj/machinery/cryopod/prison/cryo_pod as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/cryopod/prison))
		if (!cryo_pod)
			continue

		var/area/cryopod_area = get_area(cryo_pod)
		if (!cryopod_area || !istype(cryopod_area, /area/station/security/prison))
			continue

		var/turf/cryopod_turf = get_turf(cryo_pod)
		if (!cryopod_turf)
			continue

		possible_turfs += cryopod_turf

	if (length(possible_turfs) < 1)
		return .

	spawn_point = pick(possible_turfs)

	. = spawn_point ? spawn_point : spawn_point_original
	return .
