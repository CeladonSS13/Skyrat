GLOBAL_LIST_EMPTY(no_readmin_list)
GLOBAL_PROTECT(no_readmin_list)

//readmin bypass rank
/datum/player_rank_controller/no_readmin
	rank_title = "no_readmin"

/datum/player_rank_controller/no_readmin/New()
	. = ..()
	legacy_file_path = "[global.config.directory]/celadon/no_readmin_players.txt"

/datum/player_rank_controller/no_readmin/add_player(ckey)
	if(IsAdminAdvancedProcCall())
		return

	ckey = ckey(ckey)

	GLOB.no_readmin_list[ckey] = TRUE

/datum/player_rank_controller/no_readmin/remove_player(ckey)
	if(IsAdminAdvancedProcCall())
		return

	GLOB.no_readmin_list -= ckey

/datum/player_rank_controller/no_readmin/get_ckeys_for_legacy_save()
	if(IsAdminAdvancedProcCall())
		return

	return GLOB.no_readmin_list

/datum/player_rank_controller/no_readmin/should_use_legacy_system()
	return CONFIG_GET(flag/no_readmin_legacy_system)

/datum/player_rank_controller/no_readmin/clear_existing_rank_data()
	if(IsAdminAdvancedProcCall())
		return

	GLOB.no_readmin_list = list()

//controller proc
/datum/controller/subsystem/player_ranks/proc/is_no_readmin(client/user, admin_bypass = FALSE)
	if(!istype(user))
		CRASH("Invalid user type provided to is_no_readmin(), expected 'client' and obtained '[user ? user.type : "null"]'.")

	if(GLOB.no_readmin_list[user.ckey])
		return TRUE
	var/is_admin = check_rights_for(user, R_PERMISSIONS)
	if(admin_bypass && is_admin)
		return FALSE

	return FALSE

/datum/controller/subsystem/player_ranks/proc/load_no_readmin()
	PROTECTED_PROC(TRUE)

	if(IsAdminAdvancedProcCall())
		return

	no_readmin_controller = new

	if(CONFIG_GET(flag/no_readmin_legacy_system))
		no_readmin_controller.load_legacy()
		return

	if(!SSdbcore.Connect())
		var/message = "Failed to connect to database in load_no_readmin(). Reverting to legacy system."
		log_config(message)
		log_game(message)
		message_admins(message)
		CONFIG_SET(flag/no_readmin_legacy_system, TRUE)
		no_readmin_controller.load_legacy()
		return

	load_player_rank_sql(no_readmin_controller)

/datum/config_entry/flag/no_readmin_legacy_system
	protection = CONFIG_ENTRY_LOCKED

/datum/controller/subsystem/player_ranks
	/// The Celadon Readmin Bypass player rank controller.
	var/datum/player_rank_controller/no_readmin/no_readmin_controller
