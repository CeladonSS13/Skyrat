/datum/language/voltaic/New()
	. = ..()
	flags |= AVAILABLE_IN_TELECOMMS
	return .
