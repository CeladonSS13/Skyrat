/mob/dead/new_player/create_character(atom/destination)
	. = ..()
	if (!new_character || !new_character.mind)
		return .
	new_character.mind.try_show_interlink_navigation()

/mob/living/proc/navigation_callbacks()
	addtimer(CALLBACK(src, PROC_REF(shine_navigation)), 0.5 SECONDS)
	RegisterSignal(src, COMSIG_LIVING_DEATH, PROC_REF(cut_navigation))
