/datum/dynamic_panel/ui_data(mob/user)
	. = ..()
	if (!.)
		return .
	var/list/data = .
	if (!data)
		return .
	data["progressive_dynamic_enabled"] = GLOB.dynamic_progressive_enabled

/datum/dynamic_panel/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	switch(action)
		if ("progressive_dynamic_toggle")
			GLOB.dynamic_progressive_enabled = !GLOB.dynamic_progressive_enabled
			var/msg = "[key_name_admin(ui.user)] [GLOB.dynamic_progressive_enabled ? "Enabled" : "Disabled"] progressive dynamic."
			message_admins(msg)
			log_admin(msg)
			return TRUE
		if ("progressive_dynamic_vv")
			ui.user?.client?.debug_variables(SSprogressive_dynamic)
			return TRUE
