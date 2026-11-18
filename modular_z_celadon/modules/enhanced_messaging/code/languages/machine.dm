/datum/language/machine/New()
	. = ..()
	flags |= AVAILABLE_IN_TELECOMMS
	return .
