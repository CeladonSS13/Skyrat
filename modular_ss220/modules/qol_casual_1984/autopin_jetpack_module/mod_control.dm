/obj/item/mod/control/pre_equipped/install(obj/item/mod/module/new_module, mob/user)
	. = ..()
	if (!(new_module in modules)) // failed to add
		return .
	if (!new_module || !new_module.auto_pin || !user)
		return .
	if (!(new_module.type in default_pins))
		default_pins[new_module.type] = list() // add to default pins. Note that it's type adding here, not wearer ref!
	// ok now try to pin, if can do so
	if (wearer != user || !wearer)
		return . // not wearing, no need to pin right now
	if(REF(wearer) in default_pins[new_module.type]) //if we already had pinned once to this user
		return .
	// looks like we can pin
	default_pins[new_module.type] += REF(wearer)
	new_module.pin(user)
	return .
