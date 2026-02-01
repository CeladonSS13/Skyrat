/datum/keybinding/emote
	category = CATEGORY_EMOTE
	weight = WEIGHT_EMOTE
	keybind_signal = COMSIG_KB_EMOTE
	var/emote_key

/datum/keybinding/emote/proc/link_to_emote(datum/emote/faketype)
	hotkey_keys = list("Unbound")
	classic_keys = list("Unbound")
	emote_key = initial(faketype.key)
	name = faketype.name // SS1984 EDIT, original: name = initial(faketype.key)
	if (!name) // SS1984 ADDITION
		name = emote_key // SS1984 ADDITION
	full_name = capitalize(name) // SS1984 EDIT, original: full_name = capitalize(initial(faketype.key))

/datum/keybinding/emote/down(client/user, turf/target, mousepos_x, mousepos_y)
	. = ..()
	if(.)
		return
	return user.mob.emote(emote_key, intentional=TRUE)
