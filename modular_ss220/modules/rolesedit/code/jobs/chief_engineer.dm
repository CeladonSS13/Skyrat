/datum/outfit/job/ce/pre_equip(mob/living/carbon/human/human, visualsOnly)
	. = ..()
	backpack_contents -= list(
		/obj/item/extinguisher/mini = 1,
		/obj/item/analyzer = 1,
	)
