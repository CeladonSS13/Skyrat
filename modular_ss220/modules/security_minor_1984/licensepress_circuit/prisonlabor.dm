#define DEFAULT_PLATE_PRESS_SPEED_MOD 1.0

/obj/machinery/plate_press
	circuit = /obj/item/circuitboard/machine/plate_press
	var/speed_modifier = DEFAULT_PLATE_PRESS_SPEED_MOD // recalculated on parts changed

/obj/machinery/plate_press/RefreshParts()
	. = ..()

	speed_modifier = DEFAULT_PLATE_PRESS_SPEED_MOD

	for(var/datum/stock_part/matter_bin/new_matter_bin in component_parts)
		speed_modifier -= new_matter_bin.tier * 0.025

	for(var/datum/stock_part/servo/new_servo in component_parts)
		speed_modifier -= new_servo.tier * 0.5

	// so tier 4 bin and tier 4 servo gives
	// 4 * 0.025 + 4 * 0.05 = 0.3 modifier reduce
	// 1.0 - 0.3 = 0.7 modifier, prison business is real

	if (speed_modifier < 0)
		speed_modifier = 0

#undef DEFAULT_PLATE_PRESS_SPEED_MOD
