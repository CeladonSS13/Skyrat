/obj/effect/accelerated_particle
	name = "accelerated particles"
	desc = "Small things moving very fast."
	icon = 'modular_celadon/modules/engineering/icons/particle_accelerator.dmi'
	icon_state = "particle"
	anchored = TRUE
	density = FALSE
	/// The range that the particle will travel before disappearing.
	var/movement_range = 10
	/// The amount of energy that the particle will transfer to whatever it hits.
	var/energy = 10
	/// The speed of the particle.
	var/speed = 1

/obj/effect/accelerated_particle/weak
	movement_range = 8
	energy = 5

/obj/effect/accelerated_particle/strong
	movement_range = 15
	energy = 15

/obj/effect/accelerated_particle/powerful
	movement_range = 20
	energy = 25
	color = COLOR_RED

/obj/effect/accelerated_particle/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(move)), 1)
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)


/obj/effect/accelerated_particle/Bump(atom/bumped_atom)
	. = ..()
	if(bumped_atom)
		if(isliving(bumped_atom))
			toxmob(bumped_atom)
		else if(istype(bumped_atom, /obj/machinery/singularity_generator))
			var/obj/machinery/singularity_generator/gen = bumped_atom
			gen.energy += energy
		else if(istype(bumped_atom, /obj/singularity))
			var/obj/singularity/sing = bumped_atom
			sing.energy += energy
		else if(istype(bumped_atom, /obj/energy_ball))
			var/obj/energy_ball/tesla = bumped_atom
			tesla_act(tesla)
		else if(istype(bumped_atom, /obj/structure/blob))
			bumped_atom.take_damage(energy * 0.6)
			movement_range = 0

/obj/effect/accelerated_particle/proc/on_entered(datum/source, atom/movable/movable_atom)
	SIGNAL_HANDLER
	if(isliving(movable_atom))
		toxmob(movable_atom)


/obj/effect/accelerated_particle/ex_act(severity, target)
	qdel(src)

/obj/effect/accelerated_particle/singularity_pull()
	return

/obj/effect/accelerated_particle/singularity_act()
	return

/obj/effect/accelerated_particle/proc/toxmob(mob/living/target_mob)
	to_chat(target_mob, span_green("Your body tingles as the accelerated particles pass through you."))
	target_mob.adjust_tox_loss(energy / 10)

/obj/effect/accelerated_particle/proc/tesla_act(atom/tesla)
	var/obj/energy_ball/tesla_ball = tesla
	if(!energy)
		return
	if(tesla_ball.energy < 50)
		tesla_ball.energy += energy
	else if(tesla_ball.energy < 100)
		tesla_ball.energy += (energy / 2)
	else if(tesla_ball.energy < 200)
		tesla_ball.energy += (energy / 4)
	else if(tesla_ball.energy < 400)
		return
	return TRUE

/obj/effect/accelerated_particle/proc/move()
	if(QDELETED(src))
		return
	if(!step(src, dir))
		forceMove(get_step(src, dir))
	movement_range--
	if(!movement_range)
		qdel(src)
	else
		addtimer(CALLBACK(src, PROC_REF(move)), speed, TIMER_STOPPABLE)
