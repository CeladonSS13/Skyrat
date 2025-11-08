/datum/status_effect/black_flame
	id = "black_flame"
	tick_interval = 0.2 SECONDS
	status_type = STATUS_EFFECT_REFRESH
	duration = 3 SECONDS

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

	owner.apply_damage(damage_per_second * seconds_between_ticks, damage_type)
	owner.apply_damage(stamina_per_second * seconds_between_ticks, STAMINA)
