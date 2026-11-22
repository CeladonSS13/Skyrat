/datum/component/gun_safety
	safety_currently_on = FALSE

//config for removing safety after init
/datum/config_entry/flag/gun_safety_disabled

/datum/component/gun_safety/Initialize(forced = FALSE)
	. = ..()

	if(!forced && CONFIG_GET(flag/gun_safety_disabled))
		return COMPONENT_REDUNDANT
