/obj/machinery/defibrillator_mount/mobile/loaded/Initialize(mapload)
	. = ..()
	defib = new/obj/item/defibrillator/loaded(src)
	update_appearance()
