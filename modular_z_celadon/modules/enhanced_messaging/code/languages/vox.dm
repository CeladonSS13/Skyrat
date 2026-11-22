/datum/language/vox/New()
	. = ..()
	flags |= AVAILABLE_IN_TELECOMMS
	return .
