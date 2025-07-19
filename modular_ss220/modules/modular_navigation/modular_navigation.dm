SUBSYSTEM_DEF(extended_navigation)
	name = "Extended Navigation"
	flags = SS_NO_FIRE
	dependencies = list(/datum/controller/subsystem/machines, /datum/controller/subsystem/atoms)

/datum/controller/subsystem/extended_navigation/Initialize() // god bless, contractor now can find where is BRIG MAINTENANCE...
	for(var/obj/machinery/power/apc/current_apc as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/power/apc))
		if(!SSmapping.level_trait(current_apc.z, ZTRAIT_STATION)) // no paths for lavalend
			continue
		var/area/apc_area = current_apc.area
		var/area_name = get_area_name(apc_area, format_text = TRUE)
		GLOB.navigate_destinations[current_apc.loc] = area_name // so we bind it to apc location (easier for engineers btw)

	return SS_INIT_SUCCESS
