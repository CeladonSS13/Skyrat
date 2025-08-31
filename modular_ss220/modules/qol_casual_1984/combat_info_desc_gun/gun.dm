/obj/item/gun/proc/set_chambered(obj/item/ammo_casing/new_chambered)
	chambered = new_chambered
	if (isnull(chambered))
		return
	chambered.set_chamber_source(src)
