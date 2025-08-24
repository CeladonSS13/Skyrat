/datum/plasma_inflation_market
	// per market
	var/current_time // minutes
	var/current_price = PLASMA_DEFAULT_COST_CARGO
	var/is_recovering = FALSE // is it currently recovering?
	var/recovery_start_price = PLASMA_DEFAULT_COST_CARGO
	var/quantity_sold_batch = 0

/datum/plasma_inflation_market/proc/update_market()
	// Part 1. Update price after batch sale

	if (quantity_sold_batch > 0)
		current_price = quantity_sold_batch * (NUM_E ** (-SSplasma_inflation.decay_factor * quantity_sold_batch))

		if (current_price < 0) // not going negative price
			current_price = 0

		// Reset stuff

		quantity_sold_batch = 0
		current_time = 0 // reset
		recovery_start_price = current_price // should be placed after current_price update
		is_recovering = TRUE
		return // not recovering at this fire

	// Part 2. recover stuff
	if (!is_recovering)
		return

	current_time += SSplasma_inflation.wait

	if (SSplasma_inflation.default_plasma_price <= 0) // zero div
		SSplasma_inflation.default_plasma_price = 0.000000001

	if (SSplasma_inflation.recovery_time <= 0) // no negative stuff
		SSplasma_inflation.recovery_time = SSplasma_inflation.wait

	if (current_time >= SSplasma_inflation.recovery_time)
		is_recovering = FALSE
		current_price = SSplasma_inflation.default_plasma_price
		return

	if (recovery_start_price <= 0)// zero div
		recovery_start_price = 000000001

	current_price = recovery_start_price * ((SSplasma_inflation.default_plasma_price / recovery_start_price) ** (current_time / SSplasma_inflation.recovery_time))

/datum/plasma_inflation_market/proc/sell(quantity)
	if (!isnum(quantity) || quantity < 1)
		return 0

	if (SSplasma_inflation.recovery_time <= 0) // no negative stuff
		SSplasma_inflation.recovery_time = SSplasma_inflation.wait

	if (SSplasma_inflation.decay_factor <= 0) // zero div
		SSplasma_inflation.decay_factor = 0.000000001

	if (quantity_sold_batch < 0) // no negative
		quantity_sold_batch = 0

	var/revenue = (current_price / SSplasma_inflation.decay_factor) * (NUM_E ** (-SSplasma_inflation.decay_factor * quantity_sold_batch) - NUM_E ** (-SSplasma_inflation.decay_factor * (quantity_sold_batch + quantity)))
	quantity_sold_batch += quantity

	if (revenue < 0) // no negative revenue
		revenue = 0

	return revenue
