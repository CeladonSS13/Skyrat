/datum/controller/subsystem/id_access/Initialize()
	. = ..() //lets load it first for extra i/o safety in case of runtime later
	if(!fexists(PATH_TO_WILDCARD_SETTING_CACHE))
		return .

	var/json = file(PATH_TO_WILDCARD_SETTING_CACHE)
	if(!json)
		return .

	json = file2text(json)
	if(!json)
		return .

	json = json_decode(json)
	if(!json)
		return .

	if (json["disable_infinity_wildcard"])
		CONFIG_SET(flag/infinite_access_slots, FALSE)
		log_world("flag infinite_access_slots set to FALSE by cached [PATH_TO_WILDCARD_SETTING_CACHE] file")
		var/msg_constructed = "infinity wildcard access slots was disabled for this round (by admin at last round)"
		message_admins(msg_constructed)
		log_admin(msg_constructed)

	fdel(PATH_TO_WILDCARD_SETTING_CACHE)
	return .
