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
/datum/action/cooldown/fold_unfold
	name = "Fold/Unfold"
	button_icon = 'modular_celadon/modules/robot_hare_boss/icons/actions_items.dmi'
	button_icon_state = "fold_unfold"
	desc = "Fold or Unfold yourself"
	cooldown_time = 60 SECONDS
	click_to_activate = FALSE

/datum/action/cooldown/fold_unfold/Activate(atom/target_atom)
	. = ..()
	if(owner)
		playsound(owner, 'sound/machines/blastdoor.ogg', 100, TRUE)
		SEND_SIGNAL(owner, COMSIG_ROBOT_FOLD_UNFOLD_STARTED)
/**
 * Lightning Strike Visual Effect
 */
/obj/effect/temp_visual/lightning_strike
	name = "lightning strike"
	desc = "A brilliant flash of electrical energy."
	icon = 'modular_celadon/modules/robot_hare_boss/icons/96x96robot_hare.dmi'
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
		// Apply emp damage
		target.emp_act(EMP_HEAVY)
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
