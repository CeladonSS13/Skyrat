/// Creates and sorts all the keybinding datums
/proc/init_keybindings()
	for(var/KB in subtypesof(/datum/keybinding))
		var/datum/keybinding/keybinding = KB
		if(!initial(keybinding.keybind_signal) || !initial(keybinding.name))
			continue
		add_keybinding(new keybinding)
	init_emote_keybinds()

/// Adds an instanced keybinding to the global tracker
/proc/add_keybinding(datum/keybinding/instance)
	GLOB.keybindings_by_name[instance.name] = instance

	// Hotkey
	if(LAZYLEN(instance.hotkey_keys))
		for(var/bound_key in instance.hotkey_keys)
			if (bound_key == "Unbound")
				LAZYADD(GLOB.default_hotkeys[instance.name], list())
			else
				LAZYADD(GLOB.default_hotkeys[instance.name], list(bound_key))

/proc/init_emote_keybinds()
	// SS1984 ADDITION START
	var/list/emotes_list = subtypesof(/datum/emote)
	if (!emotes_list || length(emotes_list) < 1)
		log_runtime("Emotes list is null or empty! Will skip keybindings init")
		return
	var/list/cyrillic_emotes_list = list()
	for(var/i in emotes_list)
		var/datum/emote/faketype = i
		if(!initial(faketype.key))
			continue
		var/target_name = faketype.name
		if (!target_name || length(target_name) < 1)
			target_name = faketype.key
		if (length(target_name) < 1)
			continue
		var/c1 = target_name[1]
		if (c1 < "А" || c1 > "я")
			continue
		cyrillic_emotes_list += faketype
	// SS1984 ADDITION END
	for(var/i in cyrillic_emotes_list) // SS1984 EDIT, original: for(var/i in subtypesof(/datum/emote))
		var/datum/emote/faketype = i
		if(!initial(faketype.key))
			continue
		var/datum/keybinding/emote/emote_kb = new
		emote_kb.link_to_emote(faketype)
		add_keybinding(emote_kb)
