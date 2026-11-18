/datum/language/moffic/New()
	. = ..()
	flags |= AVAILABLE_IN_TELECOMMS
	return .
