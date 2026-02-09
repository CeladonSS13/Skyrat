/datum/language/draconic/New()
	. = ..()
	flags |= AVAILABLE_IN_TELECOMMS
	return .
