/datum/quirk/item_quirk/immunodeficiency/is_species_appropriate(datum/species/mob_species)
	if(istype(mob_species, /datum/species/nucleation))
		return FALSE
	return ..()
