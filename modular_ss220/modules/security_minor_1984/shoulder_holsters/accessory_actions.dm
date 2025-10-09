/datum/action/item_action/accessory/holster
	name = "Holster"
	button_icon = 'icons/obj/clothing/accessories.dmi'
	button_icon_state = "holster"

/datum/action/item_action/accessory/holster/IsAvailable(feedback = FALSE)
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
