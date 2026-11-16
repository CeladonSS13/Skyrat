/datum/outfit
	var/has_any_movement_trait = FALSE

/datum/outfit/get_json_data()
	. = ..()
	.["_status_traits"] = _status_traits
	.["has_any_movement_trait"] = has_any_movement_trait

/datum/outfit/copy_from(datum/outfit/target)
	. = ..()
	_status_traits = target._status_traits
	has_any_movement_trait = target.has_any_movement_trait

/datum/outfit/load_from(list/outfit_data)
	. = ..()
	var/list/traits = outfit_data["_status_traits"]
	_status_traits = traits // fine if null
	has_any_movement_trait = outfit_data["has_any_movement_trait"]

/datum/outfit/equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()

	// remove all outfit traits
	REMOVE_TRAITS_IN(user, ADMIN_OUTFIT_TRAIT)
	user.movement_type = initial(user.movement_type) // reset movement, we don't know old outfit though

	// apply outfit traits
	if(_status_traits && islist(_status_traits))
		if (has_any_movement_trait)
			user.AddElement(/datum/element/movetype_handler)
		user.add_traits(_status_traits, ADMIN_OUTFIT_TRAIT)
