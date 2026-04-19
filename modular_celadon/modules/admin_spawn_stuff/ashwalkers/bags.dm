/obj/item/storage/bag/quiver/really_full

/obj/item/storage/bag/quiver/really_full/PopulateContents()
	. = ..()
	for(var/i in 1 to 40)
		new arrow_path(src)
