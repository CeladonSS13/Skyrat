/obj/item/gun/ballistic/revolver/c38
	w_class = WEIGHT_CLASS_SMALL // concealed carry blickinator

// CELADON REMOVAL START
// /obj/item/gun/ballistic/revolver/russian/Initialize(mapload)
// 	. = ..()
// 	if(mapload)
// 		new /obj/item/gun/ballistic/revolver/sol(get_turf(src))
// 		return INITIALIZE_HINT_QDEL

// /obj/item/gun/ballistic/revolver/russian/soul/Initialize(mapload)
// 	. = ..()
// 	if (mapload)
// 		new /obj/item/stack/spacecash/c1000{amount = 2}(get_turf(src)) //done for the relic since it can be sold for 4-5k
// CELADON REMOVAL END
