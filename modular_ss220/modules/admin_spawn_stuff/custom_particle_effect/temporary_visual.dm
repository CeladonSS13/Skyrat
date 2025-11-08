/obj/effect/temp_visual/blank_effect_on_user
	var/datum/weakref/special_effects_holder_ref
	duration = 1 SECONDS

/obj/effect/temp_visual/blank_effect_on_user/Initialize(mapload)
	. = ..()
	if (!isweakref(special_effects_holder_ref))
		log_runtime("special_effects_holder_ref is not assigned on [name] on [loc.x], [loc.y] [loc.z]!")

/obj/effect/temp_visual/blank_effect_on_user/Destroy()
	. = ..()

	if (!special_effects_holder_ref)
		return .

	var/obj/effect/abstract/particle_holder/special_effects = special_effects_holder_ref.resolve()

	if (!isnull(special_effects) && istype(special_effects, /obj/effect/abstract/particle_holder))
		qdel(special_effects)
