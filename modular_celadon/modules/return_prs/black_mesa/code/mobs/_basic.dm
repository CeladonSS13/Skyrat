/mob/living/basic/blackmesa
	var/list/alert_sounds
	var/alert_cooldown = 4 SECONDS
	var/alert_cooldown_time
	var/projectiletype = null
	var/projectilesound = null
	var/list/loot = list()
	var/loot_spawned = FALSE
	ai_controller = /datum/ai_controller/basic_controller/blackmesa

/mob/living/basic/blackmesa/proc/drop_loot(drop_loc)
	if (!length(loot))
		return
	for(var/i in loot)
		new i(drop_loc)
	loot.Cut()
	loot_spawned = TRUE

/mob/living/basic/blackmesa/death(gibbed)
	var/drop_loc = drop_location()
	drop_loot(drop_loc)
	return ..()

/mob/living/basic/blackmesa/proc/aggro()
	if((alert_sounds) && !isdead(src))
		if(!(world.time <= alert_cooldown_time))
			playsound(src, pick(alert_sounds), 70)
			alert_cooldown_time = world.time + alert_cooldown
			return TRUE
	return FALSE

/mob/living/basic/blackmesa/xen
	faction = list(FACTION_XEN)
	habitable_atmos = null
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0
	unsuitable_cold_damage = 0
	maximum_survivable_temperature = 1500
	unsuitable_heat_damage = 1

/datum/ai_controller/basic_controller/blackmesa
	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)
	planning_subtrees = list(
		/datum/ai_planning_subtree/escape_captivity,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
	)

/datum/ai_controller/basic_controller/blackmesa/update_grid(datum/source, datum/spatial_grid_cell/new_cell)
	. = ..()
	var/mob/living/basic/blackmesa/mob = pawn
	if(current_movement_target)
		if(isblackmesamob(mob))
			mob.aggro()

/datum/ai_planning_subtree/blackmesa_combo_skirmish
	operational_datums = list(/datum/component/ranged_attacks)
	var/target_key = BB_BASIC_MOB_CURRENT_TARGET
	var/ranged_attack_behavior = /datum/ai_behavior/blackmesa_combo_skirmish
	var/melee_attack_behavior = /datum/ai_behavior/basic_melee_attack
	var/max_range = 10
	var/min_range = 2
	var/end_planning = FALSE
	var/ranged = TRUE

/datum/ai_planning_subtree/blackmesa_combo_skirmish/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	. = ..()
	if(!controller.blackboard_key_exists(target_key))
		return
	if(ranged)
		controller.queue_behavior(ranged_attack_behavior, target_key, BB_TARGETING_STRATEGY, BB_BASIC_MOB_CURRENT_TARGET_HIDING_LOCATION, max_range, min_range)
	else
		controller.queue_behavior(melee_attack_behavior, target_key, BB_TARGETING_STRATEGY, BB_BASIC_MOB_CURRENT_TARGET_HIDING_LOCATION, max_range, min_range)
	if(end_planning)
		return SUBTREE_RETURN_FINISH_PLANNING

/datum/ai_behavior/blackmesa_combo_skirmish
	action_cooldown = 4 SECONDS

/datum/ai_behavior/blackmesa_combo_skirmish/setup(datum/ai_controller/controller, target_key, targeting_strategy_key, hiding_location_key, max_range, min_range)
	. = ..()
	var/atom/target = controller.blackboard[hiding_location_key] || controller.blackboard[target_key]
	return !QDELETED(target)

/datum/ai_behavior/blackmesa_combo_skirmish/perform(seconds_per_tick, datum/ai_controller/controller, target_key, targeting_strategy_key, hiding_location_key, max_range, min_range)
	var/atom/target = controller.blackboard[target_key]
	if(QDELETED(target))
		return AI_BEHAVIOR_DELAY | AI_BEHAVIOR_FAILED

	var/datum/targeting_strategy/targeting_strategy = GET_TARGETING_STRATEGY(controller.blackboard[targeting_strategy_key])
	if(!targeting_strategy.can_attack(controller.pawn, target))
		return AI_BEHAVIOR_DELAY | AI_BEHAVIOR_FAILED

	var/hiding_target = targeting_strategy.find_hidden_mobs(controller.pawn, target)
	controller.set_blackboard_key(hiding_location_key, hiding_target)

	target = hiding_target || target

	var/distance = get_dist(controller.pawn, target)
	if(distance > max_range || distance < min_range)
		if(distance < min_range)
			controller.ai_interact(target, combat_mode = TRUE)
			return AI_BEHAVIOR_DELAY | AI_BEHAVIOR_SUCCEEDED
		return AI_BEHAVIOR_DELAY | AI_BEHAVIOR_FAILED
	controller.ai_interact(target = target, combat_mode = TRUE)
	return AI_BEHAVIOR_DELAY | AI_BEHAVIOR_SUCCEEDED
