/obj/item/blood_worm_mutator
	name = "ominous injector"
	desc = "A strange needle-like injector device with a strange substance inside it.  It's probably very painful to use it."
	icon = 'icons/obj/antags/blood_worm.dmi'
	icon_state = "tester"

	inhand_icon_state = "blood_worm_tester"
	lefthand_file = 'icons/mob/inhands/equipment/security_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/security_righthand.dmi'

	special_desc_requirement = EXAMINE_CHECK_SYNDICATE
	special_desc = "An parasite mutator, compresses user's mind into blood worm form, do not use on public to prevent detection."

	w_class = WEIGHT_CLASS_SMALL
	var/spent = FALSE
	//admin var, able to turn to TRUE for no blood species worms, changeling worms and etc.
	var/no_check = FALSE
	//should synthetics (race with "blood"-oil) use this or not, doesn't do anything if no_check enabled
	var/synthetic_allowed = FALSE
	VAR_PROTECTED/in_use = FALSE

/obj/item/blood_worm_mutator/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)
	update_appearance(UPDATE_ICON_STATE | UPDATE_DESC)

/obj/item/blood_worm_mutator/update_icon_state()
	icon_state = spent ? "tester_spent" : "tester"
	inhand_icon_state = spent ? "blood_worm_tester_spent" : "blood_worm_tester"
	return ..()

/obj/item/blood_worm_mutator/update_desc(updates)
	desc = "[initial(desc)] [spent ? "This one is spent." : "It's loaded for a single use."]"
	return ..()

/obj/item/blood_worm_mutator/proc/try_wormification(mob/living/user)
	if(!user)
		return FALSE
	spent = TRUE
	in_use = FALSE
	update_appearance(UPDATE_ICON_STATE | UPDATE_DESC)
	log_combat(user, user, "wormified", src)
	var/mob/living/basic/blood_worm/hatchling/uplink/new_worm = new(get_turf(user.loc))
	user.death(FALSE)
	user.reagents.add_reagent(/datum/reagent/toxin/formaldehyde, 5)
	user.mind.transfer_to(new_worm, force_key_move = TRUE)
	to_chat(new_worm, span_userdanger("You are still yourself and keep your mind, if you weren't an antagonist before, you don't become one after using this device."))
	return TRUE

/obj/item/blood_worm_mutator/attack_self(mob/living/user)
	if(!user)
		return FALSE
	if(spent)
		user.balloon_alert(user, "already spent!")
		return FALSE
	if(in_use)
		return FALSE
	if (!ishuman(user))
		user.balloon_alert(user, "not human!")
		return FALSE
	if(HAS_TRAIT(user, TRAIT_BLOOD_WORM_HOST))
		user.balloon_alert(user, "already mutated!")
		return FALSE
	if(!no_check)
		if(!CAN_HAVE_BLOOD(user))
			user.balloon_alert(user, "Blood not detected!")
			return FALSE
		if(IS_CHANGELING(user))
			user.balloon_alert(user, "DNA is not suitable!")
			return FALSE
		if(isjellyperson(user))
			user.balloon_alert(user, "DNA is not suitable!")
			return FALSE
		if(!synthetic_allowed && issynthetic(user))
			user.balloon_alert(user, "DNA is not suitable!")
			return FALSE
	if (!user.try_inject(user, injection_flags = INJECT_TRY_SHOW_ERROR_MESSAGE))
		return FALSE
	in_use = TRUE
	user.painful_scream()
	user.visible_message(span_warning("[user] jabbed himself with [src]."), span_warning("You jabbed yourself with [src] and begin injection."))
	playsound(src, 'sound/items/hypospray.ogg', vol = 50, vary = TRUE)
	if(!do_after(user, 15 SECONDS, src))
		user.balloon_alert(user, "interrupted!")
		playsound(src, 'sound/machines/buzz/buzz-two.ogg', vol = 40, vary = TRUE)
		in_use = FALSE
		return FALSE
	user.apply_damage(rand(10, 15), BRUTE, def_zone = check_zone(user.zone_selected), wound_bonus = CANT_WOUND, attack_direction = get_dir(user, user), attacking_item = src)
	return try_wormification(user)
