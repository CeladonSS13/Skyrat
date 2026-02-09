/datum/outfit/job/ce/pre_equip(mob/living/carbon/human/human, visualsOnly)
	. = ..()
	backpack_contents -= list(
		/obj/item/extinguisher/mini = 1,
		/obj/item/analyzer = 1,
	)

//belt override
/obj/item/storage/belt/utility/chief/full/PopulateContents()
	SSwardrobe.provide_type(/obj/item/screwdriver/power, src)
	SSwardrobe.provide_type(/obj/item/crowbar/power, src)
	SSwardrobe.provide_type(/obj/item/weldingtool/experimental, src)
	SSwardrobe.provide_type(/obj/item/multitool, src)
	SSwardrobe.provide_type(/obj/item/stack/cable_coil, src)
	SSwardrobe.provide_type(/obj/item/extinguisher/mini, src)
	SSwardrobe.provide_type(/obj/item/analyzer, src)

/obj/item/storage/belt/utility/chief/full/get_types_to_preload()
	var/list/to_preload = list()
	to_preload += /obj/item/screwdriver/power
	to_preload += /obj/item/crowbar/power
	to_preload += /obj/item/weldingtool/experimental
	to_preload += /obj/item/multitool
	to_preload += /obj/item/stack/cable_coil
	to_preload += /obj/item/extinguisher/mini
	to_preload += /obj/item/analyzer
	return to_preload
