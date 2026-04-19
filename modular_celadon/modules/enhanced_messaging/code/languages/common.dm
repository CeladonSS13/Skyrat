/datum/language/common/New()
	. = ..()
	flags |= AVAILABLE_IN_TELECOMMS
	return .
