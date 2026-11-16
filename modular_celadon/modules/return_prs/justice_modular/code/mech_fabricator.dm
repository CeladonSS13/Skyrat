/obj/machinery/mecha_part_fabricator
	/// Local designs that only this mechfab have(using when mechfab emaged so it's illegal designs).
	var/list/datum/design/illegal_local_designs

/obj/machinery/mecha_part_fabricator/Initialize(mapload)
	illegal_local_designs = list()
	return ..()

/obj/machinery/mecha_part_fabricator/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(obj_flags & EMAGGED)
		return FALSE
	if(!HAS_TRAIT(user, TRAIT_KNOW_ROBO_WIRES))
		to_chat(user, span_warning("You're unsure about [emag_card ? "where to swipe [emag_card] over" : "how to override"] [src] for any effect. Maybe if you had more knowledge of robotics..."))

		return FALSE
	obj_flags |= EMAGGED
	for(var/found_illegal_mech_nods in SSresearch.techweb_nodes)
		var/datum/techweb_node/illegal_mech_node = SSresearch.techweb_nodes[found_illegal_mech_nods]
		if(!illegal_mech_node?.illegal_mech_node)
			continue
		for(var/id in illegal_mech_node.design_ids)
			var/datum/design/illegal_mech_design = SSresearch.techweb_design_by_id(id)
			illegal_local_designs |= illegal_mech_design
			cached_designs |= illegal_mech_design
	say("R$c!i&ed ERROR de#i$ns. C@n%ec$%ng to ~NULL~ se%ve$s.")
	playsound(src, 'sound/machines/uplink/uplinkerror.ogg', 50, TRUE)
	update_static_data_for_all_viewers()
	return TRUE
