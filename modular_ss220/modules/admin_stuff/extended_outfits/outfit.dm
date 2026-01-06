#define ADMIN_OUTFIT_TRAIT "admin_outfit_trait"

/datum/outfit
	/**
	  * list of traits that should be added once outfit is used, and removed once changed)
	  */
	var/list/traits_to_give = null

/datum/outfit/get_json_data()
	. = ..()
	.["traits_to_give"] = traits_to_give

/datum/outfit/copy_from(datum/outfit/target)
	. = ..()
	traits_to_give = target.traits_to_give

/datum/outfit/load_from(list/outfit_data)
	. = ..()
	var/list/traits = outfit_data["traits_to_give"]
	traits_to_give = traits // fine if null

/datum/outfit/equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	if(traits_to_give && islist(traits_to_add))
		user.add_traits(traits_to_add, ADMIN_OUTFIT_TRAIT)


