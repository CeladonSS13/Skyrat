/datum/quirk/item_quirk/breather/is_species_appropriate(datum/species/mob_species)
	if(ispath(mob_species, /datum/species/nucleation))
		return FALSE
	return ..()
