/datum/species/nucleation
	name = "\improper Nucleation"
	id = SPECIES_NUCLEATION
	species_language_holder = /datum/language_holder/human_basic

	inherent_traits = list(
		TRAIT_NOBREATH,
		TRAIT_OXYIMMUNE,
		TRAIT_RADIMMUNE,
		TRAIT_ANALGESIA, // AKA no pain
		TRAIT_NOBLOOD,
		TRAIT_SHAVED,
		TRAIT_VIRUSIMMUNE,
	)

	blood_deficiency_drain_rate = 0
	payday_modifier = 1.0
	changesource_flags = MIRROR_BADMIN | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN

	mutantbrain = /obj/item/organ/brain/nucleationcrystal
	mutanteyes = /obj/item/organ/eyes/luminescent_crystal
	mutantheart = /obj/item/organ/heart/strange_crystal

	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/nucleation,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/nucleation,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/nucleation,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/nucleation,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/nucleation,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/nucleation,
	)

	var/obj/effect/dummy/lighting_obj/nucleation_light

/datum/species/nucleation/on_species_gain(mob/living/carbon/human/new_nucleation, datum/species/old_species, pref_load, regenerate_icons)
	. = ..()

	// signals

	RegisterSignal(new_nucleation, COMSIG_LIVING_DEATH, PROC_REF(handle_death))

	// lightning

	nucleation_light = new_nucleation.mob_light(light_type = /obj/effect/dummy/lighting_obj/moblight/species)
	refresh_light_color(new_nucleation)

	// bodypart stuff

	for(var/obj/item/bodypart/limb as anything in new_nucleation.bodyparts)
		if(limb.limb_id == SPECIES_NUCLEATION)
			limb.update_limb(is_creating = TRUE)

	// rest

	new_nucleation.physiology.burn_mod *= 4
	new_nucleation.physiology.brute_mod *= 2

	return .

/datum/species/nucleation/spec_life(mob/living/carbon/human/human)
	. = ..()

	if(human.stat == SOFT_CRIT || human.stat == HARD_CRIT)
		if(prob(10))
			painful_scream(TRUE) // damage is done at code\modules\mob\living\carbon\human\_species.dm

/datum/species/nucleation/on_species_loss(mob/living/carbon/human/former_nucleation, datum/species/new_species, pref_load)
	UnregisterSignal(former_nucleation, list(
		COMSIG_LIVING_DEATH,
	))
	QDEL_NULL(nucleation_light)

	former_nucleation.physiology.burn_mod |= 4
	former_nucleation.physiology.brute_mod |= 2

	return ..()


/datum/species/nucleation/Destroy(force)
	QDEL_NULL(nucleation_light)
	return ..()

/datum/species/nucleation/proc/refresh_light_color(mob/living/carbon/human/nucleation)
	if(isnull(nucleation_light))
		return
	if(nucleation.stat != DEAD)
		nucleation_light.set_light_range_power_color(2, 1, "#1C1C00")
		nucleation_light.set_light_on(TRUE)

/datum/species/nucleation/proc/handle_death()
	SIGNAL_HANDLER
	var/turf/T = get_turf(src)
	var/mob/living/carbon/human/nucleation = src
	if (!isnucleation(nucleation))
		log_runtime("Tried to handle non-nucleation death as it was nucleation for [src] with type [src.type]! Will not explode it")
		return
	nucleation.visible_message(span_warning("[nucleation]'s body explodes, leaving behind a pile of microscopic crystals!"))
	explosion(T, devastation_range = 0, heavy_impact_range = 0, light_impact_range = 2, flame_range = 0, flash_range = 2, cause = "Nucleation death") // Create a small explosion burst upon death
	qdel(nucleation)

/datum/species/nucleation/get_physical_attributes()
	return "The supermatter crystals produce oxygen, \
		negating the need for the individual to breathe. Their massive change in biology, however, renders most medicines \
		obselete. Ionizing radiation seems to cause resonance in some of their crystals, which seems to encourage regeneration \
		and produces a calming effect on the individual."

/datum/species/nucleation/get_species_description()
	return "A sub-race of unfortunates who have been exposed to too much supermatter radiation. As a result, \
		supermatter crystal clusters have begun to grow across their bodies."

/datum/species/nucleation/get_species_lore()
	return list(
		"Research to find a cure for this ailment has been slow, and so this is a common fate for veteran engineers. \
		Nucleations are highly stigmatized, and are treated much in the same way as lepers were back on Earth",
	)

/datum/species/nucleation/prepare_human_for_preview(mob/living/carbon/human/human)
	human.set_hairstyle("Nucleation Crystals", update = TRUE)

/datum/species/nucleation/create_pref_damage_perks()
	. = ..()
	var/list/to_add = .
	if (!base_perks)
		return .

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
		SPECIES_PERK_ICON = "band-aid",
		SPECIES_PERK_NAME = "High Brutal Weakness",
		SPECIES_PERK_DESC = "[plural_form] receive 2x brute damage.",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
		SPECIES_PERK_ICON = "burn",
		SPECIES_PERK_NAME = "Extreme Burn Weakness",
		SPECIES_PERK_DESC = "[plural_form] receive 4x burn damage.",
	))

	if(TRAIT_ANALGESIA in inherent_traits)
		to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = FA_ICON_STAR_OF_LIFE,
			SPECIES_PERK_NAME = "No Pain",
			SPECIES_PERK_DESC = "[plural_form] does not feel pain at all.",
		))
	// TODO: rad immune, virus immune...

// Sounds are basically copy-paste from human sounds

/datum/species/nucleation/get_scream_sound(mob/living/carbon/human/human)
	if(human.physique == MALE)
		if(prob(1))
			return 'sound/mobs/humanoids/human/scream/wilhelm_scream.ogg'
		return pick(
			'sound/mobs/humanoids/human/scream/malescream_1.ogg',
			'sound/mobs/humanoids/human/scream/malescream_2.ogg',
			'sound/mobs/humanoids/human/scream/malescream_3.ogg',
			'sound/mobs/humanoids/human/scream/malescream_4.ogg',
			'sound/mobs/humanoids/human/scream/malescream_5.ogg',
			'sound/mobs/humanoids/human/scream/malescream_6.ogg',
		)

	return pick(
		'sound/mobs/humanoids/human/scream/femalescream_1.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_2.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_3.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_4.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_5.ogg',
	)

/datum/species/nucleation/get_cough_sound(mob/living/carbon/human/human)
	if(human.gender == FEMALE) // NOVA EDIT CHANGE - ORIGINAL: if(human.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cough/female_cough1.ogg',
			'sound/mobs/humanoids/human/cough/female_cough2.ogg',
			'sound/mobs/humanoids/human/cough/female_cough3.ogg',
			'sound/mobs/humanoids/human/cough/female_cough4.ogg',
			'sound/mobs/humanoids/human/cough/female_cough5.ogg',
			'sound/mobs/humanoids/human/cough/female_cough6.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cough/male_cough1.ogg',
		'sound/mobs/humanoids/human/cough/male_cough2.ogg',
		'sound/mobs/humanoids/human/cough/male_cough3.ogg',
		'sound/mobs/humanoids/human/cough/male_cough4.ogg',
		'sound/mobs/humanoids/human/cough/male_cough5.ogg',
		'sound/mobs/humanoids/human/cough/male_cough6.ogg',
	)

/datum/species/nucleation/get_cry_sound(mob/living/carbon/human/human)
	if(human.gender == FEMALE) // NOVA EDIT CHANGE - ORIGINAL: if(human.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cry/female_cry1.ogg',
			'sound/mobs/humanoids/human/cry/female_cry2.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cry/male_cry1.ogg',
		'sound/mobs/humanoids/human/cry/male_cry2.ogg',
		'sound/mobs/humanoids/human/cry/male_cry3.ogg',
	)


/datum/species/nucleation/get_sneeze_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sneeze/female_sneeze1.ogg'
	return 'sound/mobs/humanoids/human/sneeze/male_sneeze1.ogg'

/datum/species/nucleation/get_laugh_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return 'sound/mobs/humanoids/human/laugh/womanlaugh.ogg'
	return pick(
		'sound/mobs/humanoids/human/laugh/manlaugh1.ogg',
		'sound/mobs/humanoids/human/laugh/manlaugh2.ogg',
	)

/datum/species/nucleation/get_sigh_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return SFX_FEMALE_SIGH
	return SFX_MALE_SIGH

/datum/species/nucleation/get_sniff_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sniff/female_sniff.ogg'
	return 'sound/mobs/humanoids/human/sniff/male_sniff.ogg'

/datum/species/nucleation/get_snore_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return SFX_SNORE_FEMALE
	return SFX_SNORE_MALE

/datum/species/nucleation/get_hiss_sound(mob/living/carbon/human/human)
	return 'sound/mobs/humanoids/human/hiss/human_hiss.ogg'
