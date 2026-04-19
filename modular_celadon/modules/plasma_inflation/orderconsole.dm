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
	var/static/list/cargo_account_to_market_cache = list(
		ACCOUNT_TI = EXPORT_MARKET_TARKON,
		ACCOUNT_DS2 = EXPORT_MARKET_DS_INTERDYNE,
		ACCOUNT_INT = EXPORT_MARKET_DS_INTERDYNE, // they use same market
		ACCOUNT_CAR = EXPORT_MARKET_STATION,
		ACCOUNT_CMD = EXPORT_MARKET_STATION,
	)
	if (SSplasma_inflation)
		var/target_market_found
		if (cargo_account in cargo_account_to_market_cache)
			target_market_found = cargo_account_to_market_cache[cargo_account]
		if (!target_market_found)
			target_market_found = EXPORT_MARKET_BLACKMARKET
		var/datum/plasma_inflation_market/market = SSplasma_inflation.get_market(target_market_found)
		current_plasma_cost = market.current_price
		if (!isnum(current_plasma_cost))
			current_plasma_cost = PLASMA_DEFAULT_COST_CARGO
	else
		current_plasma_cost = PLASMA_DEFAULT_COST_CARGO
	data["current_plasma_cost"] = current_plasma_cost
	return data
