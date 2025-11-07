/obj/item/melee/baton/security
	///Whether or not our baton visibly changes the inhand sprite based on inserted cell
	var/tip_changes_color = TRUE
	lefthand_file = 'modular_ss220/modules/return_prs/stunbaton_tip_color/icons/security_lefthand.dmi'
	righthand_file = 'modular_ss220/modules/return_prs/stunbaton_tip_color/icons/security_righthand.dmi'

/obj/item/melee/baton/security/toggle_light()
	set_light_color(get_baton_tip_color(TRUE))
	return ..()

/// Change our baton's top color based on the contained cell.
/obj/item/melee/baton/security/proc/get_baton_tip_color(set_light = FALSE)
	var/tip_type_to_set
	var/tip_light_to_set

	if(cell)
		var/chargepower = cell.maxcharge
		var/zap_value = clamp(chargepower/STANDARD_CELL_CHARGE, 0, 100)
		switch(zap_value)
			if(-INFINITY to 10)
				tip_type_to_set = "orange"
				tip_light_to_set = LIGHT_COLOR_ORANGE
			if(11 to 20)
				tip_type_to_set = "red"
				tip_light_to_set = LIGHT_COLOR_INTENSE_RED
			if(21 to 30)
				tip_type_to_set = "green"
				tip_light_to_set = LIGHT_COLOR_GREEN
			if(31 to INFINITY)
				tip_type_to_set = "blue"
				tip_light_to_set = LIGHT_COLOR_BLUE
	else
		tip_type_to_set = "orange"

	return set_light ? tip_light_to_set : tip_type_to_set

/obj/item/melee/baton/security/cattleprod
	tip_changes_color = FALSE

/obj/item/melee/baton/security/boomerang
	tip_changes_color = FALSE

/obj/item/melee/baton/security/stunsword
	lefthand_file = 'icons/mob/inhands/64x64_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/64x64_righthand.dmi'
	tip_changes_color = FALSE // no such sprites sadly
