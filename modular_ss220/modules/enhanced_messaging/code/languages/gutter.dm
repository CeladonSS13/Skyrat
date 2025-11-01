/datum/language/gutter/New()
	. = ..()
	flags |= AVAILABLE_IN_TELECOMMS
	return .
