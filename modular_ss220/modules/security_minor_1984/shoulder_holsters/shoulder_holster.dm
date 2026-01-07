/obj/item/clothing/accessory/holster
	name = "shoulder holster (handgun)"
	desc = "A handgun holster."
	icon_state = "holster"
	inhand_icon_state = "holster"
	worn_icon_state = "holster"
	attachment_slot = CHEST
	var/list/holster_allow = list(/obj/item/gun)
	var/holster_allow_size = WEIGHT_CLASS_NORMAL
	var/obj/item/gun/holstered = null
	actions_types = list(/datum/action/item_action/accessory/holster)
	w_class = WEIGHT_CLASS_NORMAL // so it doesn't fit in pockets

/obj/item/clothing/accessory/holster/Destroy()
	if(holstered?.loc == src) // Gun still in the holster
		holstered.forceMove(loc)
	holstered = null
	return ..()

//subtypes can override this to specify what can be holstered
/obj/item/clothing/accessory/holster/proc/can_holster(obj/item/gun/W)
	if(W.w_class > holster_allow_size)
		return FALSE
	if(!is_type_in_list(W, holster_allow))
		return FALSE
	return TRUE

/obj/item/clothing/accessory/holster/proc/holster(obj/item/I, mob/living/carbon/human/user)
	if(holstered)
		to_chat(user, span_warning("There is already a [holstered] holstered here!"))
		return

	var/obj/item/gun/W = I
	if(!W)
		to_chat(user, span_warning("Only guns can be holstered!"))
		return

	if(!can_holster(W))
		to_chat(user, span_warning("This [W.name] won't fit in [src]!"))
		return

	if(!user.canUnEquip(W, 0))
		to_chat(user, span_warning("You can't let go of [W]!"))
		return

	holstered = W
	user.temporarilyRemoveItemFromInventory(holstered)
	holstered.forceMove(src)
	holstered.add_fingerprint(user)
	user.visible_message(span_notice("[user] holsters [holstered]."), span_notice("You holster [holstered]."))

/obj/item/clothing/accessory/holster/proc/unholster(mob/living/carbon/human/user)
	if(!holstered)
		return

	if(isobj(user.get_active_held_item()) && isobj(user.get_inactive_held_item()))
		to_chat(user, span_warning("You need an empty hand to draw [holstered]!"))
	else
		if(user.combat_mode)
			user.visible_message(span_warning("[user] draws [holstered], ready to shoot!"), \
			span_warning("You draw [holstered], ready to shoot!"))
		else
			user.visible_message(span_notice("[user] draws [holstered], pointing it at the ground."), \
			span_notice("You draw [holstered], pointing it at the ground."))
		user.put_in_hands(holstered)
		holstered.add_fingerprint(user)
		holstered = null

/obj/item/clothing/accessory/holster/emp_act(severity)
	if(holstered)
		holstered.emp_act(severity)
	..()

/obj/item/clothing/accessory/holster/examine(mob/user)
	. = ..()
	if(holstered)
		. += "A [holstered] is holstered here."
	else
		. += "It is empty."

/obj/item/clothing/accessory/holster/attack_self(mob/user, modifiers)
	var/mob/living/carbon/human/carbon_user = user
	if (carbon_user)
		handle_holster_usage(carbon_user)

/obj/item/clothing/accessory/holster/proc/handle_holster_usage(mob/living/carbon/human/user)
	if(user.stat > SOFT_CRIT || HAS_TRAIT(user, TRAIT_HANDS_BLOCKED) || !Adjacent(user))
		return
	if (user.IsParalyzed())
		return

	if(!holstered)
		var/obj/item/gun/gun_in_hand = user.get_active_held_item()
		if(!gun_in_hand)
			to_chat(user, span_warning("You need your gun equipped to holster it."))
			return
		holster(gun_in_hand, user)
	else
		unholster(user)

/obj/item/clothing/accessory/holster/can_attach_accessory(obj/item/clothing/under/attach_to, mob/living/user)
	. = ..()
	if (!.)
		return .
	if(locate(/obj/item/clothing/accessory/holster) in attach_to.attached_accessories)
		. = FALSE
		if(user)
			attach_to.balloon_alert(user, "can't store more than 1 holster!")
