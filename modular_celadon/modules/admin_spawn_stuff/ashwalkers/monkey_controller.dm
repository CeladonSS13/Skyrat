/datum/ai_controller/monkey/hostile_melee1984
	ai_movement = /datum/ai_movement/jps
	movement_delay = 0.4 SECONDS
	planning_subtrees = list(
		/datum/ai_planning_subtree/generic_resist,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/monkey_try_find_weapon,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
	)
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
		BB_MONKEY_AGGRESSIVE = TRUE,
		BB_MONKEY_BEST_FORCE_FOUND = 15,
		BB_MONKEY_ENEMIES = list(),
		BB_MONKEY_BLACKLISTITEMS = list(),
		BB_MONKEY_PICKPOCKETING = FALSE,
		BB_MONKEY_DISPOSING = FALSE,
		BB_MONKEY_GUN_NEURONS_ACTIVATED = FALSE,
		BB_RESISTING = TRUE,
		BB_TARGET_MINIMUM_STAT = HARD_CRIT,
	)
	idle_behavior = null // no real need, let's save perfomance

/datum/ai_controller/monkey/hostile_ranged1984
	ai_movement = /datum/ai_movement/jps
	movement_delay = 0.4 SECONDS
	planning_subtrees = list(
		/datum/ai_planning_subtree/generic_resist,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/ranged_skirmish/hugerange,
		/datum/ai_planning_subtree/monkey_try_find_weapon,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
	)
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
		BB_MONKEY_AGGRESSIVE = TRUE,
		BB_MONKEY_BEST_FORCE_FOUND = 15,
		BB_MONKEY_ENEMIES = list(),
		BB_MONKEY_BLACKLISTITEMS = list(),
		BB_MONKEY_PICKPOCKETING = FALSE,
		BB_MONKEY_DISPOSING = FALSE,
		BB_MONKEY_GUN_NEURONS_ACTIVATED = FALSE,
		BB_RESISTING = TRUE,
		BB_TARGET_MINIMUM_STAT = HARD_CRIT,
	)
	idle_behavior = null // no real need, let's save perfomance
