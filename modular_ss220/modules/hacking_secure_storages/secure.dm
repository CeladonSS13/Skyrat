// !!! IMPORTANT !!!
// When changing anything in this file, also change it in modular_ss220\modules\hacking_secure_storages\secure_closets.dm

// SO it's exactly same code as secure_closets, but all references to closet/secure_closet replaced by closet/crate/secure
// Theoretically realization could be moved to separate file, but what we would do with var/broken_lvl then?
// Imagine if DM had abstractions like interfaces... My eyes as C# coder hurt here
// Alternative is adding var/broken_lvl to /obj/structure/closet, but this gonna increase memory usage for no reason by adding fields to all closets even non-secure
// Also then not really sure what to do with "locked" var
// This code doesn't look very good because it's doubling already existing, yet at least it working pretty good
/obj/structure/closet/crate/secure
	var/broken_lvl = 0
	var/allow_hack = TRUE

/obj/structure/closet/crate/secure/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	if (broken && broken_lvl > 0 && broken_lvl < 3 && !opened)
		balloon_alert(user, "Панель взломана!")
	return .

/obj/structure/closet/crate/secure/screwdriver_act(mob/living/user, obj/item/tool)
	. = ..()
	if (!broken && broken_lvl != 0) // extra check to fix broken_lvl in case it somehow not correct
		broken_lvl = 0
	if (!locked || broken_lvl != 0 || user.combat_mode)
		return .
	if (!allow_hack)
		balloon_alert(user, "Панель не откручивается!")
		return .

	to_chat(user, "<span class='notice'>Вы начинаете откручивать панель замка [src]...</span>")
	if(tool.use_tool(src, user, SECURE_STORAGE_HACKING_DELAY, volume = SECURE_STORAGE_HACKING_VOLUME)) // stealth volume be like
		if(prob(SECURE_STORAGE_HACKING_SUCCESS_CHANCE_SCREW))
			to_chat(user, "<span class='notice'>Вы успешно открутили и сняли панель с замка [src]!</span>")
			desc += " Панель управления снята."
			broken_lvl = 1
			broken = TRUE
			update_overlays() // it have custom overlay when broken
		else
			var/obj/item/bodypart/affecting = user.get_active_hand()
			user.apply_damage(5, BRUTE, affecting)
			user.emote("scream")
			to_chat(user, "<span class='warning'>Проклятье! [tool] сорвалась и повредила [affecting.name]!</span>")
	return TRUE

/obj/structure/closet/crate/secure/wirecutter_act(mob/living/user, obj/item/tool)
	. = ..()
	if (!locked || broken_lvl != 1 || user.combat_mode || !broken || !allow_hack) // should be broken by screwdriver act
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

/obj/structure/closet/crate/secure/multitool_act(mob/living/user, obj/item/tool)
	. = ..()
	if (!locked || broken_lvl != 2 || user.combat_mode || !broken || !allow_hack)
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
