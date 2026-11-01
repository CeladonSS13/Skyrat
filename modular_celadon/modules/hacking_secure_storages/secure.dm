/datum/component/hackable_panel
	var/broken_lvl = 0
	var/obj/structure/closet/closet

/datum/component/hackable_panel/Initialize()
	if(!istype(parent, /obj/structure/closet))
		return COMPONENT_INCOMPATIBLE
	closet = parent
	RegisterSignal(closet, COMSIG_ATOM_TOOL_ACT(TOOL_SCREWDRIVER), PROC_REF(on_screwdriver_act))
	RegisterSignal(closet, COMSIG_ATOM_TOOL_ACT(TOOL_WIRECUTTER), PROC_REF(on_wirecutter_act))
	RegisterSignal(closet, COMSIG_ATOM_TOOL_ACT(TOOL_MULTITOOL), PROC_REF(on_multitool_act))
	RegisterSignal(closet, COMSIG_ATOM_ATTACK_HAND, PROC_REF(on_attack_hand))
	RegisterSignal(closet, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine))

/datum/component/hackable_panel/UnregisterFromParent()
	UnregisterSignal(closet, list(
		COMSIG_ATOM_TOOL_ACT(TOOL_SCREWDRIVER),
		COMSIG_ATOM_TOOL_ACT(TOOL_WIRECUTTER),
		COMSIG_ATOM_TOOL_ACT(TOOL_MULTITOOL),
		COMSIG_ATOM_ATTACK_HAND,
		COMSIG_ATOM_EXAMINE
	))

/datum/component/hackable_panel/proc/on_attack_hand(datum/source, mob/living/user, list/modifiers)
	SIGNAL_HANDLER

	if(closet.broken && broken_lvl > 0 && broken_lvl < 3 && closet.locked)
		closet.balloon_alert(user, "Панель взломана!")
		return COMPONENT_CANCEL_ATTACK_CHAIN

/datum/component/hackable_panel/proc/on_screwdriver_act(datum/source, mob/living/user, obj/item/tool)
	SIGNAL_HANDLER

	if(!closet.locked || user.combat_mode)
		return

	if(broken_lvl != 0 && !closet.broken)
		broken_lvl = 0

	if(broken_lvl > 0)
		return

	to_chat(user, span_notice("Вы начинаете откручивать панель замка [closet]..."))
	if(tool.use_tool(closet, user, SECURE_STORAGE_HACKING_DELAY, volume = SECURE_STORAGE_HACKING_VOLUME))
		if(prob(SECURE_STORAGE_HACKING_SUCCESS_CHANCE_SCREW))
			to_chat(user, span_notice("Вы успешно открутили и сняли панель с замка [closet]!"))
			broken_lvl = 1
			closet.broken = TRUE
			closet.update_overlays()
			closet.update_appearance()
		else
			var/obj/item/bodypart/affecting = user.get_active_hand()
			user.apply_damage(5, BRUTE, affecting)
			user.emote("scream")
			to_chat(user, span_warning("Проклятье! [tool] сорвалась и повредила [affecting.name]!"))
	return ITEM_INTERACT_BLOCKING

/datum/component/hackable_panel/proc/on_wirecutter_act(datum/source, mob/living/user, obj/item/tool)
	SIGNAL_HANDLER
	if(!closet.locked || broken_lvl != 1 || user.combat_mode || !closet.broken)
		return

	to_chat(user, span_notice("Вы начинаете подготавливать провода панели [closet]..."))
	if(tool.use_tool(closet, user, SECURE_STORAGE_HACKING_DELAY, volume = SECURE_STORAGE_HACKING_VOLUME))
		if(prob(SECURE_STORAGE_HACKING_SUCCESS_CHANCE_WIRE))
			to_chat(user, span_notice("Вы успешно подготовили провода панели замка [closet]!"))
			broken_lvl = 2
		else
			to_chat(user, span_warning("Черт! Не тот провод!"))
			do_sparks(5, 1, closet)
			electrocute_mob(user, get_area(closet), closet, 0.5, TRUE)
	return ITEM_INTERACT_BLOCKING

/datum/component/hackable_panel/proc/on_multitool_act(datum/source, mob/living/user, obj/item/tool)
	SIGNAL_HANDLER
	if(!closet.locked || broken_lvl != 2 || user.combat_mode || !closet.broken)
		return

	to_chat(user, span_notice("Вы начинаете подключать провода панели замка [closet] к [tool]..."))
	if(tool.use_tool(closet, user, SECURE_STORAGE_HACKING_DELAY, volume = SECURE_STORAGE_HACKING_VOLUME))
		if(prob(SECURE_STORAGE_HACKING_SUCCESS_CHANCE_MULTITOOL))
			closet.broken = FALSE
			broken_lvl = 3
			closet.emag_act(user)
		else
			to_chat(user, span_warning("Черт! Не тот провод!"))
			do_sparks(5, 1, closet)
			electrocute_mob(user, get_area(closet), closet, 0.5, TRUE)
	return ITEM_INTERACT_BLOCKING

/datum/component/hackable_panel/proc/on_examine(datum/source, mob/user, list/examine_list)
	SIGNAL_HANDLER
	switch(broken_lvl)
		if(1)
			examine_list += span_notice("Панель управления снята.")
		if(2)
			examine_list += span_notice("Панель управления снята, провода отключены и торчат наружу.")
		if(3)
			examine_list += span_notice("Панель управления снята, провода отключены, замок отключён.")

//closet
/obj/structure/closet
	var/hackable = TRUE

/obj/structure/closet/Initialize(mapload)
	. = ..()
	refresh_hackable_panel()

/obj/structure/closet/proc/refresh_hackable_panel()
	var/datum/component/hackable_panel/existing = GetComponent(/datum/component/hackable_panel)
	if(secure && !existing && hackable)
		AddComponent(/datum/component/hackable_panel)
	else if(existing && !secure)
		qdel(existing)

/obj/structure/closet/crate/secure/loot
	hackable = FALSE
