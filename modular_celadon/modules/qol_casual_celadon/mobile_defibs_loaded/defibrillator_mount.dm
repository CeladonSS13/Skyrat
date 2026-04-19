/obj/machinery/defibrillator_mount/mobile/loaded/Initialize(mapload)
	. = ..()
	defib = new/obj/item/defibrillator/loaded(src)
	update_appearance()

/obj/machinery/defibrillator_mount/mobile/immobile/loaded/Initialize(mapload) // upsteram madness...
	. = ..()
	defib = new/obj/item/defibrillator/loaded(src)
	update_appearance()
