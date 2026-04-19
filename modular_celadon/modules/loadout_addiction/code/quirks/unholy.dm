
/**
 * Chapel Weakness element
 *
 * A mob with this element will be penalized for entering the chapel.
 *
 * Contains the following:
 * * Enter and leave warning messages
 * * Ticking disgust and stamina penalty
 * * Chance to spontaneously combust
 */
/datum/element/chapel_weakness
	element_flags = ELEMENT_BESPOKE | ELEMENT_DETACH_ON_HOST_DESTROY
	argument_hash_start_idx = 2

/datum/element/chapel_weakness/Attach(datum/target)
	. = ..()

	// Check for living target
	if (!isliving(target))
		return ELEMENT_INCOMPATIBLE

	// Register area change signals
	RegisterSignal(target, COMSIG_ENTER_AREA, PROC_REF(on_entered))
	RegisterSignal(target, COMSIG_EXIT_AREA, PROC_REF(on_exited))

/datum/element/chapel_weakness/Detach(datum/source)
	. = ..()

	// Unregister area change signals
	UnregisterSignal(source, COMSIG_ENTER_AREA)
	UnregisterSignal(source, COMSIG_EXIT_AREA)

	// Define living mob
	var/mob/living/source_living = source

	// Remove status effect
	source_living?.remove_status_effect(/datum/status_effect/chapel_weakness)

/// Applied upon entering a new area
/datum/element/chapel_weakness/proc/on_entered(mob/living/mob_source, area/new_area)
	SIGNAL_HANDLER

	// Check for valid mob
	if(!mob_source)
		return

	// Check if this is the chapel
	if(!istype(new_area, /area/station/service/chapel))
		return

	// Add status effect
	mob_source.apply_status_effect(/datum/status_effect/chapel_weakness)

/// Applied upon exiting an area
/datum/element/chapel_weakness/proc/on_exited(mob/living/mob_source, area/old_area)
	SIGNAL_HANDLER

	// Check for valid mob
	if(!mob_source)
		return

	// Check if the departed area is the chapel
	if(!istype(old_area, /area/station/service/chapel))
		return

	// Check if the new area is also the chapel
	if(istype(get_area(mob_source), /area/station/service/chapel))
		return

	// Remove status effect
	mob_source.remove_status_effect(/datum/status_effect/chapel_weakness)

// Status effect for Chapel Weakness that applies locational penalties
/datum/status_effect/chapel_weakness
	id = "chapel_weakness_profane"
	status_type = STATUS_EFFECT_REFRESH
	alert_type = /atom/movable/screen/alert/status_effect/chapel_weakness_profane
	processing_speed = STATUS_EFFECT_NORMAL_PROCESS
	/// Percentage chance of burning each tick while in the chapel
	var/ignite_chance = 10
	/// Amount of fire stacks to add when igniting
	var/firestacks_amt = 2
	/// Amount of disgust added per tick
	var/disgust_amt = 3
	/// Amount of stamina loss applied per tick
	var/stanmloss_amt = 2.5
	// Phrase said to the holder when entering the chapel
	var/phrase_enter = "The darkness around you has begun to dissipate. Divine punishment is trying to punish you for your sins!"
	// Phrase said to the holder when exiting the chapel
	var/phrase_exit = "The darkness has enveloped you again. Divine punishment ceases to expel your sins."
	// Phrase said to the holder when ignited by the chapel
	var/phrase_ignite = "You feel like the dark forces are no longer hiding you from the righteous gaze. You are catching fire with sacred fire!"

// Status effect alert
/atom/movable/screen/alert/status_effect/chapel_weakness_profane
	name = "Sacred Ground"
	desc = "The area you are currently within is protected by a holy force."
	icon_state = "terrified"
	alerttooltipstyle = "cult"

// Called when adding this status effect
/datum/status_effect/chapel_weakness/on_apply()
	. = ..()

	// Warn user
	to_chat(owner, span_cult(phrase_enter))

// Called when removing this status effect
/datum/status_effect/chapel_weakness/on_remove()
	. = ..()

	// Alert user
	to_chat(owner, span_cult(phrase_exit))

// Processing for status effect
/datum/status_effect/chapel_weakness/tick(seconds_between_ticks)
	// Define if owner is alive
	var/owner_alive = (owner.stat != DEAD)

	// Check if alive
	if(owner_alive)
		// Add disgust
		owner.adjust_disgust(disgust_amt)

		// Inflict stamina damage
		owner.adjust_stamina_loss(stanmloss_amt)

	// Chance to spontaneously combust
	if(prob(ignite_chance))
		// Check if alive
		if(owner_alive)
			// Warn user
			to_chat(owner, span_cult_bold(phrase_ignite))

		// Ignite mob
		owner.adjust_fire_stacks(firestacks_amt)
		owner.ignite_mob()

// Set status examine text
/datum/status_effect/chapel_weakness/get_examine_text()
	return span_notice("[owner.p_They()] [owner.p_are()] visibly disturbed by something about this room.")

///quirk start
/datum/quirk/unholy
	name = "Unholy"
	desc = "There is an unholy burden on your soul. Avoid coming into contact with Holy Water or church, but hell or unholy water even good.."
	value = 0
	gain_text = span_notice("The unholy power begins to accumulate in your soul.")
	lose_text = span_notice("You feel the weight of the unholy power in your soul finally gone.")
	medical_record_text = "Patient suffers from an unknown type of aversion to holy reagents. Keep them away from chaplains or church."
	mob_trait = TRAIT_UNHOLY
	hardcore_value = 0
	icon = FA_ICON_FIRE_FLAME_CURVED
	mail_goodies = list (
		// This may be the only way to get Hell Water.
		/obj/item/reagent_containers/cup/glass/bottle/holywater/hell = 1
	)

/datum/quirk/unholy/add(client/client_source)
	// Add penalties
	quirk_holder.AddElementTrait(TRAIT_CHAPEL_WEAKNESS, TRAIT_UNHOLY, /datum/element/chapel_weakness)

/datum/quirk/unholy/remove()
	// Remove penalties
	REMOVE_TRAIT(quirk_holder, TRAIT_CHAPEL_WEAKNESS, TRAIT_UNHOLY)


//hellwater override
/datum/reagent/hellwater/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	if(HAS_TRAIT(affected_mob, TRAIT_UNHOLY))
		var/need_mob_update
		need_mob_update = affected_mob.adjust_tox_loss(-0.25*seconds_per_tick, updating_health = FALSE)
		need_mob_update += affected_mob.adjust_brute_loss(-0.25*seconds_per_tick, updating_health = FALSE)
		need_mob_update += affected_mob.adjust_fire_loss(-0.25*seconds_per_tick, updating_health = FALSE)
		need_mob_update += affected_mob.adjust_disgust(-2)
		need_mob_update += affected_mob.adjust_nutrition(0.5)
		need_mob_update += affected_mob.adjust_stamina_loss(-0.5)
		affected_mob.adjust_organ_loss(ORGAN_SLOT_BRAIN, -0.5*seconds_per_tick, required_organ_flag = affected_organ_flags)
		if(HAS_TRAIT(affected_mob, TRAIT_EVIL)) //bonus heal for someone who also evil
			need_mob_update += affected_mob.adjust_brute_loss(-0.25*seconds_per_tick, updating_health = FALSE)
			need_mob_update += affected_mob.adjust_fire_loss(-0.25*seconds_per_tick, updating_health = FALSE)
		if(holder)
			holder.remove_reagent(type, 0.5 * seconds_per_tick)
		if(need_mob_update)
			return UPDATE_MOB_HEALTH
		return
	. = ..()

//holywater override
/datum/reagent/water/holywater/on_mob_add(mob/living/affected_mob, amount)
	. = ..()
	if((HAS_TRAIT(affected_mob, TRAIT_EVIL)) || (HAS_TRAIT(affected_mob, TRAIT_UNHOLY)))
		to_chat(affected_mob, span_cult("A searing agony pierces your black soul as the holy power begins to burn you from within. You hear the distant screams of your own soul as the light begin to tear through the darkness you carry!"))
