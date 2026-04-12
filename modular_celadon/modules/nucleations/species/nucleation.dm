#define NUCLEATION_BURN_MOD 4
#define NUCLEATION_BRUTE_MOD 2

/datum/species/nucleation
	name = "\improper Nucleation"
	id = SPECIES_NUCLEATION
	species_language_holder = /datum/language_holder/human_basic

	inherent_traits = list(
		TRAIT_NOBREATH,
		TRAIT_OXYIMMUNE,
		TRAIT_RADIMMUNE,
		TRAIT_ANALGESIA, // AKA no pain pt1
		TRAIT_NO_DAMAGE_OVERLAY, // AKA no pain pt2
		TRAIT_NOBLOOD,
		TRAIT_VIRUSIMMUNE,
		TRAIT_NO_DAMAGE_SLOWDOWN, // AKA no pain pt3, custom trait
	)

	blood_deficiency_drain_rate = 0
	payday_modifier = 1.0
	changesource_flags = MIRROR_BADMIN | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN

	mutantbrain = /obj/item/organ/brain/nucleationcrystal
	mutanteyes = /obj/item/organ/eyes/luminescent_crystal
	mutantheart = /obj/item/organ/heart/strange_crystal

	lore_protected = TRUE

	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/nucleation,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/nucleation,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/nucleation,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/nucleation,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/nucleation,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/nucleation,
	)

	var/obj/effect/dummy/lighting_obj/nucleation_light
	var/former_hardcrit_threshold

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

	// crit stuff

	former_hardcrit_threshold = new_nucleation.hardcrit_threshold
	new_nucleation.hardcrit_threshold = HEALTH_THRESHOLD_CRIT

	// rest

	new_nucleation.physiology.burn_mod *= NUCLEATION_BURN_MOD
	new_nucleation.physiology.brute_mod *= NUCLEATION_BRUTE_MOD

	return .

/datum/species/nucleation/on_species_loss(mob/living/carbon/human/former_nucleation, datum/species/new_species, pref_load)
	UnregisterSignal(former_nucleation, list(
		COMSIG_LIVING_DEATH,
	))
	QDEL_NULL(nucleation_light)

	former_nucleation.physiology.burn_mod /= NUCLEATION_BURN_MOD
	former_nucleation.physiology.brute_mod /= NUCLEATION_BRUTE_MOD

	former_nucleation.hardcrit_threshold = former_hardcrit_threshold ? former_hardcrit_threshold : HEALTH_THRESHOLD_FULLCRIT
	former_hardcrit_threshold = null

	if(former_nucleation.health > former_nucleation.hardcrit_threshold)
		REMOVE_TRAIT(former_nucleation, TRAIT_KNOCKEDOUT, CRIT_HEALTH_TRAIT)

	former_nucleation.updatehealth()

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

/datum/species/nucleation/proc/handle_death(datum/source)
	SIGNAL_HANDLER

	var/mob/living/carbon/human/nucleation = source
	if (!isnucleation(nucleation))
		log_runtime("Tried to handle nucleation death from non-nucleation source [source] with type [source.type]! Will not explode it. Dead nucleation???")
		return

	var/turf/T = get_turf(nucleation)
	nucleation.visible_message(span_warning("[nucleation]'s body explodes, leaving behind a pile of microscopic crystals!"))
	nucleation.ghostize(FALSE) //So we don't throw an alert for deleting a mob with a key inside. Also allows to hear explosion properly

	explosion(T, devastation_range = 0, heavy_impact_range = 0, light_impact_range = 2, flame_range = 0, flash_range = 2) // Create a small explosion burst upon death
	qdel(nucleation) // qdel should go last
	// THERE most likely will be runtimes, since qdel is not instant, this one are 100% safe to ignore in this case, otherwise rewrite how qdel works
	// code/modules/mob/living/carbon/carbon.dm, line 431: Cannot read null.max_damage
	// code/modules/mob/living/carbon/damage_procs.dm, line 23: list index out of bounds
	// code/_onclick/item_attack.dm, line 399: list index out of bounds
	// code/modules/forensics/_forensics.dm, line 140: Cannot read null.unique_identity
	// ... and perhaps some other runtimes would be caused by that qdel, yet they not break anything since we qdel it anyway

/datum/species/nucleation/get_physical_attributes()
	return "The supermatter crystals produce oxygen, \
		negating the need for the individual to breathe. Their massive change in biology, however, renders most medicines \
		obselete. Ionizing radiation seems to cause resonance in some of their crystals, which seems to encourage regeneration \
		and produces a calming effect on the individual."

/datum/species/nucleation/get_species_description()
	return "A human sub-race of unfortunates who have been exposed to too much supermatter radiation. As a result, \
		supermatter crystal clusters have begun to grow across their bodies."

/datum/species/nucleation/get_species_lore()
	return list(
		"Research to find a cure for this ailment has been slow, and so this is a common fate for veteran engineers. \
		Nucleations are highly stigmatized, and are treated much in the same way as lepers were back on Earth",
	)

/// OK for those who came after, and who still can save 3+ hours of their lives trying to debug why things are not working:
/// If you think this thing is not working/never invoked
/// You need to manually delete "cache" folder (at root of repository, where .dmb and all that stuff are stored)
/// Most likely it tied to smart caching, that COULD be enabled locally, in case you use config_server (which have it enabled)
/// Once that done, it should correctly invoke this
/// If you see troubles on server, but not locally: then you probably need to notify host about it
/// Or if you have sufficient rights, probably can invoke something like that (try from TOP to BOTTOM, skip other steps if succesful)
/// "Clear Legacy Asset Cache", that is a verb in Debug
/// "Clear Smart Asset Cache", that is a verb in Debug
/// /datum/asset/spritesheet_batched/proc/realize_spritesheets(yield), not sure about this one though
/datum/species/nucleation/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	human_for_preview.set_haircolor(COLOR_YELLOW, update = FALSE)
	human_for_preview.set_hairstyle("Nucleation Crystals", update = TRUE)

/datum/species/nucleation/get_default_mutant_bodyparts()
	// basically copy-paste for humans in modular_nova\modules\customization\modules\mob\living\carbon\human\species.dm
	return list(
		"ears" = list("None", FALSE),
		"tail" = list("None", FALSE),
		"wings" = list("None", FALSE),
		"legs" = list("Normal Legs", FALSE),
	)

/datum/species/nucleation/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
		SPECIES_PERK_ICON = FA_ICON_SKULL,
		SPECIES_PERK_NAME = "Permament Death",
		SPECIES_PERK_DESC = "[plural_form] death is permament, they cause small explosion on death, which is also destroys all items with them.",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
		SPECIES_PERK_ICON = FA_ICON_SQUARE_XMARK,
		SPECIES_PERK_NAME = "No Soft Crit",
		SPECIES_PERK_DESC = "[plural_form] does not have softcrit, they instantly fall into hardcrit instead.",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
		SPECIES_PERK_ICON = FA_ICON_STAR_OF_LIFE,
		SPECIES_PERK_NAME = "No Pain",
		SPECIES_PERK_DESC = "[plural_form] does not feel pain at all.",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
		SPECIES_PERK_ICON = FA_ICON_LIGHTBULB,
		SPECIES_PERK_NAME = "Glowing",
		SPECIES_PERK_DESC = "[plural_form] glowing slighty, that's easy to notice in darkness.",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
		SPECIES_PERK_ICON = FA_ICON_BOTTLE_DROPLET,
		SPECIES_PERK_NAME = "Radium Healing",
		SPECIES_PERK_DESC = "Radium heal [plural_form] from 3 burn and 3 brute damage per second.",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
		SPECIES_PERK_ICON = FA_ICON_EYE,
		SPECIES_PERK_NAME = "Luminescent eyes",
		SPECIES_PERK_DESC = "[plural_form] eyes can see just a little bit better in darkness.",
	))

	return to_add

/datum/species/nucleation/create_pref_damage_perks()
	. = ..()
	var/list/to_add = .
	if (!to_add)
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

	return to_add

// Sounds are basically copy-paste from human sounds, but we don't want a nucleation derive from human though (they have their own perks and some other stuff, especially ishuman check)

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

#undef NUCLEATION_BURN_MOD
#undef NUCLEATION_BRUTE_MOD
