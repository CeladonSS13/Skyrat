GLOBAL_LIST_INIT(markets_compatible_to_station, list(EXPORT_MARKET_DS_INTERDYNE, EXPORT_MARKET_TARKON, EXPORT_MARKET_BLACKMARKET))

/datum/export
	var/is_compatible_to_station_market = TRUE

/datum/export/pirate
	is_compatible_to_station_market = FALSE

/datum/export/proc/get_cost_ready_to_sell(obj/exported_item, apply_elastic = TRUE, target_market)
	return -1 // not compatible by default, uses get_cost instead

/datum/export/material/plasma/get_cost_ready_to_sell(obj/exported_item, apply_elastic = TRUE, target_market)
	if (!CONFIG_GET(flag/plasma_inflation) || !SSplasma_inflation)
		return get_cost(exported_item, apply_elastic)

	var/exported_area = get_area(exported_item)
	if (SSplasma_inflation.whitelist_shuttle_area && !istype(exported_area, SSplasma_inflation.whitelist_shuttle_area))
		if (target_market == EXPORT_MARKET_STATION)
			return get_cost(exported_item, apply_elastic) // how it even possible? Well in such weird case, don't modify cost of plasma

	var/amount = get_amount(exported_item)
	return SSplasma_inflation.sell_plasma(amount, target_market)

/datum/export/proc/is_compatible_market(export_market)
	if (sales_market == export_market)
		return TRUE
	if (is_compatible_to_station_market && (export_market in GLOB.markets_compatible_to_station))
		return TRUE
	return FALSE
