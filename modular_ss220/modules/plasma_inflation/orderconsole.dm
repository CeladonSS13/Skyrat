/obj/machinery/computer/cargo/ui_data()
	. = ..()
	if (!.)
		return list()
	var/list/data = .
	if (!data)
		return .
	var/current_plasma_cost
	if (SSplasma_inflation)
		current_plasma_cost = SSplasma_inflation.current_price
		if (!isnum(current_plasma_cost))
			current_plasma_cost = PLASMA_DEFAULT_COST_CARGO
	else
		current_plasma_cost = PLASMA_DEFAULT_COST_CARGO
	data["current_plasma_cost"] = current_plasma_cost
