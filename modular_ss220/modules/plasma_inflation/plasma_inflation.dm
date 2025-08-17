// THERE IS A EXCEL FILE ATTACHED TO PULL REQUEST TO MODEL THIS SUBSYSTEM
// IF YOU WANT TO CHANGE DECAY_FACTOR, IT'S BETTER TO ChECK HOW IT WILL REFLECT PRICE IN GRAPH!
SUBSYSTEM_DEF(plasma_inflation)
	name = "Plasma Inflation"
	wait = 0.1 MINUTES // Default wait time before fire() invoked
	runlevels = RUNLEVEL_SETUP | RUNLEVEL_GAME | RUNLEVEL_POSTGAME

	// shuttle
	var/area/whitelist_shuttle_area = /area/shuttle/supply

	// decay settings:
	var/decay_factor = 0.01 // how fast price decays, lower = slower, in excel it's: 'k'
	var/default_plasma_price = PLASMA_DEFAULT_COST_CARGO // per unit, in excel it's: 'P0'

	// recovery settings:
	var/recovery_time = 15 MINUTES

	// internal
	var/current_time // minutes
	var/current_price = PLASMA_DEFAULT_COST_CARGO
	var/is_recovering = FALSE // is it currently recovering?
	var/recovery_start_price = PLASMA_DEFAULT_COST_CARGO
	var/quantity_sold_batch = 0

/datum/controller/subsystem/plasma_inflation/Initialize()
	if (!CONFIG_GET(flag/plasma_inflation))
		return SS_INIT_NO_NEED

	return SS_INIT_SUCCESS

/datum/controller/subsystem/plasma_inflation/fire()
	// Part 1. Update price after batch sale

	if (quantity_sold_batch > 0)
		current_price = quantity_sold_batch * (NUM_E ** (-decay_factor * quantity_sold_batch))

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

	current_time += wait

	if (default_plasma_price <= 0) // zero div
		default_plasma_price = 0.000000001

	if (recovery_time <= 0) // no negative stuff
		recovery_time = wait

	if (current_time >= recovery_time)
		is_recovering = FALSE
		current_price = default_plasma_price
		return

	if (recovery_start_price <= 0)// zero div
		recovery_start_price = 000000001

	current_price = recovery_start_price * ((default_plasma_price / recovery_start_price) ** (current_time / recovery_time))

/datum/controller/subsystem/plasma_inflation/proc/sell_plasma(quantity)
	if (!isnum(quantity) || quantity < 1)
		return 0


	if (recovery_time <= 0) // no negative stuff
		recovery_time = wait

	if (decay_factor <= 0) // zero div
		decay_factor = 0.000000001

	if (quantity_sold_batch < 0) // no negative
		quantity_sold_batch = 0

	var/revenue = (current_price / decay_factor) * (NUM_E ** (-decay_factor * quantity_sold_batch) - NUM_E ** (-decay_factor * (quantity_sold_batch + quantity)))
	quantity_sold_batch += quantity

	if (revenue < 0) // no negative revenue
		revenue = 0

	return revenue
