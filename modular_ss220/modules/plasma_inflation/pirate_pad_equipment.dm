/obj/machinery/computer/piratepad_control/ui_data(mob/user)
	. = ..()
	var/list/data = .
	if (!data)
		return .
	var/datum/plasma_inflation_market/market = SSplasma_inflation.get_market(export_market)
	var/current_plasma_cost = market.current_price
	if (!isnum(current_plasma_cost))
		current_plasma_cost = PLASMA_DEFAULT_COST_CARGO
	data["current_plasma_cost"] = current_plasma_cost
	return data
