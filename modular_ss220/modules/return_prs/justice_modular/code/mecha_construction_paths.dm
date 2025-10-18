/datum/component/construction/unordered/mecha_chassis
	var/icon_for_spawn_result = 'icons/mob/rideables/mech_construction.dmi'

//Justice
/datum/component/construction/unordered/mecha_chassis/justice
	result = /datum/component/construction/mecha/justice
	steps = list(
		/obj/item/mecha_parts/part/justice_torso,
		/obj/item/mecha_parts/part/justice_left_arm,
		/obj/item/mecha_parts/part/justice_right_arm,
		/obj/item/mecha_parts/part/justice_left_leg,
		/obj/item/mecha_parts/part/justice_right_leg
	)
	icon_for_spawn_result = 'modular_ss220/modules/return_prs/justice_modular/icons/mech_construction.dmi'

/datum/component/construction/unordered/mecha_chassis/justice/update_parent()
	var/atom/parent_atom = parent
	if (parent_atom)
		parent_atom.icon = 'modular_ss220/modules/return_prs/justice_modular/icons/mech_construct.dmi'

/datum/component/construction/mecha/justice
	result = /obj/vehicle/sealed/mecha/justice
	base_icon = "justice"

	inner_plating = /obj/item/stack/telecrystal
	inner_plating_amount = 8

	outer_plating = /obj/item/mecha_parts/part/justice_armor
	outer_plating_amount = 1

/datum/component/construction/mecha/justice/get_circuit_steps()
	return list()

/datum/component/construction/mecha/justice/get_inner_plating_steps()
	return list(
		list(
			"key" = inner_plating,
			"amount" = inner_plating_amount,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured, and [inner_plating_amount] <b>telecrystals</b> can be added.",
			"forward_message" = "added telecrystal",
			"backward_message" = "unsecured power cell"
		)
	)
