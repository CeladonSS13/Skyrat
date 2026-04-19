/datum/mind
	var/sent_interlink_navigation = FALSE

/datum/mind/proc/try_show_interlink_navigation()
	if (!sent_interlink_navigation)
		sent_interlink_navigation = TRUE
		addtimer(CALLBACK(src, TYPE_PROC_REF(/datum/mind, show_interlink_navigate)), 2 SECONDS)

/datum/mind/proc/show_interlink_navigate()
	if (!src || !src.current)
		return

	var/client/player_client = get_player_client(src)

	if (!player_client)
		return

	var/mob/living/joining_mob_living = src.current

	if (!joining_mob_living) // we are not living???
		return

	if (!istype(get_area(joining_mob_living), /area/centcom/interlink))
		return

	var/exp_living = player_client.get_exp_living(pure_numeric = TRUE)
	if (exp_living > 600) // 10 hours
		return

	var/list/consoles = SSmachines.get_machines_by_type(/obj/machinery/computer/shuttle/arrivals)
	for(var/obj/machinery/computer/shuttle/arrivals/iter_console as anything in consoles)
		if(is_centcom_level(iter_console?.loc.z))
			continue
		consoles -= iter_console

	if (!consoles || consoles.len != 1)
		// ok so probably shuttle flied to station and not on interlink right now, lets check for recall console
		consoles = SSmachines.get_machines_by_type(/obj/machinery/computer/shuttle/arrivals/recall)
		for(var/obj/machinery/computer/shuttle/arrivals/recall/iter_console as anything in consoles)
			if(is_centcom_level(iter_console?.loc.z))
				continue
			consoles -= iter_console

	if (!consoles || consoles.len != 1)
		log_runtime("failed to find single shuttle console to station in interlink, no recall consoles found or there are more than one")
		return

	var/atom/console = consoles[1] // byond indexing from 1..., can be both /arrivals or /arrivals/recall
	var/atom/navigate_target = console.loc

	if (!navigate_target)
		return

	// the rest below is copied from code\modules\mob\living\navigation.dm

	var/list/path = get_path_to(joining_mob_living, navigate_target, 255, mintargetdist = 1, access = joining_mob_living?.get_access(), skip_first = FALSE)

	if(!length(path))
		// no path with current access
		var/list/access_all_station = SSid_access.get_region_access_list(list(REGION_ALL_STATION, REGION_CENTCOM))
		path = get_path_to(joining_mob_living, navigate_target, 255, mintargetdist = 1, access = access_all_station, skip_first = FALSE) // same invocation as above, just with other access
		if(!length(path))
			return // no path found

	path |= get_turf(navigate_target)
	for(var/i in 1 to length(path))
		var/turf/current_turf = path[i]
		var/image/path_image = image(icon = 'icons/effects/navigation.dmi', layer = HIGH_PIPE_LAYER, loc = current_turf)
		SET_PLANE(path_image, GAME_PLANE, current_turf)
		path_image.color = COLOR_CYAN
		path_image.alpha = 0
		var/dir_1 = 0
		var/dir_2 = 0
		if(i == 1)
			dir_2 = REVERSE_DIR(angle2dir(get_angle(path[i+1], current_turf)))
		else if(i == length(path))
			dir_2 = REVERSE_DIR(angle2dir(get_angle(path[i-1], current_turf)))
		else
			dir_1 = REVERSE_DIR(angle2dir(get_angle(path[i+1], current_turf)))
			dir_2 = REVERSE_DIR(angle2dir(get_angle(path[i-1], current_turf)))
			if(dir_1 > dir_2)
				dir_1 = dir_2
				dir_2 = REVERSE_DIR(angle2dir(get_angle(path[i+1], current_turf)))
		path_image.icon_state = "[dir_1]-[dir_2]"
		player_client.images += path_image
		player_client.navigation_images += path_image
		animate(path_image, 0.5 SECONDS, alpha = 150)

	joining_mob_living.navigation_callbacks()
	joining_mob_living.balloon_alert(joining_mob_living, "navigation path created")

	to_chat(player_client,
		type = MESSAGE_TYPE_INFO,
		html = custom_boxed_message("purple_box", span_purple("<b>Подсказка: </b> Проложен путь навигации до шаттла на станцию, изображен под ногами. Убрать путь можно через кнопку navigate, которая находится неподалеку от надписи COMBAT"))
	)
