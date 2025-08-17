/datum/export/proc/get_cost_ready_to_sell(obj/exported_item, apply_elastic = TRUE)
	return -1 // not compatible by default, uses get_cost instead

/datum/export/material/plasma/get_cost_ready_to_sell(obj/exported_item, apply_elastic = TRUE)
	if (!CONFIG_GET(flag/plasma_inflation) || !SSplasma_inflation)
		return get_cost(exported_item, apply_elastic)
	if (sales_market != EXPORT_MARKET_STATION)
		return get_cost(exported_item, apply_elastic)

	var/exported_area = get_area(exported_item)
	if (SSplasma_inflation.whitelist_shuttle_area && !istype(exported_area, SSplasma_inflation.whitelist_shuttle_area))
		return get_cost(exported_item, apply_elastic) // some away level shuttle most likely

	var/amount = get_amount(exported_item)
	return SSplasma_inflation.sell_plasma(amount)
