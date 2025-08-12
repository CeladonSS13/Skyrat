/datum/action/cooldown/spell
	/// Which spell_handler is used in addition to the normal spells behaviour, can be null. Set this in create_new_handler if needed
	var/datum/spell_handler/custom_handler
	/// List with the handler datums per spell type. Key = src.type, value = the handler datum created by create_new_handler()
	var/static/list/spell_handlers = list()

/**
 * Creates and returns the handler datum for this spell type.
 * Override this if you want a custom spell handler.
 * Should return a value of type [/datum/spell_handler] or NONE
 */
/datum/action/cooldown/spell/proc/create_new_handler()
	RETURN_TYPE(/datum/spell_handler)
	return NONE
