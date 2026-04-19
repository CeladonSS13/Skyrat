//cybernetic stomach
/obj/item/organ/stomach/cybernetic/screwdriver_act(mob/living/user, obj/item/tool)
	if (cut_open_damage < 0)
		balloon_alert(user, "already cut open!")
		return ITEM_INTERACT_FAILURE

	balloon_alert(user, "opening hatch...")
	playsound(user, 'sound/items/tools/screwdriver_operating.ogg', 75)
	if (!tool.use_tool(src, user, 3 SECONDS))
		balloon_alert(user, "interrupted!")
		return ITEM_INTERACT_FAILURE

	playsound(user, 'sound/items/tools/screwdriver.ogg', 75)
	var/emptied = empty_contents()
	if (emptied > 0)
		playsound(get_turf(src), 'sound/effects/splat.ogg', 50)
	user.visible_message(span_warning("[user] opens [src] [emptied ? "!" : ", but it's empty."]"), span_notice("You opened [src] [emptied ? "." : ", but there's nothing inside."]"))
	cut_open_damage = 0
	return ITEM_INTERACT_SUCCESS

/obj/item/organ/stomach/cybernetic/crowbar_act(mob/living/user, obj/item/tool)
	if (cut_open_damage < 0)
		balloon_alert(user, "already cut open!")
		return ITEM_INTERACT_FAILURE

	balloon_alert(user, "opening hatch...")
	playsound(user, 'sound/items/tools/crowbar_prying.ogg', 75)
	if (!tool.use_tool(src, user, 3 SECONDS))
		balloon_alert(user, "interrupted!")
		return ITEM_INTERACT_FAILURE

	playsound(user, 'sound/items/tools/crowbar.ogg', 75)
	var/emptied = empty_contents()
	if (emptied > 0)
		playsound(get_turf(src), 'sound/effects/splat.ogg', 50)
	user.visible_message(span_warning("[user] pried open [src] [emptied ? "!" : ", but it's empty."]"), span_notice("You opened [src] [emptied ? "." : ", but there's nothing inside."]"))
	cut_open_damage += apply_organ_damage(maxHealth * 0.5)
	return ITEM_INTERACT_SUCCESS

/obj/item/organ/stomach/cybernetic/on_vomit(mob/living/carbon/vomiter, distance, force)
	empty_contents(chance = 70, damaging = TRUE, min_amount = (force ? 1 : 0))

/obj/item/organ/stomach/cybernetic/surplus/on_vomit(mob/living/carbon/vomiter, distance, force)
	empty_contents(chance = 100, damaging = TRUE, min_amount = 1)

/obj/item/organ/stomach/cybernetic/tier2/on_vomit(mob/living/carbon/vomiter, distance, force)
	empty_contents(chance = 40, damaging = TRUE, min_amount = (force ? 1 : 0))

/obj/item/organ/stomach/cybernetic/tier3/on_vomit(mob/living/carbon/vomiter, distance, force)
	empty_contents(chance = 10, damaging = TRUE, min_amount = 0)

/obj/item/organ/stomach/cybernetic/tier3/on_punched(datum/source, mob/living/carbon/human/attacker, damage, attack_type, obj/item/bodypart/affecting, final_armor_block, kicking, limb_sharpness)
	return

//synth "stomach"
/obj/item/organ/stomach/synth/screwdriver_act(mob/living/user, obj/item/tool)
	if (cut_open_damage < 0)
		balloon_alert(user, "already cut open!")
		return ITEM_INTERACT_FAILURE

	balloon_alert(user, "opening hatch...")
	playsound(user, 'sound/items/tools/screwdriver_operating.ogg', 75)
	if (!tool.use_tool(src, user, 3 SECONDS))
		balloon_alert(user, "interrupted!")
		return ITEM_INTERACT_FAILURE

	playsound(user, 'sound/items/tools/screwdriver.ogg', 75)
	var/emptied = empty_contents()
	if (emptied > 0)
		playsound(get_turf(src), 'sound/effects/splat.ogg', 50)
	user.visible_message(span_warning("[user] opens [src] [emptied ? "!" : ", but it's empty."]"), span_notice("You opened [src] [emptied ? "." : ", but there's nothing inside."]"))
	cut_open_damage = 0
	return ITEM_INTERACT_SUCCESS

/obj/item/organ/stomach/synth/crowbar_act(mob/living/user, obj/item/tool)
	if (cut_open_damage < 0)
		balloon_alert(user, "already cut open!")
		return ITEM_INTERACT_FAILURE

	balloon_alert(user, "opening hatch...")
	playsound(user, 'sound/items/tools/crowbar_prying.ogg', 75)
	if (!tool.use_tool(src, user, 3 SECONDS))
		balloon_alert(user, "interrupted!")
		return ITEM_INTERACT_FAILURE

	playsound(user, 'sound/items/tools/crowbar.ogg', 75)
	var/emptied = empty_contents()
	if (emptied > 0)
		playsound(get_turf(src), 'sound/effects/splat.ogg', 50)
	user.visible_message(span_warning("[user] pried open [src] [emptied ? "!" : ", but it's empty."]"), span_notice("You opened [src] [emptied ? "." : ", but there's nothing inside."]"))
	cut_open_damage += apply_organ_damage(maxHealth * 0.5)
	return ITEM_INTERACT_SUCCESS

/obj/item/organ/stomach/synth/on_vomit(mob/living/carbon/vomiter, distance, force)
	empty_contents(chance = 10, damaging = FALSE, min_amount = 0)

/obj/item/organ/stomach/synth/on_punched(datum/source, mob/living/carbon/human/attacker, damage, attack_type, obj/item/bodypart/affecting, final_armor_block, kicking, limb_sharpness)
	return
