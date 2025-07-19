#define PATH_TO_WILDCARD_SETTING_CACHE "data/infinity_wildcard_override.json"

GLOBAL_VAR_INIT(SAVED_WILDCARD_SETTING_CACHE, FALSE)
GLOBAL_PROTECT(SAVED_WILDCARD_SETTING_CACHE)

/datum/secrets_menu/ui_data(mob/user)
	. = ..()
	var/data = .
	if (!data)
		data = list()

	data["is_pregame"] = SSticker?.current_state <= GAME_STATE_PREGAME
	if (SSticker?.current_state >= GAME_STATE_SETTING_UP)
		data["is_infinity_wildcard_disabled"] = GLOB.SAVED_WILDCARD_SETTING_CACHE
	else
		data["is_infinity_wildcard_disabled"] = GLOB.SAVED_WILDCARD_SETTING_CACHE || !CONFIG_GET(flag/infinite_access_slots)
	return data

/datum/secrets_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if (.)
		return
	if (action != "disable_infinity_wildcard" || GLOB.SAVED_WILDCARD_SETTING_CACHE)
		return
	if (!CONFIG_GET(flag/infinite_access_slots) && SSticker?.current_state <= GAME_STATE_PREGAME)
		return
	if(!check_rights(R_ADMIN))
		return
	var/game_state_pregame = SSticker?.current_state <= GAME_STATE_PREGAME
	if (game_state_pregame) // for this round, still applicable
		CONFIG_SET(flag/infinite_access_slots, FALSE)
		var/msg_constructed = "[key_name(holder)] disabled infinity wildcard access slots for this round"
		message_admins(msg_constructed)
		log_admin(msg_constructed)
		return
	GLOB.SAVED_WILDCARD_SETTING_CACHE = TRUE // save for correct checks and avoid for excess i/o
	var/msg_constructed_next = "[key_name(holder)] disabled infinity wildcard access slots for next round"
	message_admins(msg_constructed_next)
	log_admin(msg_constructed_next)
	// save for next round
	var/list/json_value = list()
	json_value = list(
		"disable_infinity_wildcard" = TRUE,
	)
	// If the file isn't removed text2file will just append.
	if(fexists(PATH_TO_WILDCARD_SETTING_CACHE))
		fdel(PATH_TO_WILDCARD_SETTING_CACHE)
	text2file(json_encode(json_value), PATH_TO_WILDCARD_SETTING_CACHE)
