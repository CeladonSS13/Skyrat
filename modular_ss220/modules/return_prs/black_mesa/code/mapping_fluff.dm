/obj/structure/alien/weeds/xen
	name = "xen weeds"
	desc = "A thick vine-like surface covers the floor."
	color = "#ac3b06"

/obj/structure/spacevine/xen
	name = "xen vines"
	color = "#ac3b06"

/obj/structure/spacevine/xen/Initialize(mapload)
	. = ..()
	add_atom_colour("#ac3b06", FIXED_COLOUR_PRIORITY)

/obj/structure/spacevine/xen/thick
	name = "thick xen vines"
	color = "#ac3b06"
	opacity = TRUE

/obj/structure/mineral_door/xen
	name = "organic door"
	color = "#ff8d58"
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/xen_door.dmi'
	icon_state = "resin"
	openSound = 'modular_ss220/modules/return_prs/black_mesa/sound/xen_door.ogg'
	closeSound = 'modular_ss220/modules/return_prs/black_mesa/sound/xen_door.ogg'

/obj/machinery/door/puzzle/keycard/xen
	name = "locktight organic door"
	desc = "An oddly robust organic looking door."
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/xen_door.dmi'
	icon_state = "resin"
	puzzle_id = "xen"

/obj/item/keycard/xen
	name = "xen keycard"
	desc = "A xen keycard."
	color = "#ac3b06"
	puzzle_id = "xen"

/obj/machinery/conveyor/inverted/auto
	processing_flags = START_PROCESSING_ON_INIT

/obj/machinery/conveyor/inverted/auto/Initialize(mapload, newdir)
	. = ..()
	set_operating(TRUE)

/obj/machinery/conveyor/inverted/auto/update()
	. = ..()
	if(.)
		set_operating(TRUE)

/obj/structure/marker_beacon/green
	picked_color = "Lime"
	// set icon_state to make it clear for mappers
	icon_state = "markerlime-on"

/obj/structure/pod
	name = "supply pod"
	desc = "Someone must have sent this a long way."
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/structures.dmi'
	icon_state = "pod"
	pixel_x = SUPPLYPOD_X_OFFSET
	anchored = TRUE

/obj/structure/closet/secure_closet/security/black_mesa
	req_access = list(ACCESS_AWAY_SEC)

/obj/item/serviette
	name = "serviette"
	desc = "To clean."
	icon_state = "serviette_clean"
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/misc/serviette.dmi'
	/// How much time it takes to clean something using it
	var/cleanspeed = 5 SECONDS
	/// Which item spawns after it's used
	var/used_serviette = /obj/item/serviette_used
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON

/obj/item/serviette_used
	name = "dirty serviette"
	desc = "Throw it in the trash!"
	icon_state = "serviette_dirty"
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/misc/serviette.dmi'
	w_class = WEIGHT_CLASS_TINY

/obj/item/serviette/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(!check_allowed_items(interacting_with))
		return NONE
	var/clean_speedies = 1 * cleanspeed
	if(user.mind)
		clean_speedies = cleanspeed * min(user.mind.get_skill_modifier(/datum/skill/cleaning, SKILL_SPEED_MODIFIER)+0.1, 1) //less scaling for soapies

	if((interacting_with in user?.client.screen) && !user.is_holding(interacting_with))
		to_chat(user, span_warning("You need to take \the [interacting_with.name] off before cleaning it!"))

	else if(istype(interacting_with, /obj/effect/decal/cleanable))
		user.visible_message(span_notice("[user] begins to clean \the [interacting_with.name] out with [src]."), span_warning("You begin to clean \the [interacting_with.name] out with [src]..."))
		if(do_after(user, clean_speedies, target = interacting_with))
			to_chat(user, span_notice("You clean \the [interacting_with.name] out."))
			var/obj/effect/decal/cleanable/cleanies = interacting_with
			user.mind?.adjust_experience(/datum/skill/cleaning, max(round(cleanies.beauty/CLEAN_SKILL_BEAUTY_ADJUSTMENT), 0)) //again, intentional that this does NOT round but mops do.
			qdel(interacting_with)
			qdel(src)
			var/obj/item/serviette_used/used_cloth = new used_serviette
			remove_item_from_storage(user)
			user.put_in_hands(used_cloth)

	else if(istype(interacting_with, /obj/structure/window))
		user.visible_message(span_notice("[user] begins to clean \the [interacting_with.name] with [src]..."), span_notice("You begin to clean \the [interacting_with.name] with [src]..."))
		if(do_after(user, clean_speedies, target = interacting_with))
			to_chat(user, span_notice("You clean \the [interacting_with.name]."))
			interacting_with.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
			interacting_with.set_opacity(initial(interacting_with.opacity))
			user.mind?.adjust_experience(/datum/skill/cleaning, CLEAN_SKILL_GENERIC_WASH_XP)
			qdel(src)
			var/obj/item/serviette_used/used_cloth = new used_serviette
			remove_item_from_storage(user)
			user.put_in_hands(used_cloth)

	else
		user.visible_message(span_notice("[user] begins to clean \the [interacting_with.name] with [src]..."), span_notice("You begin to clean \the [interacting_with.name] with [src]..."))
		if(do_after(user, clean_speedies, target = interacting_with))
			to_chat(user, span_notice("You clean \the [interacting_with.name]."))
			if(user && isturf(interacting_with))
				for(var/obj/effect/decal/cleanable/cleanable_decal in interacting_with)
					user.mind?.adjust_experience(/datum/skill/cleaning, round(cleanable_decal.beauty / CLEAN_SKILL_BEAUTY_ADJUSTMENT))
			interacting_with.wash(CLEAN_SCRUB)
			interacting_with.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
			user.mind?.adjust_experience(/datum/skill/cleaning, CLEAN_SKILL_GENERIC_WASH_XP)
			qdel(src)
			var/obj/item/serviette_used/used_cloth = new used_serviette
			remove_item_from_storage(user)
			user.put_in_hands(used_cloth)
	return ITEM_INTERACT_SUCCESS

/obj/item/serviette_pack
	name = "pack of serviettes"
	desc = "pack of serviettes"
	icon_state = "serviettepack_4"
	base_icon_state = "serviettepack"
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/misc/serviette.dmi'
	/// A count of how many serviettes are left in the pack
	var/number_remaining = 4
	w_class = WEIGHT_CLASS_SMALL

/obj/item/serviette_pack/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]_[number_remaining]"

/obj/item/serviette_pack/Initialize(mapload)
	. = ..()
	update_icon_state()
	update_icon()

/obj/item/serviette_pack/attack_self(mob/user)
	if(number_remaining)
		to_chat(user, span_notice("You take a serviette from [src]."))
		number_remaining--
		var/obj/item/serviette/used_serviette = new /obj/item/serviette
		user.put_in_hands(used_serviette)
		update_icon()
		update_icon_state()
	else
		to_chat(user, span_notice("There are no serviettes left!"))
