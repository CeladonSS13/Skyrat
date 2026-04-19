// Maybe in future nova will fix it, and this modular fix will not be required anymore (will we even notice it though?)

/obj/item/clothing/mask/balaclava/threehole
	var/open = 0 //0 = full, 1 = face only
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/mask/balaclava/threehole/attack_self(mob/user)
	adjust_mask(user)

/obj/item/clothing/mask/balaclava/threehole/proc/adjust_mask(mob/living/carbon/human/user)
	if(!istype(user))
		return
	if(!user.incapacitated)
		switch(open)
			if (0)
				flags_inv = HIDEHAIR
				icon_state = initial(icon_state) + "_up"
				to_chat(user, span_notice("You pull the balaclava away, revealing your face."))
				open = 1
				// Instead of drawing our own icon, using such tricky way to update icon visual only, while keeping "equipped" old icon
				user.update_clothing(slot_flags) // early update
				icon_state = initial(icon_state)
			else
				flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDEHAIR
				icon_state = initial(icon_state)
				to_chat(user, span_notice("You pull the balaclava up to cover your whole head."))
				open = 0
				user.update_clothing(slot_flags) // normal update
