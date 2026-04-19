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

	// markets

	var/list/markets_per_name = list()
	var/list/dry_checkpoints_quantity_per_market = list()

/datum/controller/subsystem/plasma_inflation/Initialize()
	if (!CONFIG_GET(flag/plasma_inflation))
		return SS_INIT_NO_NEED

	return SS_INIT_SUCCESS

/datum/controller/subsystem/plasma_inflation/fire()
	if (length(markets_per_name) < 1)
		return
	for(var/market_name in markets_per_name)
		var/datum/plasma_inflation_market/market = markets_per_name[market_name]
		if (!market)
			markets_per_name -= market
			continue
		market.update_market()

/datum/controller/subsystem/plasma_inflation/proc/sell_plasma(quantity, market_name)
	var/datum/plasma_inflation_market/market = get_market(market_name)
	if (!market)
		log_runtime("Market is null after get_market(), market_name = [market_name]")
		return 0
	return market.sell(quantity)

/datum/controller/subsystem/plasma_inflation/proc/get_market(market_name)
	if (!market_name || length(market_name) < 1)
		market_name = EXPORT_MARKET_BLACKMARKET
	var/datum/plasma_inflation_market/market = markets_per_name[market_name]
	if (!market)
		market = new /datum/plasma_inflation_market()
		markets_per_name[market_name] = market
	return market

/datum/controller/subsystem/plasma_inflation/proc/update_dry(dry_run, is_start)
	if (!dry_run)
		return
	for(var/market_name in markets_per_name)
		var/datum/plasma_inflation_market/market = markets_per_name[market_name]
		if (!market)
			continue
		if (is_start)
			dry_checkpoints_quantity_per_market[market] = market.quantity_sold_batch
		else
			market.quantity_sold_batch = dry_checkpoints_quantity_per_market[market]
