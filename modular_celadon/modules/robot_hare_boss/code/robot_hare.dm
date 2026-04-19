#define COMSIG_ROBOT_FOLD_UNFOLD_STARTED "mob_robot_fold_unfold_started"

#define ROBOHARE_PHASE2 (health <= maxHealth * 0.5)

/*
 * ROBOT HARE
 *
 * The Robot Hare is a mechanical boss found in Lavaland. It's an aggressive robotic entity that:
 * - Hit with hand in melee attacks
 * - Shoots lightning bolts at range when the target is far away
 * - Enters Phase 2 at 50% health, becoming faster and more aggressive
 * - When defeated, becomes a broken robot that can be salvaged for useful loot
 *
 * TODO: make ability to unweld walls with inbuild welder (with fancy animated icon)
 *       make some minigames
 *
 * Difficulty: Medium-Hard
 */

/mob/living/simple_animal/hostile/megafauna/robothare
	name = "robot hare"
	desc = "A menacing robotic construct with glowing red eyes. Its right arm ends in a massive welding rod."
	health = 2000
	maxHealth = 2000
	attack_verb_continuous = "strikes"
	attack_verb_simple = "strike"
	attack_sound = 'sound/items/weapons/genhit.ogg'
	icon_state = "robothare_folded"
	icon_living = "robothare"
	icon_dead = "robothare_broken"
	health_doll_icon = "robothare"
	friendly_verb_continuous = "stares down"
	friendly_verb_simple = "stare down"
	icon = 'modular_celadon/modules/robot_hare_boss/icons/96x96robot_hare.dmi'
	faction = list(FACTION_BOSS)
	speak_emote = list("beeps")
	armour_penetration = 45
	melee_damage_lower = 25
	melee_damage_upper = 35
	mob_biotypes = MOB_ROBOTIC|MOB_SPECIAL
	speed = 6
	move_to_delay = 6
	ranged = TRUE
	ranged_cooldown_time = 3 SECONDS
	aggro_vision_range = 21
	loot = list(/obj/structure/closet/crate/necropolis/robothare)
	crusher_loot = /obj/structure/closet/crate/necropolis/robothare/crusher
	replace_crusher_drop = TRUE
	wander = FALSE
	gps_name = "Metal-Carrot Signal"
	achievement_type = /datum/award/achievement/boss/robothare_kill
	crusher_achievement_type = /datum/award/achievement/boss/robothare_crusher
	score_achievement_type = /datum/award/score/robothare_score
	SET_BASE_PIXEL(-32, -16)
	del_on_death = FALSE
	death_sound = 'sound/effects/explosion/explosion1.ogg'
	initial_language_holder = /datum/language_holder/machine
	footstep_type = FOOTSTEP_MOB_HEAVY
	summon_line = "*Mechanical whirring intensifies*"

	/// Whether the hare is in its folded (inactive) state
	var/folded = TRUE
	/// Whether the hare is in dead state
	var/neutralized = FALSE
	/// Current phase (1 or 2)
	var/phase = 1
	/// Lightning bolt attack ability
	var/datum/action/cooldown/mob_cooldown/projectile_attack/lightning_bolt/lightning_attack
	/// Fold and Unfold ability
	var/datum/action/cooldown/fold_unfold/fold_and_unfold
	/// Whether we've already shown phase 2 transition message
	var/phase2_announced = FALSE

/mob/living/simple_animal/hostile/megafauna/robothare/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NO_FLOATING_ANIM, INNATE_TRAIT)
	lightning_attack = new(src)
	fold_and_unfold = new(src)
	lightning_attack.Grant(src)
	fold_and_unfold.Grant(src)
	RegisterSignal(src, COMSIG_ROBOT_FOLD_UNFOLD_STARTED, PROC_REF(fold_and_unfold))
	RegisterSignal(src, COMSIG_MOB_ABILITY_STARTED, PROC_REF(on_attack_start))
	RegisterSignal(src, COMSIG_MOB_ABILITY_FINISHED, PROC_REF(on_attack_end))


/mob/living/simple_animal/hostile/megafauna/robothare/examine(mob/user)
	. = ..()
	if(folded)
		. += "<b>[src] use multitool to activate machine</b>"
	if(neutralized)
		. += "<b>[src] use wrench to salvage components</b>"

/mob/living/simple_animal/hostile/megafauna/robothare/Destroy()
	lightning_attack = null
	fold_and_unfold = null
	return ..()

/mob/living/simple_animal/hostile/megafauna/robothare/AttackingTarget(atom/attacked_target)
	if(!folded)
		return ..()

/mob/living/simple_animal/hostile/megafauna/robothare/Move()
	if(!folded)
		..()

/mob/living/simple_animal/hostile/megafauna/robothare/DestroySurroundings()
	if(!folded)
		..()

/mob/living/simple_animal/hostile/megafauna/robothare/Goto(target, delay, minimum_distance)
	if(!folded)
		..()

/mob/living/simple_animal/hostile/megafauna/robothare/multitool_act(mob/living/user, obj/item/multitool/tool)
	if(user.combat_mode)
		return
	if(!folded)
		return
	balloon_alert(user, "activate machine...")
	tool.play_tool_sound(src)
	if(tool.use_tool(src, user, 6 SECONDS))
		playsound(loc, 'sound/effects/sparks/sparks1.ogg', 50, vary = TRUE)
	fold_and_unfold()

/mob/living/simple_animal/hostile/megafauna/robothare/proc/fold_and_unfold(mob/living/owner, datum/action/cooldown/activated)
	SIGNAL_HANDLER
	//cant fold back in rage state
	if(phase2_announced)
		return
	if(folded)
		icon_state = "robothare"
		flick("[icon_living]_unpacking", src)
		folded = FALSE
		visible_message(span_warning("[src] unfolds and powers up with an ominous hum!"))
		playsound(src, 'sound/effects/servostep.ogg', 100, TRUE)
	else
		icon_state = "robothare_folded"
		flick("[icon_living]_packing", src)
		folded = TRUE
		visible_message(span_warning("[src] folds back!"))
		playsound(src, 'sound/effects/servostep.ogg', 100, TRUE)

/**
 * Override OpenFire to handle lightning bolt attacks
 * The robot hare uses lightning when target is at range, welding rod in melee
 */
/mob/living/simple_animal/hostile/megafauna/robothare/OpenFire()
	if(client)
		return

	if(folded)
		return

	// Check for phase 2 transition
	if(ROBOHARE_PHASE2 && phase == 1 && !phase2_announced)
		phase = 2
		phase2_announced = TRUE
		phase2_transition()

	// Phase 2: faster attacks and more aggressive behavior
	if(phase == 2)
		anger_modifier = clamp(((maxHealth - health)/40), 0, 30)
	else
		anger_modifier = clamp(((maxHealth - health)/60), 0, 20)

	// Calculate distance to target
	var/dist = get_dist(src, target)

	// If target is far away, use lightning attack
	if(dist >= 5 && prob(60 + anger_modifier))
		lightning_attack.Trigger(target = target)
		return

	// If target is at medium range, sometimes use lightning
	if(dist >= 3 && prob(30 + anger_modifier))
		lightning_attack.Trigger(target = target)
		return

	// Otherwise, chase and melee
	// Ranged cooldown is handled by parent

/**
 * Handle attack start events for visual effects
 */
/mob/living/simple_animal/hostile/megafauna/robothare/proc/on_attack_start(mob/living/owner, datum/action/cooldown/activated)
	SIGNAL_HANDLER
	if(activated == lightning_attack)
		icon_state = "robothare_ranged"

/**
 * Handle attack end events to reset visuals
 */
/mob/living/simple_animal/hostile/megafauna/robothare/proc/on_attack_end(mob/living/owner, datum/action/cooldown/finished)
	SIGNAL_HANDLER
	if(finished == lightning_attack)
		icon_state = "robothare"

/**
 * Phase 2 transition - increase speed and aggression
 */
/mob/living/simple_animal/hostile/megafauna/robothare/proc/phase2_transition()
	visible_message(span_danger("[src]'s eyes glow brighter! It enters an enraged state!"))
	add_overlay("eyes_alert")
	playsound(src, 'sound/effects/empulse.ogg', 150, TRUE)

	// Increase speed
	speed = 10
	move_to_delay = 4


	// Flash the screen of nearby players
	for(var/mob/viewer in viewers(7, src))
		if(viewer.client)
			flash_color(viewer.client, "#00FFFF", 0.5)
			shake_camera(viewer, 3, 2)

/mob/living/simple_animal/hostile/megafauna/robothare/death(gibbed)
	if(health > 0)
		return

	// Change to broken state
	icon_state = "robothare_broken"
	remove_overlay("eyes_alert")
	visible_message(span_danger("[src] collapses, sparking and broken!"))

	neutralized = TRUE
	// Still allow loot to drop
	. = ..()

/mob/living/simple_animal/hostile/megafauna/robothare/adjust_brute_loss(amount, updating_health = TRUE, forced = FALSE, required_bodytype)
	. = ..()
	// Add sparks when damaged
	if(. > 0 && prob(30))
		playsound(src, 'sound/effects/sparks/sparks2.ogg', 40, TRUE)
		if(prob(20))
			new /obj/effect/decal/cleanable/blood/splatter/oil(loc)

/**
 * Allow the broken robot to be dismantled for parts
 */
/mob/living/simple_animal/hostile/megafauna/robothare/attackby(obj/item/I, mob/living/user)
	//TODO - make it activate itself after some hits
	if(neutralized)
		if(I.tool_behaviour == TOOL_WRENCH)
			user.visible_message(span_notice("[user] starts dismantling [src]..."), span_notice("You start dismantling [src]..."))
			I.play_tool_sound(src)
			if(I.use_tool(src, user, 3 SECONDS, volume = 50))
				dismantle_robothare(user)
				return TRUE

	return ..()

/**
 * Dismantle the broken robot hare for loot
 */
/mob/living/simple_animal/hostile/megafauna/robothare/proc/dismantle_robothare(mob/user)
	visible_message(span_info("[user] dismantles the broken robot hare!"))
	playsound(src, 'sound/misc/metal_creak.ogg', 80, TRUE)

	// Roll for loot
	var/loot_roll = rand(1, 100)

	if(loot_roll <= 40)
		// Common loot
		var/obj/item/common_loot = pick(
			/obj/item/assembly/prox_sensor,
			/obj/item/stock_parts/matter_bin/super,
			/obj/item/stack/cable_coil,
			/obj/item/stock_parts/power_store/cell/high,
			/obj/item/food/grown/carrot,
		)
		new common_loot(loc)
		to_chat(user, span_notice("You salvaged some useful components!"))

	else if(loot_roll <= 70)
		// Uncommon loot
		var/uncommon_loot = pick(
			/obj/item/stock_parts/capacitor/quadratic,
			/obj/item/stock_parts/micro_laser/quadultra,
			/obj/item/stock_parts/scanning_module/triphasic,
			/obj/item/stock_parts/servo/femto,
			/obj/item/stock_parts/matter_bin/bluespace,
		)
		new uncommon_loot(loc)
		to_chat(user, span_notice("You found some valuable machine parts!"))

	else if(loot_roll <= 95)
		// Rare loot
		var/rare_loot = pick(
			/obj/item/bodypart/arm/left/robot/advanced,
			/obj/item/bodypart/arm/right/robot/advanced,
			/obj/item/bodypart/leg/left/robot/advanced,
			/obj/item/bodypart/leg/right/robot/advanced,
		)
		new rare_loot(loc)
		to_chat(user, span_warning("You uncovered a rare robotics component!"))

	else
		// Very rare loot 5% chance
		new /obj/item/mjollnir(loc)
		to_chat(user, span_boldwarning("You salvaged strange hammer!"))

	// Remove the mob with chance 33%
	if(prob(33))
		qdel(src)
		new /obj/item/stack/sheet/iron (loc, 15)
		new /obj/item/stack/sheet/plasteel (loc, 10)

#undef ROBOHARE_PHASE2



/**
 * Crusher Trophy: Robot Hare Ear
 * A trophy dropped when defeating the Robot Hare without taking significant damage
 */
/obj/item/crusher_trophy/robot_hare_hand
	name = "robot hare hand"
	desc = "A metallic hand from the defeated Robot Hare. Proof of your prowess against this mechanical menace."
	icon = 'modular_celadon/modules/robot_hare_boss/icons/robot_hare_trophy.dmi'
	icon_state = "trophy_robot_hand"
	denied_type = /obj/item/crusher_trophy/robot_hare_hand

/obj/item/crusher_trophy/robot_hare_hand/effect_desc()
	return "mark detonation to briefly shock nearby enemies"

/obj/item/crusher_trophy/robot_hare_hand/on_mark_detonation(mob/living/target, mob/living/user)
	. = ..()
	// Create an electrical shock effect around the user
	for(var/mob/living/enemy in range(3, user))
		if(enemy != user && !enemy.faction_check_atom(user))
			playsound(get_turf(enemy), 'sound/effects/magic/lightningbolt.ogg', 80, TRUE)
			enemy.apply_damage(10, BURN)
			enemy.Stun(5, FALSE)
	to_chat(user, span_notice("The robot hare finger crackles with energy!"))
