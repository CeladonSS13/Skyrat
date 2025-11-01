/obj/machinery/announcement_system/ui_interact(mob/user, datum/tgui/ui)
	if(nttc && length(nttc.valid_languages) == 1)
		nttc.update_languages()
	return ..()
