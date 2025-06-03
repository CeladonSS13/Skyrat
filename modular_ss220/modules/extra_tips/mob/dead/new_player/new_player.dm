/mob/dead/new_player/create_character(atom/destination)
	. = ..(destination)

	if (!. || !new_character)
		return

	var/datum/mind/target_mind = new_character.mind

	if (!target_mind)
		return

	if (!src.client)
		return

	// TIP FOR NAVIGATION BUTTON
	var/exp_living = src.client.get_exp_living(pure_numeric = TRUE)
	if (exp_living > 180) // 3 hours
		return

	target_mind.try_show_navigation_tip()
