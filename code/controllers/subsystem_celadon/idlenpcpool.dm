SUBSYSTEM_DEF(idlenpcpool)
	name = "NPC Idle Pool"
	ss_flags = SS_POST_FIRE_TIMING|SS_NO_INIT|SS_BACKGROUND
	priority = FIRE_PRIORITY_IDLE_NPC
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME

	var/list/idlerun = list()

/datum/controller/subsystem/idlenpcpool/stat_entry(msg)
	var/list/idlelist = GLOB.simple_animals[AI_IDLE]
	msg = "NPCS:[length(idlelist)]"
	return ..()

/datum/controller/subsystem/idlenpcpool/fire(resumed = FALSE)

	if (!resumed)
		var/list/idlelist = GLOB.simple_animals[AI_IDLE]
		src.idlerun = idlelist.Copy()

	//cache for sanic speed (lists are references anyways)
	var/list/idlerun = src.idlerun

	while(idlerun.len)
		var/mob/living/simple_animal/SA = idlerun[idlerun.len]
		--idlerun.len

		if (QDELETED(SA)) // Some issue causes nulls to get into this list some times. This keeps it running, but the bug is still there.
			GLOB.simple_animals[AI_IDLE] -= SA
			stack_trace("Found a null in simple_animals idle list [SA.type]!")
			continue

		if(!SA.ckey && !HAS_TRAIT(SA, TRAIT_NO_TRANSFORM) && !isbot(SA))
			if((SA.stat != DEAD )&& (SA.AIStatus == AI_IDLE))
				SA.handle_automated_action()
			if((SA.stat != DEAD) && (SA.AIStatus == AI_IDLE))
				SA.handle_automated_speech()
		if (MC_TICK_CHECK)
			return
