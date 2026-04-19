/obj/item/gun/energy/ionrifle/Initialize(mapload)
	. = ..()
	fire_delay = 0 // idk why nova does it on initialize(), but now we have to do the same
