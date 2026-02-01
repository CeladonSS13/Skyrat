/obj/machinery/computer/cargo/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("company_import_window")
			var/datum/component/armament/company_imports/company_import_component = GetComponent(/datum/component/armament/company_imports)
			company_import_component.ui_interact(usr)
			. = TRUE
	if(.)
		post_signal(cargo_shuttle)

/obj/machinery/computer/cargo/Initialize(mapload)


	. = ..()
	AddComponent(/datum/component/armament/company_imports, subtypesof(/datum/armament_entry/company_import), 0)

/obj/machinery/computer/cargo/express/ghost
	var/static/list/allowed_categories = list(
		FRONTIER_EQUIPMENT_NAME_1984,
		DEFOREST_MEDICAL_NAME_1984,
		BLACKSTEEL_FOUNDATION_NAME_1984,
		KAHRAMAN_INDUSTRIES_NAME_1984,
		MICROSTAR_ENERGY_NAME_1984,
		NAKAMURA_ENGINEERING_MODSUITS_NAME_1984,
		NRI_SURPLUS_COMPANY_NAME_1984,
		DONK_CO_NAME_1984,
		SOL_DEFENSE_NAME_1984,
		BOLT_NANOTRASEN_DEFENSE_NAME_1984,
		VITEZSTVI_AMMO_NAME_1984,
	)

/obj/machinery/computer/cargo/express/ghost/packin_up(forced = FALSE) //we're the ghost role, add the company imports stuff to our express console
	. = ..()

	if(meme_pack_data["Company Imports"])
		return

	meme_pack_data["Company Imports"] = list(
		"name" = "Company Imports",
		"packs" = list()
	)

	for(var/armament_category in SSarmaments.entries)
		for(var/subcategory in SSarmaments.entries[armament_category][CATEGORY_ENTRY])
			if(armament_category in allowed_categories)
				for(var/datum/armament_entry/armament_entry as anything in SSarmaments.entries[armament_category][CATEGORY_ENTRY][subcategory])
					meme_pack_data["Company Imports"]["packs"] += list(list(
						"name" = "[armament_category]: [armament_entry.name]",
						"first_item_icon" = armament_entry?.item_type.icon,
						"first_item_icon_state" = armament_entry?.item_type.icon_state,
						"cost" = armament_entry.cost,
						"id" = REF(armament_entry),
						"description" = armament_entry.description,
						"desc" = armament_entry.description,
					))

/obj/machinery/computer/cargo/express/ghost/ui_act(action, params, datum/tgui/ui)
	if(action == "add") // if we're generating a supply order
		if (!beacon || !using_beacon ) // checks if using a beacon or not.
			say("Error! Destination is not whitelisted, aborting.")
			return
		var/id = params["id"]
		id = text2path(id) || id
		var/datum/supply_pack/is_supply_pack = SSshuttle.supply_packs[id]
		if(!is_supply_pack || !istype(is_supply_pack)) //if we're ordering a company import pack, add a temp pack to the global supply packs list, and remove it
			var/datum/armament_entry/armament_order = locate(id)
			params["id"] = length(SSshuttle.supply_packs) + 1
			var/datum/supply_pack/armament/temp_pack = new
			temp_pack.name = initial(armament_order.item_type.name)
			temp_pack.cost = armament_order.cost
			temp_pack.contains = list(armament_order.item_type)
			SSshuttle.supply_packs += temp_pack
			. = ..()
			SSshuttle.supply_packs -= temp_pack
			return
	return ..()

/obj/item/circuitboard/computer/cargo/express/ghost/interdyne
	contraband = TRUE

/obj/machinery/computer/cargo/express/ghost/interdyne
	contraband = TRUE

/obj/item/circuitboard/computer/cargo/express/ghost/syndicate
	contraband = TRUE

/obj/machinery/computer/cargo/express/ghost/syndicate
	contraband = TRUE
