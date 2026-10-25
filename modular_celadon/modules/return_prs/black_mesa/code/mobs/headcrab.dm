/mob/living/basic/blackmesa/xen/headcrab
	name = "headcrab"
	desc = "Don't let it latch onto your hea-... hey, that's kinda cool."
	icon = 'modular_celadon/modules/return_prs/black_mesa/icons/mobs.dmi'
	icon_state = "headcrab"
	icon_living = "headcrab"
	icon_dead = "headcrab_dead"
	icon_gib = null
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	speak_emote = list("growls", "snarls", "grumbles", "jumps")
	maxHealth = 50
	health = 50
	speed = 1
	melee_damage_lower = 5
	melee_damage_upper = 5
	attack_sound = 'sound/items/weapons/bite.ogg'
	gold_core_spawnable = HOSTILE_SPAWN
	loot = list(/obj/item/stack/sheet/bone)
	alert_sounds = list(
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/headcrab/alert1.ogg'
	)
	ai_controller = /datum/ai_controller/basic_controller/blackmesa/headcrab
	var/is_zombie = FALSE
	var/mob/living/carbon/human/oldguy
	var/throw_at_range = 10
	var/throw_at_speed = 2

/mob/living/basic/blackmesa/xen/headcrab/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/ranged_attacks, projectile_type = null, projectile_sound = null, cooldown_time = 4 SECONDS)

/mob/living/basic/blackmesa/xen/headcrab/proc/is_zombie()
	if(is_zombie)
		return TRUE
	else
		return FALSE

/mob/living/basic/blackmesa/xen/headcrab/proc/crab_throw(atom/targeted_atom)
	throw_at(targeted_atom, throw_at_range, throw_at_speed)
	playsound(src, pick(list('modular_celadon/modules/return_prs/black_mesa/sound/mobs/headcrab/attack1.ogg',
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/headcrab/attack2.ogg',
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/headcrab/attack3.ogg'
		)), 100)

/mob/living/basic/blackmesa/xen/headcrab/death(gibbed)
	. = ..()
	playsound(src, pick(list(
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/headcrab/die1.ogg',
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/headcrab/die2.ogg'
	)), 100)

/mob/living/basic/blackmesa/xen/headcrab/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(!hit_atom || stat == DEAD)
		return
	if(!isliving(hit_atom))
		return
	playsound(src, 'modular_celadon/modules/return_prs/black_mesa/sound/mobs/headcrab/headbite.ogg', 100)
	var/mob/living/hit_mob = hit_atom
	hit_mob.apply_damage(melee_damage_upper, BRUTE)
	if(!ishuman(hit_atom))
		return
	var/mob/living/carbon/human/human_to_dunk = hit_atom
	if(!human_to_dunk.get_item_by_slot(ITEM_SLOT_HEAD) && prob(50) && zombify(human_to_dunk))
		to_chat(human_to_dunk, span_userdanger("[src] latches onto your head as it pierces your skull, instantly killing you!"))
		human_to_dunk.investigate_log("was headcrab latched by [src].", INVESTIGATE_DEATHS)
		human_to_dunk.death(FALSE)

/mob/living/basic/blackmesa/xen/headcrab/proc/zombify(mob/living/carbon/human/zombified_human)
	if(is_zombie)
		return FALSE
	is_zombie = TRUE
	if(zombified_human.wear_suit)
		var/obj/item/clothing/suit/armor/zombie_suit = zombified_human.wear_suit
		maxHealth += zombie_suit.get_armor_rating(MELEE) //That zombie's got armor, I want armor!
	maxHealth += 40
	health = maxHealth
	name = "zombie"
	desc = "A shambling corpse animated by a headcrab!"
	mob_biotypes |= MOB_HUMANOID
	melee_damage_lower += 8
	melee_damage_upper += 11
	obj_damage = 21 //now that it has a corpse to puppet, it can properly attack structures
	AddElement(/datum/element/wall_smasher, strength_flag = ENVIRONMENT_SMASH_STRUCTURES)
	movement_type = GROUND
	icon_state = ""
	zombified_human.set_hairstyle(null, update = FALSE)
	zombified_human.update_body_parts()
	zombified_human.forceMove(src)
	oldguy = zombified_human
	update_appearance()
	visible_message(span_warning("The corpse of [zombified_human.name] suddenly rises!"))
	return TRUE

/mob/living/basic/blackmesa/xen/headcrab/Destroy()
	if(oldguy)
		oldguy.forceMove(get_turf(src))
		oldguy = null
	return ..()

/mob/living/basic/blackmesa/xen/headcrab/death(gibbed)
	. = ..()
	if(oldguy)
		oldguy.forceMove(loc)
		oldguy = null
	if(is_zombie)
		if(prob(30))
			new /mob/living/basic/blackmesa/xen/headcrab(loc) //OOOO it unlached!
			qdel(src)
			return
		cut_overlays()
		update_appearance()

/mob/living/basic/blackmesa/xen/headcrab/update_overlays()
	. = ..()
	if(is_zombie)
		copy_overlays(oldguy, TRUE)
		var/mutable_appearance/blob_head_overlay = mutable_appearance('modular_celadon/modules/return_prs/black_mesa/icons/mobs.dmi', "headcrab_zombie")
		add_overlay(blob_head_overlay)

/mob/living/basic/blackmesa/xen/headcrab/fast
	speed = -2

/datum/ai_planning_subtree/headcrab/move_to_cardinal
	var/move_behaviour = /datum/ai_behavior/move_to_cardinal/headcrab
	var/target_key = BB_BASIC_MOB_CURRENT_TARGET

/datum/ai_planning_subtree/headcrab/move_to_cardinal/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	. = ..()
	if(!controller.blackboard_key_exists(target_key))
		return

/datum/ai_behavior/move_to_cardinal/headcrab
	behavior_flags = AI_BEHAVIOR_REQUIRE_MOVEMENT | AI_BEHAVIOR_MOVE_AND_PERFORM | AI_BEHAVIOR_CAN_PLAN_DURING_EXECUTION
	minimum_distance = 5
	maximum_distance = 5

/datum/ai_behavior/move_to_cardinal/headcrab/proc/is_zombie(datum/ai_controller/controller)
	var/mob/living/basic/blackmesa/xen/headcrab/mob = controller.pawn
	if(mob.is_zombie())
		minimum_distance = 0
		maximum_distance = 1
	else
		minimum_distance = 5
		maximum_distance = 5

/datum/ai_behavior/move_to_cardinal/headcrab/setup(datum/ai_controller/controller, target_key)
	var/atom/target = controller.blackboard[target_key]
	if(QDELETED(target))
		return FALSE
	is_zombie(controller)
	target_nearest_cardinal(controller, target)
	return TRUE

/datum/ai_behavior/move_to_cardinal/headcrab/target_nearest_cardinal(datum/ai_controller/controller, atom/target)
	var/closest = INFINITY
	var/atom/move_target
	is_zombie(controller)
	for (var/dir in GLOB.cardinals)
		var/turf/cardinal_turf = get_ranged_target_turf(target, dir, minimum_distance)
		if (cardinal_turf.is_blocked_turf())
			continue
		var/distance_to = get_dist(controller.pawn, cardinal_turf)
		if (distance_to >= closest)
			continue
		closest = distance_to
		move_target = cardinal_turf

	if (isnull(move_target))
		move_target = target
	if (controller.current_movement_target == move_target)
		return
	set_movement_target(controller, move_target)

/datum/ai_behavior/move_to_cardinal/headcrab/perform(seconds_per_tick, datum/ai_controller/controller, target_key)
	is_zombie(controller)
	var/atom/target = controller.blackboard[target_key]
	if (QDELETED(target))
		return AI_BEHAVIOR_INSTANT | AI_BEHAVIOR_FAILED
	if (!(get_dir(controller.pawn, target) in GLOB.cardinals))
		target_nearest_cardinal(controller, target)
		return AI_BEHAVIOR_INSTANT
	var/distance_to_target = get_dist(controller.pawn, target)
	if (distance_to_target < minimum_distance)
		target_nearest_cardinal(controller, target)
		return AI_BEHAVIOR_INSTANT
	if (distance_to_target > maximum_distance)
		return AI_BEHAVIOR_INSTANT
	return AI_BEHAVIOR_INSTANT | AI_BEHAVIOR_SUCCEEDED

/datum/ai_controller/basic_controller/blackmesa/headcrab
	planning_subtrees = list(
		/datum/ai_planning_subtree/escape_captivity,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/blackmesa_combo_skirmish/headcrab,
		/datum/ai_planning_subtree/headcrab/move_to_cardinal,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
	)

/datum/ai_behavior/basic_melee_attack/headcrab
	action_cooldown = 2 SECONDS
	terminate_after_action = TRUE
	behavior_flags = AI_BEHAVIOR_CAN_PLAN_DURING_EXECUTION

/datum/ai_planning_subtree/blackmesa_combo_skirmish/headcrab
	ranged_attack_behavior = /datum/ai_behavior/blackmesa_combo_skirmish/headcrab
	melee_attack_behavior = /datum/ai_behavior/basic_melee_attack/headcrab

/datum/ai_behavior/blackmesa_combo_skirmish/headcrab
	action_cooldown = 4 SECONDS

/datum/ai_behavior/blackmesa_combo_skirmish/headcrab/perform(seconds_per_tick, datum/ai_controller/controller, target_key, targeting_strategy_key, hiding_location_key, max_range, min_range)
	var/atom/target = controller.blackboard[target_key]
	var/mob/living/basic/blackmesa/xen/headcrab/crab = controller.pawn
	if(QDELETED(target))
		return AI_BEHAVIOR_DELAY | AI_BEHAVIOR_FAILED

	var/datum/targeting_strategy/targeting_strategy = GET_TARGETING_STRATEGY(controller.blackboard[targeting_strategy_key])
	if(!targeting_strategy.can_attack(crab, target))
		return AI_BEHAVIOR_DELAY | AI_BEHAVIOR_FAILED

	var/hiding_target = targeting_strategy.find_hidden_mobs(crab, target)
	controller.set_blackboard_key(hiding_location_key, hiding_target)

	target = hiding_target || target

	var/distance = get_dist(crab, target)
	if(distance > max_range || distance < min_range)
		if(distance < min_range)
			controller.ai_interact(target, combat_mode = TRUE)
			return AI_BEHAVIOR_DELAY | AI_BEHAVIOR_SUCCEEDED
		return AI_BEHAVIOR_DELAY | AI_BEHAVIOR_FAILED
	if(!(crab.is_zombie))
		crab.crab_throw(target)
	controller.ai_interact(target = target, combat_mode = TRUE)
	return AI_BEHAVIOR_DELAY | AI_BEHAVIOR_SUCCEEDED
