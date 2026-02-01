/datum/action/cooldown/spell/pointed/projectile/customizable_slash_wave
	name = "Blade Slash"
	desc = "Send slash to target point."
	button_icon_state = "exsanguinating_strike"
	base_icon_state = "exsanguinating_strike"
	active_overlay_icon_state = "bg_spell_border_active_red"
	cast_range = 9
	cooldown_time = 10 SECONDS
	spell_requirements = NONE
	antimagic_flags = NONE

	active_msg = "You tighten grip on your sword!"
	deactive_msg = "You relax grip on your sword."
	projectile_type = /obj/projectile/blade_slash
	projectile_amount = 3

	var/particles_on_cast_for_user = /particles/custom_effect/two_color_darkred_black
	var/particles_duration_on_cast_for_user = 1 SECONDS
	var/time_for_next_particle = 0

/datum/action/cooldown/spell/pointed/projectile/customizable_slash_wave/cast(atom/cast_on)
	. = ..()
	if (!.)
		return .

	if (world.time < time_for_next_particle)
		return .

	if (!particles_on_cast_for_user)
		return .

	time_for_next_particle = world.time + particles_duration_on_cast_for_user
	new /obj/effect/abstract/particle_holder/timed(owner, particles_on_cast_for_user, NONE, particles_duration_on_cast_for_user) // effect on user

/obj/projectile/blade_slash
	name = "slash"
	icon = 'icons/effects/effects.dmi'
	icon_state = "highfreq_slash"
	damage = 20 // compensate damage status effect
	damage_type = BRUTE
	armor_flag = MELEE
	impact_effect_type = /obj/effect/temp_visual/blank_effect_on_user/impact_black_flame_sword
	color = COLOR_DARK_RED
	alpha = 150
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE
	hitsound = 'modular_ss220/modules/admin_spawn_stuff/custom_particle_effect/sound/loud_slash.ogg'
	hitsound_wall = 'modular_ss220/modules/admin_spawn_stuff/custom_particle_effect/sound/loud_slash.ogg'
	always_impact_on_living = TRUE

	var/effect_on_hit = /datum/status_effect/black_flame
	var/particle_type_flying = /particles/custom_effect/two_color_darkred_black
	var/obj/effect/abstract/particle_holder/effect_holder_flying

/obj/projectile/blade_slash/Initialize(mapload)
	. = ..()
	effect_holder_flying = new(src, particle_type_flying)

	var/matrix/new_transform = matrix()
	new_transform.Turn(rand(1, 360)) // Random slash angle
	transform = new_transform

	var/matrix/scaled_transform = new_transform + matrix(new_transform.a, new_transform.b, 0, new_transform.d, new_transform.e, 0) // mult by 2 some parts
	animate(src, 0.5, color = src.color, transform = scaled_transform, alpha = 255)

/obj/projectile/blade_slash/Destroy()
	. = ..()
	QDEL_NULL(effect_holder_flying)

/obj/projectile/blade_slash/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()

	if (isliving(target))
		var/mob/living/living_target = target
		living_target.apply_status_effect(effect_on_hit)

	return .
