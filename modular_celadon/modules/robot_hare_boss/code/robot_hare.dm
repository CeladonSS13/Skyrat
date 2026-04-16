#define ROBOHARE_PHASE2 (health <= maxHealth * 0.5)

/*
 * ROBOT HARE
 *
 * The Robot Hare is a mechanical boss found in Lavaland. It's an aggressive robotic entity that:
 * - Uses a welding rod for melee attacks
 * - Shoots lightning bolts at range when the target is far away
 * - Enters Phase 2 at 50% health, becoming faster and more aggressive
 * - When defeated, becomes a broken husk that can be dismantled for useful loot
 *
 * Intended Difficulty: Medium-Hard
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
	icon = 'modular_celadon/modules/robot_hare_boss/icons/robot_hare.dmi'
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
	loot = list(/obj/structure/closet/crate/robothare)
	crusher_loot = /obj/structure/closet/crate/robothare/crusher
	replace_crusher_drop = TRUE
	wander = FALSE
	gps_name = "Robotic Signal"
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
	var/datum/action/cooldown/mob_cooldown/fold_unfold/fold_and_unfold
	/// Whether we've already shown phase 2 transition message
	var/phase2_announced = FALSE

/mob/living/simple_animal/hostile/megafauna/robothare/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NO_FLOATING_ANIM, INNATE_TRAIT)
	lightning_attack = new(src)
	fold_and_unfold = new(src)
	lightning_attack.Grant(src)
	fold_and_unfold.Grant(src)
	RegisterSignal(src, COMSIG_MOB_ABILITY_STARTED, PROC_REF(start_fold))
	RegisterSignal(src, COMSIG_MOB_ABILITY_STARTED, PROC_REF(start_unfold))
	RegisterSignal(src, COMSIG_MOB_ABILITY_STARTED, PROC_REF(on_attack_start))
	RegisterSignal(src, COMSIG_MOB_ABILITY_FINISHED, PROC_REF(on_attack_end))

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
	robot_unfold()

/mob/living/simple_animal/hostile/megafauna/robothare/proc/robot_unfold(mob/living/owner, datum/action/cooldown/activated)
	SIGNAL_HANDLER
	if(activated == start_unfold)
		icon_state = "robothare"
		flick("[icon_living]_unpacking", src)
		folded = FALSE
		visible_message(span_warning("[src] unfolds and powers up with an ominous hum!"))
		playsound(src, 'sound/effects/servostep.ogg', 100, TRUE)

/mob/living/simple_animal/hostile/megafauna/robothare/proc/robot_fold(mob/living/owner, datum/action/cooldown/activated)
	SIGNAL_HANDLER
	if(activated == start_fold)
		icon_state = "robothare_folded"
		flick("[icon_living]_packing", src)
		folded = FALSE
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
	playsound(src, 'sound/effects/empulse.ogg', 150, TRUE)

	// Increase speed
	speed = 10
	move_to_delay = 4

	// Add electrical effects
	add_atom_colour(COLOR_CYAN, TEMPORARY_COLOUR_PRIORITY)
	set_light_range(5)
	set_light_power(2)
	set_light_color(COLOR_CYAN)

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
	if(!neutralized)
		if(I.tool_behaviour == TOOL_WRENCH)
			user.visible_message(span_notice("[user] starts dismantling [src]..."), span_notice("You start dismantling [src]..."))
			I.play_tool_sound(src)
			if(I.use_tool(src, user, 3 SECONDS, volume = 50))
				dismantle_robothare(user)
				return TRUE

	return ..()icons/obj/weapons/hammer.dmi

/**
 * Dismantle the broken robot hare for loot
 */
/mob/living/simple_animal/hostile/megafauna/robothare/proc/dismantle_robothare(mob/user)
	visible_message(span_info("[user] dismantles the broken robot hare!"))
	playsound(src, 'sound/misc/metal_creak.ogg', 80, TRUE)

	// Roll for loot
	var/loot_roll = rand(1, 100)

	if(loot_roll <= 40)
		// Common loot (40% chance)
		var/obj/item/common_loot = pick(
			/obj/item/circuitboard/machine/autolathe,
			/obj/item/stock_parts/matter_bin/super,
			/obj/item/stack/cable_coil,
			/obj/item/stack/sheet/iron,
			/obj/item/stock_parts/power_store/cell/high,
		)
		new common_loot(loc)
		to_chat(user, span_notice("You salvaged some useful components!"))

	else if(loot_roll <= 70)
		// Uncommon loot (30% chance)
		var/uncommon_loot = pick(/obj/item/stock_parts/capacitor/quadratic, /obj/item/stock_parts/micro_laser/quadultra)
		new uncommon_loot(loc)
		to_chat(user, span_notice("You found some valuable robotics parts!"))

	else if(loot_roll <= 90)
		// Rare loot (20% chance)
		new /obj/item/dice/d20(loc)
		to_chat(user, span_warning("You uncovered a rare robotics component!"))

	else
		// Very rare loot (10% chance)
		new /obj/item/mjollnir(loc)
		to_chat(user, span_boldwarning("You salvaged strange hammer!"))

	// Always give some scrap metal
	new /obj/item/stack/sheet/iron(rand(2, 4), loc)

	// Remove the mob
	qdel(src)

#undef ROBOHARE_PHASE2

/**
 * Lightning Bolt Projectile
 * Fires electrical bolts that deal brute and burn damage with a chance to stun
 */
/obj/projectile/lightning_bolt
	name = "lightning bolt"
	icon = 'modular_celadon/modules/robot_hare_boss/icons/projectiles.dmi'
	icon_state = "electric_shock_bolt"
	damage = 20
	armour_penetration = 30
	speed = 1
	damage_type = BRUTE
	var/stun_chance = 30
	var/burn_damage = 15

/obj/projectile/lightning_bolt/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(isliving(target) && !blocked)
		var/mob/living/living_target = target
		// Apply burn damage
		living_target.adjust_fire_loss(burn_damage)

		// Chance to stun (electrocution)
		if(prob(stun_chance))
			living_target.Paralyze(20, FALSE)
			living_target.Stun(10, FALSE)
			to_chat(living_target, span_userdanger("You're electrocuted by the lightning!"))

		// Visual and sound effects
		playsound(get_turf(src), 'sound/effects/magic/lightningbolt.ogg', 100, TRUE)

		// Create electrical effect at hit location
		var/turf/hit_turf = get_turf(src)
		if(hit_turf)
			new /obj/effect/temp_visual/lightning_strike(hit_turf)

/**
 * Lightning Bolt Projectile Attack Action
 */
/datum/action/cooldown/mob_cooldown/projectile_attack/lightning_bolt
	name = "Lightning Bolt"
	button_icon = 'modular_celadon/modules/robot_hare_boss/icons/actions_items.dmi'
	button_icon_state = "lightning_action"
	desc = "Fires a lightning bolt at the target."
	cooldown_time = 3 SECONDS
	projectile_type = /obj/projectile/lightning_bolt
	projectile_sound = 'sound/effects/magic/lightningbolt.ogg'

/datum/action/cooldown/mob_cooldown/projectile_attack/lightning_bolt/Activate(atom/target_atom)
	. = ..()
	if(owner)
		playsound(owner, 'sound/effects/chemistry/shockwave_explosion.ogg', 100, TRUE)
		owner.visible_message(span_danger("[owner] fires lightning bolt!"))
		new /obj/effect/temp_visual/dir_setting/firing_effect(owner.loc, owner.dir)

/**
 * Action to fold or unfold boss
 */
/datum/action/cooldown/mob_cooldown/fold_unfold
	name = "Fold/Unfold"
	button_icon = 'modular_celadon/modules/robot_hare_boss/icons/actions_items.dmi'
	button_icon_state = "fold_unfold"
	desc = "Fold or Unfold yourself"
	cooldown_time = 60 SECONDS

/datum/action/cooldown/mob_cooldown/fold_unfold/Activate(atom/target_atom)
	. = ..()
	if(owner)
		playsound(owner, 'sound/machines/blastdoor.ogg', 100, TRUE)
		if(owner.folded)
			owner.folded = FALSE
			owner.robot_fold()
		else
			owner.folded = TRUE
			owner.robot_unfold()
/**
 * Lightning Strike Visual Effect
 */
/obj/effect/temp_visual/lightning_strike
	name = "lightning strike"
	desc = "A brilliant flash of electrical energy."
	icon = 'modular_celadon/modules/robot_hare_boss/icons/robot_hare.dmi'
	icon_state = "lightning_effect"
	layer = FLY_LAYER
	plane = GAME_PLANE
	duration = 5
	light_system = OVERLAY_LIGHT
	light_range = 3
	light_color = "#88FFFF"

/obj/effect/temp_visual/lightning_strike/Initialize(mapload)
	. = ..()
	animate(src, alpha = 0, time = duration)

/**
 * Crusher Trophy: Robot Hare Ear
 * A trophy dropped when defeating the Robot Hare without taking significant damage
 */
/obj/item/crusher_trophy/robot_hare_ear
	name = "robot hare ear"
	desc = "A metallic ear from the defeated Robot Hare. Proof of your prowess against this mechanical menace."
	icon = 'modular_celadon/modules/robot_hare_boss/icons/robot_hare.dmi'
	icon_state = "trophy_ear"
	denied_type = /obj/item/crusher_trophy/robot_hare_ear

/obj/item/crusher_trophy/robot_hare_ear/effect_desc()
	return "mark detonation to briefly shock nearby enemies"

/obj/item/crusher_trophy/robot_hare_ear/on_mark_detonation(mob/living/target, mob/living/user)
	. = ..()
	// Create an electrical shock effect around the user
	for(var/mob/living/enemy in range(3, user))
		if(enemy != user && !enemy.faction_check_atom(user))
			playsound(get_turf(enemy), 'sound/effects/magic/lightningbolt.ogg', 80, TRUE)
			enemy.apply_damage(10, BURN)
			enemy.Stun(5, FALSE)
	to_chat(user, span_notice("The robot hare ear crackles with energy!"))
