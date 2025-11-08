// https://www.byond.com/docs/ref/info.html#/{notes}/particles

// particles

/particles/custom_effect
	icon = 'icons/effects/particles/pollen.dmi'
	icon_state = "pollen"
	width = 100
	height = 100
	count = 1000
	spawning = 4 // 4 new particles per 0.1s
	lifespan = 0.7 SECONDS // how much till fade out
	fade = 1 SECONDS // fade out time
	grow = -0.01 // change in scale per TICK!
	velocity = list(0, 0) // x,y,z velocity in pixels
	position = generator(GEN_CIRCLE, 0, 16, NORMAL_RAND) // from center, in pixels
	drift = generator(GEN_VECTOR, list(0, -0.2), list(0, 0.2)) // Added acceleration every tick; e.g. a circle or sphere generator can be applied to produce snow or ember effects
	gravity = list(0, 0.95) // Constant acceleration applied to all particles in this set (pixels per squared tick)
	scale = generator(GEN_VECTOR, list(0.3, 0.3), list(1,1), NORMAL_RAND) // Scale applied
	rotation = 30 // Angle of rotation (clockwise); applies only if using an icon
	spin = generator(GEN_NUM, -20, 20) // Change in rotation per tick
	color = COLOR_WHITE

/particles/custom_effect/two_color_darkred_black
	color = generator("color", COLOR_DARK_RED, COLOR_BLACK, UNIFORM_RAND) // generator syntax doesn't really work well not from constructor

/particles/custom_effect/two_color_darkred_black/intense
	scale = generator(GEN_VECTOR, list(1, 1), list(3,3), NORMAL_RAND)
	spawning = 8
	position = generator(GEN_CIRCLE, 0, 48, NORMAL_RAND)

/particles/custom_effect/two_color_white_black
	color = generator("color", COLOR_WHITE, COLOR_BLACK, UNIFORM_RAND)

// components

/datum/component/custom_particle
	dupe_mode = COMPONENT_DUPE_ALLOWED

	var/obj/effect/abstract/particle_holder/special_effects

/datum/component/custom_particle/Initialize(color)
	if (!ismovable(parent)) // doesn't really work for items (not for inhands overlays)
		return COMPONENT_INCOMPATIBLE

	special_effects = new(parent, /particles/custom_effect)

	if (color)
		special_effects.color = color

/datum/component/custom_particle/Destroy(force)
	if (istype(special_effects, /obj/effect/abstract/particle_holder))
		QDEL_NULL(special_effects)

	return ..()
