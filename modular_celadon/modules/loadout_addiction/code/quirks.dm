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

/datum/quirk/hydraulicleak
	name = "Hydraulic Leak"
	desc = "Your body's hydraulic fluids are leaking through their seals."
	icon = FA_ICON_TINT
	value = -8
	gain_text = span_danger("You feel your oil slowly disappearing.")
	lose_text = span_notice("You feel your oil no longer disappearing.")
	medical_record_text = "Patient requires regular treatment for hydraulic fluid loss."
	hardcore_value = 8
	mail_goodies = list(/obj/item/reagent_containers/blood/oil)
	/// Minimum amount of oil the paint is set to
	var/min_blood = BLOOD_VOLUME_SURVIVE + 5 // just barely survivable without fuel

/datum/quirk/hydraulicleak/add(client/client_source)
	RegisterSignal(quirk_holder, COMSIG_HUMAN_ON_HANDLE_BLOOD, PROC_REF(lose_oil))

/datum/quirk/hydraulicleak/remove()
	UnregisterSignal(quirk_holder, list(COMSIG_HUMAN_ON_HANDLE_BLOOD))

/datum/quirk/hydraulicleak/is_species_appropriate(datum/species/mob_species)
	var/datum/species_traits = GLOB.species_prototypes[mob_species].inherent_traits
	if(TRAIT_SYNTHETIC in species_traits)
		return ..()
	return FALSE

/datum/quirk/hydraulicleak/proc/lose_oil(datum/source, seconds_per_tick, times_fired)
	SIGNAL_HANDLER

	var/mob/living/carbon/human/human_holder = quirk_holder
	if(human_holder.stat == DEAD || human_holder.blood_volume <= min_blood)
		return

	human_holder.blood_volume = max(min_blood, human_holder.blood_volume - human_holder.dna.species.blood_deficiency_drain_rate * seconds_per_tick)
