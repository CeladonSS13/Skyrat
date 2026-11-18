
//egun
/obj/item/gun/energy/e_gun/nuclear
	ammo_type = list(/obj/item/ammo_casing/energy/laser, /obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/electrode) // added /obj/item/ammo_casing/energy/electrode

//ion
/obj/item/gun/energy/ionrifle/Initialize(mapload)
	. = ..()
	fire_delay = 0 // idk why nova does it on initialize(), but now we have to do the same
