/datum/language/slime/New()
	. = ..()
	flags |= AVAILABLE_IN_TELECOMMS
	return .
