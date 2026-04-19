/datum/species/create_pref_damage_perks()
	. = ..()
	var/list/to_add = .
	if (!to_add)
		return .

	if(TRAIT_RADIMMUNE in inherent_traits)
		to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = FA_ICON_CIRCLE_RADIATION,
			SPECIES_PERK_NAME = "Radiation Immune",
			SPECIES_PERK_DESC = "[plural_form] immune to all radiation.",
		))

	if(TRAIT_VIRUSIMMUNE in inherent_traits)
		to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = FA_ICON_VIRUS_SLASH,
			SPECIES_PERK_NAME = "Virus Immune",
			SPECIES_PERK_DESC = "[plural_form] immune to viruses.",
		))

	return to_add
