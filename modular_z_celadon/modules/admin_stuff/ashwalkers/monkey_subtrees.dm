/datum/ai_planning_subtree/monkey_try_find_weapon/SelectBehaviors(datum/ai_controller/monkey/controller, seconds_per_tick)
	if (controller.TryFindWeapon())
		return SUBTREE_RETURN_FINISH_PLANNING // so it doesn't immediately attack before going to weapon
