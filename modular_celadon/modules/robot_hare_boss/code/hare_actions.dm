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
 * Telescopic arm Attack Action
 */
/datum/action/cooldown/mob_cooldown/projectile_attack/telescopic_arm
	name = "Telescopic Arm"
	button_icon = 'modular_celadon/modules/robot_hare_boss/icons/actions_items.dmi'
	button_icon_state = "telescopic_arm"
	desc = "Fires a extendo-arm at the target."
	cooldown_time = 10 SECONDS
	projectile_type = /obj/projectile/telescopic_arm
	projectile_sound = 'sound/items/weapons/slam.ogg'


/**
 * Telescopic arm attack
 */
/obj/projectile/telescopic_arm
	name = "hand"
	icon_state = "hand"
	icon = 'modular_celadon/modules/robot_hare_boss/icons/telescopic_arm.dmi'
	pass_flags = PASSTABLE
	damage = 20
	stamina = 20
	armour_penetration = 60
	damage_type = BRUTE
	hitsound = 'sound/items/weapons/genhit2.ogg'
	/// You got hit by extendo arm, the bigger one!
	var/datum/beam/initial_arm
	var/chain_icon = 'modular_celadon/modules/robot_hare_boss/icons/telescopic_arm.dmi'

/obj/projectile/telescopic_arm/fire(setAngle)
	if(firer)
		initial_arm = firer.Beam(src, icon_state = "chain", icon = chain_icon, emissive = FALSE)
	return ..()

/obj/projectile/telescopic_arm/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(!ismovable(target))
		return

	if(!isliving(target))
		return
	var/mob/living/designated_target = target
	designated_target.visible_message(span_danger("[designated_target] is hit by [firer]'s arm!"))
	designated_target.apply_damage(30, BRUTE)

/obj/projectile/telescopic_arm/Destroy(force)
	QDEL_NULL(initial_arm)
	return ..()


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
	var/emp_radius = 1 // do not forget about rage state

/obj/projectile/lightning_bolt/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(isliving(target) && !blocked)
		var/mob/living/living_target = target
		// Apply burn damage
		living_target.adjust_fire_loss(burn_damage)
		// Apply emp damage
		empulse(target, emp_radius, emp_radius, emp_source = src)
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
