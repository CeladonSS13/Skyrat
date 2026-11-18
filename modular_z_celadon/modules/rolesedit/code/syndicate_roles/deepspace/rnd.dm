//techweb
/datum/techweb/deepspace
	id = "SYNDICATE_AWAY"
	organization = "Syndicate"
	should_generate_points = TRUE

/datum/techweb/deepspace/New()
	. = ..()
	research_node_id(TECHWEB_NODE_SYNDICATE_BASIC, TRUE, TRUE, FALSE)

//server
/obj/machinery/rnd/server/deepspace
	name = "\improper Syndicate R&D Server"
	circuit = /obj/item/circuitboard/machine/rdserver/deepspace
	req_access = list(ACCESS_SYNDICATE_LEADER)

/obj/machinery/rnd/server/deepspace/Initialize(mapload)
	var/datum/techweb/tech_web = locate(/datum/techweb/deepspace) in SSresearch.techwebs
	stored_research = tech_web
	return ..()

/obj/machinery/rnd/server/deepspace/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	. = ..()

	if(held_item && istype(held_item, /obj/item/research_notes))
		context[SCREENTIP_CONTEXT_LMB] = "Generate research points"
		return CONTEXTUAL_SCREENTIP_SET

/obj/machinery/rnd/server/deepspace/examine(mob/user)
	. = ..()

	if(!in_range(user, src) && !isobserver(user))
		return

	. += span_notice("Insert [EXAMINE_HINT("Research Notes")] to generate points.")

/obj/machinery/rnd/server/deepspace/attackby(obj/item/attacking_item, mob/user, list/modifiers, list/attack_modifiers)
	if(istype(attacking_item, /obj/item/research_notes) && stored_research)
		var/obj/item/research_notes/research_notes = attacking_item
		stored_research.add_point_list(list(TECHWEB_POINT_TYPE_GENERIC = research_notes.value))
		playsound(src, 'sound/machines/copier.ogg', 50, TRUE)
		qdel(research_notes)
		return
	return ..()

/obj/item/circuitboard/machine/rdserver/deepspace
	name = "Syndicate R&D Server"
	build_path = /obj/machinery/rnd/server/deepspace

// techfab
/obj/item/circuitboard/machine/techfab/ds
	name = "\improper Techfab - Deepspace"
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/rnd/production/techfab/ds

/obj/machinery/rnd/production/techfab/ds
	name = "techfab (Deepspace)"
	desc = "An advanced fabricator designed to print out the latest prototypes and circuits researched from Science. Contains hardware to sync to research networks. This one is department-locked and only possesses a limited set of decryption keys."
	allowed_department_flags = DEPARTMENT_BITFLAG_SECURITY | DEPARTMENT_BITFLAG_SERVICE | DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SCIENCE
	allowed_buildtypes = PROTOLATHE | AWAY_LATHE | IMPRINTER | AWAY_IMPRINTER
	circuit = /obj/item/circuitboard/machine/techfab/ds
	stripe_color = "#96150b"
	payment_department = ACCOUNT_DS2
