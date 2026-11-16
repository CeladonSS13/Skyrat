/datum/computer_file/program/card_mod/ui_act(action, params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if (.)
		return .
	var/mob/user = usr
	var/obj/item/card/id/inserted_auth_card = computer.alt_stored_id
	switch (action)
		if("select_all") // сould be optimized if we modify the way we getting data, but is someone really care for such function?
			var/list/params_received = params["accesses"]
			if(!computer || !authenticated_card || !inserted_auth_card || !params_received || params_received.len < 1)
				return TRUE
			var/wildcardTab = params["selectedWildcard"]
			playsound(computer, SFX_TERMINAL_TYPE, 50, FALSE)
			for(var/department in params_received) // UI mess here we go
				var/list/accesses_department = department["accesses"]
				for(var/access_data in accesses_department)
					var/access_type = access_data["ref"]
					if (access_type in inserted_auth_card.access)
						continue
					if(!(access_type in valid_access)) // some centcomm stuff/non station access (have such check in code\modules\modular_computers\file_system\programs\card.dm)
						continue
					if (!inserted_auth_card.add_access(list(access_type), wildcardTab))
						continue // don't spam excess logs and errors to client
					if(access_type in ACCESS_ALERT_ADMINS)
						message_admins("[ADMIN_LOOKUPFLW(user)] just added [SSid_access.get_access_desc(access_type)] to an ID card [ADMIN_VV(inserted_auth_card)] [(inserted_auth_card.registered_name) ? "belonging to [inserted_auth_card.registered_name]." : "with no registered name."]")
					LOG_ID_ACCESS_CHANGE(user, inserted_auth_card, "added [SSid_access.get_access_desc(access_type)]")
			return TRUE
		if ("deselect_all")
			var/list/params_received = params["accesses"]
			if(!computer || !authenticated_card || !inserted_auth_card || !params_received || params_received.len < 1)
				return TRUE
			playsound(computer, SFX_TERMINAL_TYPE, 50, FALSE)
			for(var/department in params_received) // UI mess here we go
				var/list/accesses_department = department["accesses"]
				for(var/access_data in accesses_department)
					var/access_type = access_data["ref"]
					if(access_type in inserted_auth_card.access)
						inserted_auth_card.remove_access(list(access_type))
						LOG_ID_ACCESS_CHANGE(user, inserted_auth_card, "removed [SSid_access.get_access_desc(access_type)]")
			return TRUE
