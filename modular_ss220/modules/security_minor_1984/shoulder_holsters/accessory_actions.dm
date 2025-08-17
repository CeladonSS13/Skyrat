// for clothing accessories like holsters
/datum/action/item_action/accessory
	check_flags = AB_CHECK_INCAPACITATED|AB_CHECK_CONSCIOUS

/datum/action/item_action/accessory/IsAvailable(feedback = FALSE)
	. = ..()
	if(!.)
		return FALSE
	var/obj/item/item_target = target
	if (!item_target)
		return FALSE
	if(item_target.loc == owner)
		return TRUE
	if(istype(item_target.loc, /obj/item/clothing/under) && item_target.loc.loc == owner)
		return TRUE
	return FALSE

/datum/action/item_action/accessory/holster
	name = "Holster"
