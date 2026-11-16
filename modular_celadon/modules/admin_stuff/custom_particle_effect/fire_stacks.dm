/datum/status_effect/black_flame
	id = "black_flame"
	tick_interval = 0.2 SECONDS
	status_type = STATUS_EFFECT_REFRESH
	duration = 3 SECONDS
	alert_type = /atom/movable/screen/alert/status_effect/black_flame

	var/damage_per_second = 5
	var/damage_type = BURN
	var/stamina_per_second = 5

	var/obj/effect/abstract/particle_holder/effect_holder
	var/particle_type = /particles/custom_effect/two_color_white_black


/datum/status_effect/black_flame/on_apply()
	if (isnull(effect_holder))
		effect_holder = new(owner, particle_type)
	return TRUE

/datum/status_effect/black_flame/on_remove()
	QDEL_NULL(effect_holder)

/datum/status_effect/black_flame/tick(seconds_between_ticks)
	if(QDELETED(owner)) // burn even when died
		qdel(src)
		return

	var/need_mob_update = FALSE
	need_mob_update += owner.adjust_stamina_loss(stamina_per_second * seconds_between_ticks, updating_stamina = FALSE)
	need_mob_update += owner.apply_damage(damage_per_second * seconds_between_ticks, damage_type)
	if (need_mob_update)
		owner.updatehealth()

/atom/movable/screen/alert/status_effect/black_flame
	name = "Black Flame"
	desc = "It seems that you are burning from inside!"
	icon_state = "crucible"
