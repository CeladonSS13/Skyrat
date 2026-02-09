/mob/living/carbon/human/species/lizard/ashwalker/hostile
	var/datum/outfit/outfit
	var/list/traits_to_add = list(TRAIT_NOHUNGER)
	faction = list(FACTION_MINING, FACTION_MINING_FAUNA, FACTION_ASHWALKER, NEST_FACTION)
	combat_mode = TRUE

/mob/living/carbon/human/species/lizard/ashwalker/hostile/Initialize(mapload)
	. = ..()

	if(outfit)
		equipOutfit(outfit)
	if (traits_to_add && islist(traits_to_add))
		add_traits(traits_to_add, INNATE_TRAIT)
	faction?.Remove(FACTION_NEUTRAL)

	return .

/mob/living/carbon/human/species/lizard/ashwalker/hostile/melee
	ai_controller = /datum/ai_controller/monkey/hostile_melee1984
	outfit = /datum/outfit/ashwalker/spear/double

/mob/living/carbon/human/species/lizard/ashwalker/hostile/ranged
	ai_controller = /datum/ai_controller/monkey/hostile_ranged1984
	outfit = /datum/outfit/ashwalker/bow

