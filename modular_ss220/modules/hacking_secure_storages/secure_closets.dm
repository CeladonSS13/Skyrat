// !!! IMPORTANT !!!
// When changing anything in this file, also change it in modular_ss220\modules\hacking_secure_storages\secure.dm

/obj/structure/closet/secure_closet
	var/broken_lvl = 0

/obj/structure/closet/secure_closet/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	if (broken && broken_lvl > 0 && broken_lvl < 3 && !opened)
		balloon_alert(user, "Панель взломана!")
	return .

/obj/structure/closet/secure_closet/screwdriver_act(mob/living/user, obj/item/tool)
	. = ..()
	if (!broken && broken_lvl != 0) // extra check to fix broken_lvl in case it somehow not correct
		broken_lvl = 0
	if (!locked || broken_lvl != 0 || user.combat_mode)
		return .

	to_chat(user, "<span class='notice'>Вы начинаете откручивать панель замка [src]...</span>")
	if(tool.use_tool(src, user, SECURE_STORAGE_HACKING_DELAY, volume = SECURE_STORAGE_HACKING_VOLUME)) // stealth volume be like
		if(prob(SECURE_STORAGE_HACKING_SUCCESS_CHANCE_SCREW))
			to_chat(user, "<span class='notice'>Вы успешно открутили и сняли панель с замка [src]!</span>")
			desc += " Панель управления снята."
			broken_lvl = 1
			broken = TRUE
			update_appearance() // it have custom overlay when broken
		else
			var/obj/item/bodypart/affecting = user.get_active_hand()
			user.apply_damage(5, BRUTE, affecting)
			user.emote("scream")
			to_chat(user, "<span class='warning'>Проклятье! [tool] сорвалась и повредила [affecting.name]!</span>")
	return TRUE

/obj/structure/closet/secure_closet/wirecutter_act(mob/living/user, obj/item/tool)
	. = ..()
	if (!locked || broken_lvl != 1 || user.combat_mode || !broken) // should be broken by screwdriver act
		return .

	to_chat(user, "<span class='notice'>Вы начинаете подготавливать провода панели [src]...</span>")
	if(tool.use_tool(src, user, SECURE_STORAGE_HACKING_DELAY, volume = SECURE_STORAGE_HACKING_VOLUME))
		if(prob(SECURE_STORAGE_HACKING_SUCCESS_CHANCE_WIRE))
			to_chat(user, "<span class='notice'>Вы успешно подготовили провода панели замка [src]!</span>")
			desc += " Провода отключены и торчат наружу."
			broken_lvl = 2
		else
			to_chat(user, "<span class='warning'>Черт! Не тот провод!</span>")
			do_sparks(5, 1, src)
			electrocute_mob(user, get_area(src), src, 0.5, TRUE)
	return TRUE

/obj/structure/closet/secure_closet/multitool_act(mob/living/user, obj/item/tool)
	. = ..()
	if (!locked || broken_lvl != 2 || user.combat_mode || !broken)
		return .

	to_chat(user, "<span class='notice'>Вы начинаете подключать провода панели замка [src] к [tool]...</span>")
	if(tool.use_tool(src, user, SECURE_STORAGE_HACKING_DELAY, volume = SECURE_STORAGE_HACKING_VOLUME))
		if(prob(SECURE_STORAGE_HACKING_SUCCESS_CHANCE_MULTITOOL))
			desc += " Замок отключен."
			broken = FALSE // Set to make it be able to emagged
			broken_lvl = 3
			emag_act(user)
		else
			to_chat(user, "<span class='warning'>Черт! Не тот провод!</span>")
			do_sparks(5, 1, src)
			electrocute_mob(user, get_area(src), src, 0.5, TRUE)
	return TRUE
