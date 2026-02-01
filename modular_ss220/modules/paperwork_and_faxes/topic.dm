/datum/admins/proc/reply_fax_topic(reply_fax_href, mob/user)
	if(!user || !check_rights(R_ADMIN))
		return

	var/obj/machinery/fax/fax_target = locate(reply_fax_href)

	if (!fax_target)
		return

	var/datum/fax_panel_interface/fax_ui = new /datum/fax_panel_interface(user)

	if (!fax_ui)
		return

	fax_ui.preselected_fax_name = fax_target.fax_name
	fax_ui.ui_interact(user)
