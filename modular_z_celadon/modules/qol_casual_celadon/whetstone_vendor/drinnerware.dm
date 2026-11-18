/obj/machinery/vending/dinnerware/Initialize(mapload)
	if (premium)
		premium[/obj/item/sharpener] = 2 // premium price
	else if (products)
		products[/obj/item/sharpener] = 2 // "normal" price
	return ..()
