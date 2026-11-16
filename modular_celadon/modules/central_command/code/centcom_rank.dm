GLOBAL_LIST_EMPTY(centcom_list)
GLOBAL_PROTECT(centcom_list)

#define CELADON_PLAYER_RANKS list("Centcom", "No Readmin")

ADMIN_VERB(manage_centcom_jobs, R_PERMISSIONS, "Manage Celadon Ranks", "Manage who has the special player ranks while the server is running.", ADMIN_CATEGORY_MAIN)
	usr.client?.holder.manage_centcom_jobs()

/// Proc for admins to change people's "player" ranks (centcom, Evenetologist no readmin, etc.)
/datum/admins/proc/manage_centcom_jobs()
	if(IsAdminAdvancedProcCall())
		return

	if(!check_rights(R_PERMISSIONS))
		return

	var/choice = tgui_alert(usr, "Which rank would you like to manage?", "Manage Player Ranks", CELADON_PLAYER_RANKS)
	if(!choice || !(choice in CELADON_PLAYER_RANKS))
		return

	manage_celadon_rank_in_group(choice)

/datum/admins/proc/manage_celadon_rank_in_group(group)
	PROTECTED_PROC(TRUE)

	if(IsAdminAdvancedProcCall())
		return

	if(!(group in CELADON_PLAYER_RANKS))
		CRASH("[key_name(usr)] attempted to add someone to an invalid \"[group]\" group.")

	var/group_title = LOWER_TEXT(replacetext(group, " ", "_"))

	var/list/choices = list("Add", "Remove")
	switch(tgui_alert(usr, "What would you like to do?", "Manage [group]s", choices))
		if("Add")
			var/name = input(usr, "Please enter the CKEY (case-insensitive) of the person you would like to make a [group]:", "Add a [group]") as null|text
			if(!name)
				return

			var/player_to_be = ckey(name)
			if(!player_to_be)
				to_chat(usr, span_warning("\"[name]\" is not a valid CKEY."))
				return

			var/success = SSplayer_ranks.add_player_to_group(usr.client, player_to_be, group_title)

			if(!success)
				return

			message_admins("[key_name(usr)] has granted [group] status to [player_to_be].")
			log_admin_private("[key_name(usr)] has granted [group] status to [player_to_be].")


		if("Remove")
			var/name = input(usr, "Please enter the CKEY (case-insensitive) of the person you would like to no longer be a [group]:", "Remove a [group]") as null|text
			if(!name)
				return

			var/player_that_was = ckey(name)
			if(!player_that_was)
				to_chat(usr, span_warning("\"[name]\" is not a valid CKEY."))
				return

			var/success = SSplayer_ranks.remove_player_from_group(usr.client, player_that_was, group_title)

			if(!success)
				return

			message_admins("[key_name(usr)] has revoked [group] status from [player_that_was].")
			log_admin_private("[key_name(usr)] has revoked [group] status from [player_that_was].")

		else
			return

#undef CELADON_PLAYER_RANKS

//centcom rank
/datum/player_rank_controller/centcom
	rank_title = "centcom"

/datum/player_rank_controller/centcom/New()
	. = ..()
	legacy_file_path = "[global.config.directory]/celadon/centcom_players.txt"

/datum/player_rank_controller/centcom/add_player(ckey)
	if(IsAdminAdvancedProcCall())
		return

	ckey = ckey(ckey)

	GLOB.centcom_list[ckey] = TRUE

/datum/player_rank_controller/centcom/remove_player(ckey)
	if(IsAdminAdvancedProcCall())
		return

	GLOB.centcom_list -= ckey

/datum/player_rank_controller/centcom/get_ckeys_for_legacy_save()
	if(IsAdminAdvancedProcCall())
		return

	return GLOB.centcom_list

/datum/player_rank_controller/centcom/should_use_legacy_system()
	return CONFIG_GET(flag/centcom_legacy_system)

/datum/player_rank_controller/centcom/clear_existing_rank_data()
	if(IsAdminAdvancedProcCall())
		return

	GLOB.centcom_list = list()

//controller proc
/datum/controller/subsystem/player_ranks/proc/is_centcom(client/user, admin_bypass = TRUE)
	if(!istype(user))
		CRASH("Invalid user type provided to is_centcom(), expected 'client' and obtained '[user ? user.type : "null"]'.")

	if(GLOB.centcom_list[user.ckey])
		return TRUE
	var/is_admin = check_rights_for(user, R_SPAWN)
	if(admin_bypass && is_admin)
		return TRUE

	return FALSE

/datum/controller/subsystem/player_ranks/proc/load_centcom()
	PROTECTED_PROC(TRUE)

	if(IsAdminAdvancedProcCall())
		return

	centcom_controller = new

	if(CONFIG_GET(flag/centcom_legacy_system))
		centcom_controller.load_legacy()
		return

	if(!SSdbcore.Connect())
		var/message = "Failed to connect to database in load_centcom(). Reverting to legacy system."
		log_config(message)
		log_game(message)
		message_admins(message)
		CONFIG_SET(flag/centcom_legacy_system, TRUE)
		centcom_controller.load_legacy()
		return

	load_player_rank_sql(centcom_controller)

/datum/config_entry/flag/centcom_legacy_system
	protection = CONFIG_ENTRY_LOCKED

/datum/controller/subsystem/player_ranks
	/// The Celadon Centcom player rank controller.
	var/datum/player_rank_controller/centcom/centcom_controller
