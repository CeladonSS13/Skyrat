/datum/computer_file/program/card_mod_tarkon
	filename = "tarkonidwriter"
	filedesc = "Tarkon Access Management"
	downloader_category = null
	download_access = null
	program_open_overlay = "id"
	extended_desc = "Program for programming employee ID cards to access parts of the Port Tarkon."
	size = 8
	tgui_id = "NtosCard"
	program_icon = "id-card"
	program_flags = PROGRAM_UNIQUE_COPY
	/// The name/assignment combo of the ID card used to authenticate.
	var/authenticated_card
	/// The name of the registered user, related to `authenticated_card`.
	var/authenticated_user
	/// The regions this program has access to based on the authenticated ID.
	var/list/region_access = list()
	/// The list of accesses this program is verified to change based on the authenticated ID. Used for state checking against player input.
	var/list/valid_access = list()
	/// List of job templates that can be applied to ID cards from this program.
	var/list/job_templates = list()
	/// Which departments this program has access to. See region defines.
	var/target_dept
	/// if logged as director
	var/is_director

/datum/computer_file/program/card_mod_tarkon/on_install(datum/computer_file/source, obj/item/modular_computer/computer_installing, mob/user)
	. = ..()
	ADD_TRAIT(computer_installing, TRAIT_MODPC_TWO_ID_SLOTS, REF(src))

/datum/computer_file/program/card_mod_tarkon/Destroy()
	if(computer)
		REMOVE_TRAIT(computer, TRAIT_MODPC_TWO_ID_SLOTS, REF(src))
	return ..()

/datum/computer_file/program/card_mod_tarkon/proc/authenticate(mob/user, obj/item/card/id/auth_card)
	if(!auth_card)
		return

	region_access.Cut()
	valid_access.Cut()
	job_templates.Cut()

	if(ACCESS_TARKON_DIRECTOR in auth_card.access)
		is_director = TRUE
		authenticated_card = "[auth_card.name]"
		authenticated_user = auth_card.registered_name ? auth_card.registered_name : "Unknown"
		job_templates = SSid_access.tarkon_job_templates.Copy()
		valid_access = SSid_access.get_region_access_list(list(REGION_TARKON, REGION_TARKON_DIRECTOR))
		computer.update_static_data_for_all_viewers()
		return TRUE

	else if(ACCESS_TARKON_COMMAND in auth_card.access)
		authenticated_card = "[auth_card.name] \[LIMITED ACCESS\]"
		authenticated_user = auth_card.registered_name ? auth_card.registered_name : "Unknown"
		job_templates = (SSid_access.tarkon_job_templates.Copy()) - /datum/id_trim/away/tarkon/director
		valid_access = SSid_access.get_region_access_list(list(REGION_TARKON))
		computer.update_static_data_for_all_viewers()
		return TRUE

	return FALSE

/datum/computer_file/program/card_mod_tarkon/on_start(mob/living/user)
	. = ..()
	if(!.)
		return FALSE

/datum/computer_file/program/card_mod_tarkon/ui_act(action, params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	var/mob/user = usr
	var/obj/item/card/id/auth_card = computer.stored_id
	var/obj/item/card/id/modified_id = computer.alt_stored_id

	switch(action)
		if("PRG_authenticate")
			if(!computer || !auth_card)
				playsound(computer, 'sound/machines/terminal/terminal_prompt_deny.ogg', 50, FALSE)
				return TRUE
			if(authenticate(user, auth_card))
				playsound(computer, 'sound/machines/terminal/terminal_on.ogg', 50, FALSE)
				return TRUE
		if("PRG_logout")
			authenticated_card = null
			authenticated_user = null
			is_director = FALSE
			playsound(computer, 'sound/machines/terminal/terminal_off.ogg', 50, FALSE)
			return TRUE
		if("PRG_print")
			if(!computer || !authenticated_card || !modified_id)
				return TRUE
			var/contents = {"<h4>Access Report</h4>
						<u>Prepared By:</u> [authenticated_user]<br>
						<u>For:</u> [modified_id.registered_name || "Unregistered"]<br>
						<hr>
						<u>Assignment:</u> [modified_id.assignment]<br>
						<u>Access:</u><br>
						"}

			var/list/known_access_rights = SSid_access.get_region_access_list(list(REGION_ALL_TARKON))
			for(var/A in modified_id.access)
				if(A in known_access_rights)
					contents += " [SSid_access.get_access_desc(A)]"

			if(!computer.print_text(contents, "access report - [modified_id.registered_name || "Unregistered"]"))
				to_chat(usr, span_notice("Printer is out of paper."))
				return TRUE
			else
				playsound(computer, 'sound/machines/terminal/terminal_on.ogg', 50, FALSE)
				computer.visible_message(span_notice("\The [computer] prints out a paper."))
			return TRUE
		if("PRG_terminate")
			if(!computer || !authenticated_card)
				return TRUE
			if(!(is_director))
				if(!(modified_id.trim?.type in job_templates))
					to_chat(usr, span_notice("Software error: You do not have the necessary permissions to demote this card."))
					return TRUE

			modified_id.assignment = is_director ? "Fired" : "Demoted"
			SSid_access.remove_trim_from_card(modified_id)

			playsound(computer, 'sound/machines/terminal/terminal_prompt_deny.ogg', 50, FALSE)
			return TRUE
		if("PRG_edit")
			if(!computer || !authenticated_card || !modified_id)
				return TRUE

			var/old_name = modified_id.registered_name
			var/new_name = sanitize(params["name"])

			if(!new_name)
				modified_id.registered_name = null
				playsound(computer, SFX_TERMINAL_TYPE, 50, FALSE)
				modified_id.update_label()
				if(old_name)
					modified_id.update_icon()
				return TRUE

			new_name = reject_bad_name(new_name, allow_numbers = TRUE)

			if(!new_name)
				to_chat(usr, span_notice("Software error: The ID card rejected the new name as it contains prohibited characters."))
				return TRUE

			modified_id.registered_name = new_name
			playsound(computer, SFX_TERMINAL_TYPE, 50, FALSE)
			modified_id.update_label()
			if(!old_name)
				modified_id.update_icon()
			return TRUE
		if("PRG_age")
			if(!computer || !authenticated_card || !modified_id)
				return TRUE

			var/new_age = params["id_age"]
			if(!isnum(new_age))
				stack_trace("[key_name(usr)] ([usr]) attempted to set invalid age \[[new_age]\] to [modified_id]")
				return TRUE

			modified_id.registered_age = new_age
			playsound(computer, SFX_TERMINAL_TYPE, 50, FALSE)
			return TRUE
		if("PRG_assign")
			if(!computer || !authenticated_card || !modified_id)
				return TRUE
			var/new_asignment = trim(sanitize(params["assignment"]), MAX_NAME_LEN)
			modified_id.assignment = new_asignment
			playsound(computer, SFX_TERMINAL_TYPE, 50, FALSE)
			modified_id.update_label()
			return TRUE
		if("PRG_access")
			if(!computer || !authenticated_card || !modified_id)
				return TRUE
			playsound(computer, SFX_TERMINAL_TYPE, 50, FALSE)
			var/access_type = params["access_target"]
			var/try_wildcard = params["access_wildcard"]
			if(!(access_type in valid_access))
				stack_trace("[key_name(usr)] ([usr]) attempted to add invalid access \[[access_type]\] to [modified_id]")
				return TRUE

			if(access_type in modified_id.access)
				modified_id.remove_access(list(access_type))
				LOG_ID_ACCESS_CHANGE(user, modified_id, "removed [SSid_access.get_access_desc(access_type)]")
				return TRUE

			if(!modified_id.add_access(list(access_type), try_wildcard))
				to_chat(usr, span_notice("ID error: ID card rejected your attempted access modification."))
				LOG_ID_ACCESS_CHANGE(user, modified_id, "failed to add [SSid_access.get_access_desc(access_type)][try_wildcard ? " with wildcard [try_wildcard]" : ""]")
				return TRUE

			if(access_type in ACCESS_ALERT_ADMINS)
				message_admins("[ADMIN_LOOKUPFLW(user)] just added [SSid_access.get_access_desc(access_type)] to an ID card [ADMIN_VV(modified_id)] [(modified_id.registered_name) ? "belonging to [modified_id.registered_name]." : "with no registered name."]")
			LOG_ID_ACCESS_CHANGE(user, modified_id, "added [SSid_access.get_access_desc(access_type)]")
			return TRUE
		// Apply template to ID card.
		if("PRG_template")
			if(!computer || !authenticated_card || !modified_id)
				return TRUE

			playsound(computer, SFX_TERMINAL_TYPE, 50, FALSE)
			var/template_name = params["name"]

			if(!template_name)
				return TRUE

			for(var/trim_path in job_templates)
				var/datum/id_trim/trim = SSid_access.trim_singletons_by_path[trim_path]
				if(trim.assignment != template_name)
					continue

				SSid_access.add_trim_access_to_card(modified_id, trim_path)
				return TRUE

			stack_trace("[key_name(usr)] ([usr]) attempted to apply invalid template \[[template_name]\] to [modified_id]")

			return TRUE
		if("PRG_insert_main_id")
			var/obj/item/card/id/main_id = user.get_active_held_item()
			if(!isidcard(main_id))
				return TRUE
			computer.insert_id(main_id, user)
			return TRUE
		if("PRG_remove_main_id")
			if(computer?.stored_id)
				computer.remove_id(user)
			return TRUE
		if("PRG_insert_alt_id")
			var/obj/item/card/id/alt_id = user.get_active_held_item()
			if(!isidcard(alt_id))
				to_chat(user, span_notice("You must hold an ID card to insert it into the secondary slot."))
				return TRUE
			computer.insert_secondary_id(alt_id, user)
			return TRUE
		if("PRG_remove_alt_id")
			if(computer?.alt_stored_id)
				computer.remove_secondary_id(user)
			return TRUE

/datum/computer_file/program/card_mod_tarkon/ui_static_data(mob/user)
	var/list/data = list()

	var/list/regions = list()
	var/list/tgui_region_data = SSid_access.all_region_access_tgui

	if(is_director)
		regions += tgui_region_data[REGION_TARKON]
		regions += tgui_region_data[REGION_TARKON_DIRECTOR]
	else
		regions += tgui_region_data[REGION_TARKON]

	data["regions"] = regions

	data["access_flags"] = SSid_access.flags_by_access
	data["wildcard_flags"] = SSid_access.wildcard_flags_by_wildcard
	data["access_flag_names"] = SSid_access.access_flag_string_by_flag
	data["show_basic"] = TRUE
	data["templates"] = job_templates

	return data

/datum/computer_file/program/card_mod_tarkon/ui_data(mob/user)
	var/list/data = list()

	data["authed_user"] = authenticated_card

	var/obj/item/card/id/auth_id = computer.stored_id
	var/obj/item/card/id/modified_id = computer.alt_stored_id

	data["auth_card"] = auth_id ? get_id_ui_data(auth_id) : null
	data["modified_card"] = modified_id ? get_id_ui_data(modified_id) : null
	data["is_holding_id"] = isidcard(user.get_active_held_item())

	return data

/datum/computer_file/program/card_mod_tarkon/proc/get_id_ui_data(obj/item/card/id/card)
	var/list/data = list()

	var/datum/id_trim/card_trim = card.trim

	data["id_name"] = card.name
	data["id_rank"] = card.assignment || "Unassigned"
	data["id_owner"] = card.registered_name || "-----"
	data["access_on_card"] = card.access || list()
	data["wildcard_slots"] = card.wildcard_slots || list()
	data["id_age"] = card.registered_age

	data["has_trim"] = !!card_trim
	data["trim_assignment"] = card_trim?.assignment || ""
	data["trim_access"] = card_trim?.access || list()

	return data

/obj/item/disk/computer/tarkon/id
	name = "Tarkon data disk"
	desc = "Removable disk used to download apps."
	starting_programs = list(
		/datum/computer_file/program/card_mod_tarkon,
	)

/obj/machinery/modular_computer/preset/tarkon_command
	name = "Tarkon Command console"
	desc = "An old computer used for changing jobs."
	starting_programs = list(
		/datum/computer_file/program/card_mod_tarkon,
	)

/obj/machinery/modular_computer/preset/tarkon_command/Initialize(mapload)
	. = ..()
	cpu.device_theme = PDA_THEME_RETRO

/obj/machinery/pdapainter/tarkon
	special_painter = PDA_PAINTER_TARKON


