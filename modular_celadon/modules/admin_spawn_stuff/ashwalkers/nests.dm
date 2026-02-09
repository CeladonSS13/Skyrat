/obj/structure/mob_spawner/ashwalker_tendril1984
	name = "necropolis tendril nest"
	desc = "A vile tendril of corruption. It's surrounded by a nest of rapidly growing eggs..."

	icon = 'icons/mob/simple/lavaland/nest.dmi'
	icon_state = "tendril"

	faction = list(FACTION_MINING, FACTION_MINING_FAUNA, FACTION_ASHWALKER, NEST_FACTION)

	monster_types = list(
		/mob/living/carbon/human/species/lizard/ashwalker/hostile/melee,
	)
	max_mobs = 5
	spawn_cooldown = 30 SECONDS
	regenerate_time = 1 MINUTES
	trigger_range = 30 // don't make it really huge for perfomance stuff
	ghost_controllable = FALSE

/obj/structure/mob_spawner/ashwalker_tendril1984/calculate_trigger_turfs()
	for(var/turf/open/some_turf in range(trigger_range, src))
		registered_turfs += some_turf
		RegisterSignal(some_turf, COMSIG_ATOM_ENTERED, PROC_REF(proximity_trigger))
