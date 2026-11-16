/obj/effect/abstract/particle_holder/timed
	var/timerid

/obj/effect/abstract/particle_holder/timed/Initialize(mapload, particle_path = /particles/smoke, particle_flags = NONE, duration = 1 SECONDS)
	. = ..()
	if (. == INITIALIZE_HINT_QDEL)
		return .
	timerid = QDEL_IN_STOPPABLE(src, duration ? duration : 1 SECONDS)

/obj/effect/abstract/particle_holder/timed/Destroy()
	. = ..()
	deltimer(timerid)
