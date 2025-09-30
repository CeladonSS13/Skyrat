/datum/job/cyborg/get_latejoin_spawn_point()
	var/static/list/areas_to_check = list( // it doesn't check it on order, just random one from those
		/area/station/science/robotics,
		/area/station/science/robotics/lab,
		/area/station/science/robotics/mechbay,
		/area/station/science/robotics/storage,
		/area/station/science/robotics/augments,
	)

	var/list/all_chargers = SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/recharge_station)
	var/turf/result = try_find_latejoin_spawn_on_area(areas_to_check, all_chargers)

	if (!isnull(result))
		return result

	var/static/list/failsafe_spawnpoints = list( // should be list
		/area/station/ai_monitored/turret_protected/aisat_interior,
	)

	result = try_find_latejoin_spawn_on_area(failsafe_spawnpoints, all_chargers)

	if (!isnull(result))
		return result

	return ..()

/datum/job/cyborg/after_latejoin_spawn(mob/living/spawning)
	. = ..()

	if (!spawning)
		return .

	var/obj/machinery/computer/cryopod/control_comp
	for(var/obj/machinery/computer/cryopod/cryo_console in GLOB.cryopod_computers)
		var/turf/target_turf = get_turf(cryo_console)
		if(is_station_level(target_turf.z)) // take first
			control_comp = cryo_console
			break

	if (!control_comp)
		return .

	var/chosen_title
	if (spawning.client && spawning.client.prefs && spawning.client.prefs.alt_job_titles)
		chosen_title = spawning.client.prefs.alt_job_titles[title]
	if (!chosen_title)
		chosen_title = title

	control_comp.announce("CRYO_JOIN", spawning.real_name, chosen_title, /datum/job/cyborg::departments_bitflags)

	return .

/datum/job/cyborg/proc/try_find_latejoin_spawn_on_area(list/areas_to_check, list/all_chargers = null)
	if (isnull(all_chargers))
		all_chargers = SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/recharge_station)
	if (!all_chargers || length(all_chargers) < 1)
		return null

	var/list/valid_areas_types = list()
	for (var/area_type_to_check as anything in areas_to_check)
		if (!(area_type_to_check in GLOB.areas_by_type))
			continue

		var/area/area_to_check = GLOB.areas_by_type[area_type_to_check]
		if (!area_to_check)
			continue // weird, but just in case

		valid_areas_types += area_type_to_check

	if (!valid_areas_types || length(valid_areas_types) < 1)
		return null

	var/list/valid_chargers = list()
	for (var/obj/machinery/recharge_station/charger in all_chargers)
		if (charger.occupant)
			continue

		var/area/charger_area = get_area(charger)
		if (!(charger_area.type in valid_areas_types))
			continue

		if ((charger.machine_stat & BROKEN) || (charger.machine_stat & MAINT) || (charger.machine_stat & NOPOWER) || (charger.machine_stat & EMPED))
			continue

		var/turf/charger_turf = get_turf(charger)
		if (!charger_turf || charger_turf.is_blocked_turf(exclude_mobs = FALSE)) // actually it still considered valid if someone in turf, but that's kind of rare issue
			continue

		valid_chargers += charger

	if (!valid_chargers || length(valid_chargers) < 1)
		return null

	var/obj/machinery/recharge_station/final_charger = pick(valid_chargers)
	if (!final_charger)
		return null

	var/turf/final_turf = get_turf(final_charger)
	if (!final_turf)
		return null

	return final_turf
