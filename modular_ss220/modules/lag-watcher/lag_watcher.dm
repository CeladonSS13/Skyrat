SUBSYSTEM_DEF(lag_watcher)
	name = "Lag Watcher"
	flags = SS_NO_INIT
	wait = 1 SECONDS // Default wait time before fire() invoked

	var/default_threshold_ms = 600
	var/required_fire_amount = 30
	var/list/fire_amount = list()
	var/list/custom_thresholds = list( // Name and ms threshold
		"Atmospherics" = 700,
		"Garbage" = 2000,
	)
	var/triggered = FALSE
	var/min_clients_to_trigger = 2 // reduce to test alone

/datum/controller/subsystem/lag_watcher/fire()
	if (!Master || !Master.subsystems || triggered || !GLOB.clients || GLOB.clients.len < min_clients_to_trigger)
		return

	for(var/datum/controller/subsystem/subsystem as anything in Master.subsystems)
		if (!subsystem || !subsystem.cost || !subsystem.name)
			continue
		var/threshold_cost = default_threshold_ms

		if (custom_thresholds[subsystem.name])
			threshold_cost = custom_thresholds[subsystem.name]

		if (subsystem.cost > threshold_cost)
			fire_amount[subsystem.name]++
			var/relative_amount = fire_amount[subsystem.name]
			if (!SSvote.current_vote && relative_amount >= required_fire_amount)
				triggered = TRUE
				var/msg = "\[LAG WATCHER\]: [subsystem.name] went above threshold of [threshold_cost]ms for more than [required_fire_amount] fire times. The lags most likely won't decrease, round end is advised."
				var/msg_span = span_danger(msg)
				log_game(msg)
				for(var/client/client in GLOB.clients)
					to_chat(client, msg_span)
				SSvote.initiate_vote(/datum/vote/transfer_vote, "automatic transfer", forced = TRUE)
				can_fire = FALSE
				return
		else
			fire_amount[subsystem.name] = 0
