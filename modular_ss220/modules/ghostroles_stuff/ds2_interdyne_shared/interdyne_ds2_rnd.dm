/obj/machinery/rnd/server/interdyne_ds2
	name = "\improper Syndicate R&D Server"
	circuit = /obj/item/circuitboard/machine/rdserver/interdyne_ds2
	req_access = list(ACCESS_SYNDICATE_LEADER)

/obj/machinery/rnd/server/interdyne_ds2/Initialize(mapload)
	var/datum/techweb/tech_web = locate(/datum/techweb/interdyne_ds2) in SSresearch.techwebs
	stored_research = tech_web
	return ..()

/obj/machinery/rnd/server/interdyne_ds2/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	. = ..()

	if(held_item && istype(held_item, /obj/item/research_notes))
		context[SCREENTIP_CONTEXT_LMB] = "Generate research points"
		return CONTEXTUAL_SCREENTIP_SET

/obj/machinery/rnd/server/interdyne_ds2/examine(mob/user)
	. = ..()

	if(!in_range(user, src) && !isobserver(user))
		return

	. += span_notice("Insert [EXAMINE_HINT("Research Notes")] to generate points.")

/obj/machinery/rnd/server/interdyne_ds2/attackby(obj/item/attacking_item, mob/user, list/modifiers, list/attack_modifiers)
	if(istype(attacking_item, /obj/item/research_notes) && stored_research)
		var/obj/item/research_notes/research_notes = attacking_item
		stored_research.add_point_list(list(TECHWEB_POINT_TYPE_GENERIC = research_notes.value))
		playsound(src, 'sound/machines/copier.ogg', 50, TRUE)
		qdel(research_notes)
		return
	return ..()
