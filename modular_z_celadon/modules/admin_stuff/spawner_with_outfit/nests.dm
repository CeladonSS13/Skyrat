/obj/structure/mob_spawner/with_outfit
	///equips spawned mobs with an outfit.
	var/datum/outfit/outfit
	var/list/traits_to_add

/obj/structure/mob_spawner/with_outfit/spawn_mob()
	. = ..()

	var/mob/living/carbon/human/spawned_human = .

	if (!spawned_human)
		return .

	if(outfit)
		spawned_human.equipOutfit(outfit)
	if (traits_to_add && islist(traits_to_add))
		spawned_human.add_traits(traits_to_add, INNATE_TRAIT)
	return .
