/obj/machinery/computer/cargo/ui_data()
	. = ..()
	if (!.)
		return list()
	var/list/data = .
	if (!data)
		return .
	var/current_plasma_cost
	if (SSplasma_inflation)
		var/datum/plasma_inflation_market/market = SSplasma_inflation.get_market(EXPORT_MARKET_STATION)
		current_plasma_cost = market.current_price
		if (!isnum(current_plasma_cost))
			current_plasma_cost = PLASMA_DEFAULT_COST_CARGO
	else
		current_plasma_cost = PLASMA_DEFAULT_COST_CARGO
	data["current_plasma_cost"] = current_plasma_cost
	return data

/obj/machinery/computer/cargo/express/ui_data(mob/user)
	. = ..()
	if (!.)
		return list()
	var/list/data = .
	if (!data)
		return .
	var/current_plasma_cost
	if (SSplasma_inflation)
		var/datum/plasma_inflation_market/market = SSplasma_inflation.get_market(EXPORT_MARKET_STATION)
		current_plasma_cost = market.current_price
		if (!isnum(current_plasma_cost))
			current_plasma_cost = PLASMA_DEFAULT_COST_CARGO
	else
		current_plasma_cost = PLASMA_DEFAULT_COST_CARGO
	data["current_plasma_cost"] = current_plasma_cost
	return data
