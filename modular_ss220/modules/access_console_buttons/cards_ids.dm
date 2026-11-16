/obj/item/card/id/advanced/chameleon/proc/ui_act_extra(var/obj/item/card/id/target_card, action, list/params, datum/tgui/ui, datum/ui_state/state)
	var/mob/user = usr
	switch (action)
		if("select_all") // сould be optimized if we modify the way we getting data, but is someone really care for such function?
			var/list/params_received = params["accesses"]
			if(!target_card || !params_received || params_received.len < 1)
				return TRUE
			var/wildcardTab = params["selectedWildcard"]
			for(var/department in params_received) // UI mess here we go
				var/list/accesses_department = department["accesses"]
				for(var/access_data in accesses_department)
					var/access_type = access_data["ref"]
					if ((access_type in access) || !(access_type in target_card.access))
						continue
					if (!add_access(list(access_type), wildcardTab))
						continue // don't spam excess logs and errors to client
					if(access_type in ACCESS_ALERT_ADMINS)
						message_admins("[ADMIN_LOOKUPFLW(user)] just added [SSid_access.get_access_desc(access_type)] to an ID card [ADMIN_VV(src)] [(src.registered_name) ? "belonging to [src.registered_name]." : "with no registered name."]")
					LOG_ID_ACCESS_CHANGE(user, src, "added [SSid_access.get_access_desc(access_type)]")
			return TRUE
		if ("deselect_all")
			var/list/params_received = params["accesses"]
			if(!target_card || !params_received || params_received.len < 1)
				return TRUE
			for(var/department in params_received) // UI mess here we go
				var/list/accesses_department = department["accesses"]
				for(var/access_data in accesses_department)
					var/access_type = access_data["ref"]
					if(access_type in access)
						remove_access(list(access_type))
						LOG_ID_ACCESS_CHANGE(user, src, "removed [SSid_access.get_access_desc(access_type)]")
			return TRUE
