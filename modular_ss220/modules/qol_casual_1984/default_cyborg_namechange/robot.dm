/mob/living/silicon/robot/update_module_innate()
	. = ..()

	if(GLOB.current_anonymous_theme)
		return .
	if(client && client.prefs.read_preference(/datum/preference/name/cyborg) == DEFAULT_CYBORG_NAME) // if no client - no namechange
		addtimer(CALLBACK(src, PROC_REF(prompt_cyborg_namechange)), 0.5 SECONDS)

/mob/living/silicon/robot/proc/prompt_cyborg_namechange()
	var/changed_name = tgui_input_text(src, "Enter desired cyborg name", "Name Change", "[real_name]", MAX_NAME_LEN, timeout = 2 MINUTES)
	if (changed_name)
		fully_replace_character_name(real_name, changed_name)
	return changed_name
