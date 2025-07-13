/datum/quirk/evil
	hidden_quirk = FALSE

/datum/quirk/foreigner
	hidden_quirk = FALSE

/datum/quirk/cursed
	name = "Cursed"
	desc = "You are cursed with bad luck. You are much more likely to suffer from accidents and mishaps. When it rains, it pours."
	icon = FA_ICON_CLOUD_SHOWERS_HEAVY
	value = -8
	mob_trait = TRAIT_CURSED
	gain_text = span_danger("You feel like you're going to have a bad day.")
	lose_text = span_notice("You feel like you're going to have a good day.")
	medical_record_text = "Patient is cursed with bad luck."
	hardcore_value = 8

/datum/quirk/cursed/add(client/client_source)
	quirk_holder.AddComponent(/datum/component/omen/quirk)

/datum/quirk/equipping/nerve_staple/is_species_appropriate(datum/species/mob_species)
	var/datum/species_traits = GLOB.species_prototypes[mob_species].inherent_traits
	if(TRAIT_SYNTHETIC in species_traits)
		return FALSE
	return ..()
