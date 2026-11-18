/datum/language/uncommon/New()
	. = ..()
	flags |= AVAILABLE_IN_TELECOMMS
	return .
