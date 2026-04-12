/obj/machinery/vending/engivend/Initialize(mapload)
	if (premium)
		premium[/obj/item/mod/module/jetpack] = 3 // premium price
	else if (products)
		products[/obj/item/mod/module/jetpack] = 3 // "normal" price
	return ..()
