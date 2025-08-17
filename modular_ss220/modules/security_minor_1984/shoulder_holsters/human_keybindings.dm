#define COMSIG_KB_HUMAN_HOLSTER_DOWN "keybinding_human_holster_down"

/datum/keybinding/human/holster
	hotkey_keys = list("H")
	name = "holster"
	full_name = "Holster"
	description = "Quickly draws an holstered gun in suit's shoulder holster. Doesn't work for belt holsters"
	keybind_signal = COMSIG_KB_HUMAN_HOLSTER_DOWN

/datum/keybinding/human/holster/down(client/user, turf/target)
	. = ..()
	var/mob/living/carbon/human/M = user.mob
	if(!M.w_uniform)
		return
	var/obj/item/clothing/accessory/holster/H = locate() in M.w_uniform
	H?.handle_holster_usage(M)
	return TRUE
