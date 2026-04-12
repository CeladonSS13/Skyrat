#define DEFAULT_PLATE_PRESS_SPEED_MOD 1.0

/obj/machinery/plate_press
	circuit = /obj/item/circuitboard/machine/plate_press
	var/speed_modifier = DEFAULT_PLATE_PRESS_SPEED_MOD // recalculated on parts changed

/obj/machinery/plate_press/RefreshParts()
	. = ..()

	speed_modifier = DEFAULT_PLATE_PRESS_SPEED_MOD

	for(var/datum/stock_part/matter_bin/new_matter_bin in component_parts)
		speed_modifier -= ((new_matter_bin.tier - 1) * 0.03)

	for(var/datum/stock_part/servo/new_servo in component_parts)
		speed_modifier -= ((new_servo.tier - 1) * 0.07)

	// so tier 4 bin and tier 4 servo gives
	// 4 * 0.025 + 4 * 0.05 = 0.3 modifier reduce
	// 1.0 - 0.3 = 0.7 modifier, prison business is real

	if (speed_modifier < 0)
		speed_modifier = 0

/obj/machinery/plate_press/examine(mob/user)
	. = ..()

	if(in_range(user, src) || isobserver(user))
		. += span_notice("The status display reads:")
		. += span_notice(" - Speed efficiency at <b>[(1 + 1 - speed_modifier) * 100]%</b>.")

/obj/machinery/plate_press/screwdriver_act(mob/living/user, obj/item/tool)
	if(!default_deconstruction_screwdriver(user, icon_state, icon_state, tool))
		return ITEM_INTERACT_BLOCKING

	if(machine_stat & MAINT)
		set_machine_stat(machine_stat & ~MAINT)
	else
		set_machine_stat(machine_stat | MAINT)

	pressing = FALSE
	update_appearance()

	return ITEM_INTERACT_SUCCESS

/obj/machinery/plate_press/crowbar_act(mob/living/user, obj/item/tool)
	if(!default_deconstruction_crowbar(tool))
		return ITEM_INTERACT_BLOCKING

	if (!isnull(current_plate))
		var/turf/drop_location = drop_location()

		if(drop_location)
			current_plate.forceMove(drop_location)
		else
			current_plate.moveToNullspace()

		current_plate = null
	return ITEM_INTERACT_SUCCESS

/obj/machinery/plate_press/proc/still_processing()
	return pressing

#undef DEFAULT_PLATE_PRESS_SPEED_MOD
