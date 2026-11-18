/obj/effect/temp_visual/blank_effect_on_user
	var/datum/weakref/special_effects_holder_ref
	duration = 1 SECONDS

/obj/effect/temp_visual/blank_effect_on_user/Destroy()
	. = ..()

	if (!special_effects_holder_ref)
		return .

	var/obj/effect/abstract/particle_holder/special_effects = special_effects_holder_ref.resolve()

	if (!isnull(special_effects) && istype(special_effects, /obj/effect/abstract/particle_holder))
		qdel(special_effects)

/obj/effect/temp_visual/blank_effect_on_user/impact_black_flame_sword
	var/particle_path = /particles/custom_effect/two_color_darkred_black/intense

/obj/effect/temp_visual/blank_effect_on_user/impact_black_flame_sword/Initialize(mapload)
	. = ..()

	var/obj/effect/abstract/particle_holder/special_effects_blank_on_slash_loc = new(src, particle_path) // effect at slash location
	special_effects_holder_ref = WEAKREF(special_effects_blank_on_slash_loc)
