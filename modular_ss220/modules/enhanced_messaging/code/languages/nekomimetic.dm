/datum/language/nekomimetic/New()
	. = ..()
	flags |= AVAILABLE_IN_TELECOMMS
	return .
