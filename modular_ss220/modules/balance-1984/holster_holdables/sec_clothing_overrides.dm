/datum/storage/holster/New(atom/parent, max_slots, max_specific_storage, max_total_storage, rustle_sound, remove_rustle_sound, list/holdables)
	. = ..()
	if(length(holdables))
		set_holdable(holdables)
		return

	set_holdable(list(
		/obj/item/gun/ballistic/automatic/pistol,
		/obj/item/gun/ballistic/revolver,
		/obj/item/gun/energy/e_gun/mini,
		/obj/item/gun/energy/disabler,
		/obj/item/gun/energy/dueling,
		/obj/item/food/grown/banana,
		/obj/item/gun/energy/laser/thermal,
		/obj/item/gun/ballistic/rifle/boltaction, //fits if you make it an obrez
		/obj/item/gun/energy/laser/captain,
		/obj/item/gun/energy/e_gun/hos,
		// NOVA EDIT ADDITION START
		/obj/item/ammo_box/magazine, // Just magazine, because the sec-belt can hold these aswell
		/obj/item/ammo_box/speedloader,
		/obj/item/gun/energy/recharge/kinetic_accelerator/variant/glock,
		// NOVA EDIT ADDITION END
		/obj/item/gun/energy/e_gun/advtaser, // SS1984 ADDITION
	))
