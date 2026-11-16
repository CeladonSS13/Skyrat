/proc/try_show_cryomessage_for_spawn(mob/living/carbon/human/character, rank)
	if (!character)
		return FALSE
	var/turf/tile = get_turf(character)
	if(!isturf(tile))
		return FALSE
	var/obj/machinery/cryopod/cryo_pod_instance
	for(var/obj/machinery/cryopod/cryo_pod in tile)
		if (!cryo_pod)
			continue
		cryo_pod_instance = cryo_pod
		break
	if (!cryo_pod_instance)
		return FALSE
	var/area/cryo_pod_area = get_area(cryo_pod_instance)
	if (!cryo_pod_area)
		return FALSE
	var/obj/machinery/computer/cryopod/control_comp
	for(var/cryo_console as anything in GLOB.cryopod_computers)
		var/obj/machinery/computer/cryopod/console = cryo_console
		var/area/console_area = get_area(cryo_console)
		if(console_area == cryo_pod_area)
			control_comp = console
			break
	if (!control_comp)
		return FALSE

	var/occupant_departments_bitflags = character.mind?.assigned_role.departments_bitflags

	control_comp.announce("CRYO_JOIN", character.real_name, rank, occupant_departments_bitflags)
	return TRUE
