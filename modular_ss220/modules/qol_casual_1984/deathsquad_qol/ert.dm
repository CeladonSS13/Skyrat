/datum/antagonist/ert/deathsquad/proc/find_valid_selfdestruct()
	for(var/obj/machinery/nuclearbomb/selfdestruct/self_destruct as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/nuclearbomb/selfdestruct))
		if(!self_destruct || !SSmapping.level_trait(self_destruct.z, ZTRAIT_STATION))
			continue
		return self_destruct

/datum/antagonist/ert/deathsquad/forge_objectives()
	. = ..()
	var/obj/machinery/nuclearbomb/selfdestruct/self_destruct = find_valid_selfdestruct()
	if(!self_destruct)
		return .

	if(self_destruct.r_code == NUKE_CODE_UNSET)
		self_destruct.r_code = random_nukecode()

	var/datum/objective/missionobj = new ()
	missionobj.owner = owner
	missionobj.explanation_text = "[/obj/machinery/nuclearbomb/selfdestruct::name] code is: [self_destruct.r_code]."
	missionobj.no_failure = TRUE // don't print

	objectives += missionobj // disk code info, not real a mission, just show in tgui

	// also to memories
	owner.add_memory(/datum/memory/station_nuke_code_know, nuke_code = self_destruct.r_code)

/datum/antagonist/ert/deathsquad/leader/forge_objectives()
	var/obj/machinery/nuclearbomb/selfdestruct/self_destruct = find_valid_selfdestruct()
	if(!self_destruct)
		message_admins("Looks like there is no self destruct on station level. You might need to give deathsquad new nuke") // print only once (called per leader)
	return ..()

/datum/outfit/centcom/death_commando/New()
	. = ..()
	backpack_contents += list(
		/obj/item/pinpointer/nuke = 1,
	)

/datum/outfit/centcom/death_commando/officer/New()
	. = ..()
	backpack_contents += list(
		/obj/item/disk/nuclear = 1,
	)
