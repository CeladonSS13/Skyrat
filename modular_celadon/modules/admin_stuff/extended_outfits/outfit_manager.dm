/datum/outfit_editor/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(!.)
		return .

	if (action != "open_trait_window")
		return .

	// same logic as /datum/admins/proc/modify_traits(datum/D), but with removed unused stuff & checks

	while (TRUE)
		var/add_or_remove = input("Remove/Add?", "Trait Remove/Add") as null|anything in list("Add","Remove", "DONE")
		if(!add_or_remove)
			return .

		var/list/available_traits = list()

		switch(add_or_remove)
			if("Add")
				for(var/key in GLOB.admin_visible_traits)
					if(ispath(/mob,key))
						available_traits += GLOB.admin_visible_traits[key]
			if("Remove")
				if(!GLOB.admin_trait_name_map)
					GLOB.admin_trait_name_map = generate_admin_trait_name_map()
				for(var/trait in drip._status_traits)
					var/name = GLOB.admin_trait_name_map[trait] || trait
					available_traits[name] = trait
			if("DONE")
				return .

		var/chosen_trait = input("Select trait to modify", "Trait") as null|anything in sort_list(available_traits)
		if(!chosen_trait)
			continue
		chosen_trait = available_traits[chosen_trait]

		switch(add_or_remove)
			if("Add")
				ADD_TRAIT(drip,chosen_trait,ADMIN_OUTFIT_TRAIT)
			if("Remove")
				REMOVE_TRAIT(drip,chosen_trait,ADMIN_OUTFIT_TRAIT)
		drip.has_any_movement_trait = GLOB.movement_type_trait_to_flag[chosen_trait]
