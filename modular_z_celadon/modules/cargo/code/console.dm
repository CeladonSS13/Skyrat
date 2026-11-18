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
		FRONTIER_EQUIPMENT_NAME_CELADON,
		DEFOREST_MEDICAL_NAME_CELADON,
		BLACKSTEEL_FOUNDATION_NAME_CELADON,
		KAHRAMAN_INDUSTRIES_NAME_CELADON,
		MICROSTAR_ENERGY_NAME_CELADON,
		NAKAMURA_ENGINEERING_MODSUITS_NAME_CELADON,
		NRI_SURPLUS_COMPANY_NAME_CELADON,
		DONK_CO_NAME_CELADON,
		SOL_DEFENSE_NAME_CELADON,
		BOLT_NANOTRASEN_DEFENSE_NAME_CELADON,
		VITEZSTVI_AMMO_NAME_CELADON,
	)

/obj/item/circuitboard/computer/cargo/express/ghost/interdyne
	contraband = TRUE

/obj/machinery/computer/cargo/express/ghost/interdyne
	landingzone = /area/ruin/interdyne_planetary_base/cargo/ware
	contraband = TRUE

/obj/item/circuitboard/computer/cargo/express/ghost/syndicate
	contraband = TRUE

/obj/machinery/computer/cargo/express/ghost/syndicate
	landingzone = /area/ruin/space/has_grav/nova/des_two/cargo/hangar
	contraband = TRUE

/obj/machinery/computer/cargo/express/ghost/tarkon
	landingzone = /area/ruin/space/has_grav/port_tarkon/cargo

//vault change
/obj/machinery/computer/bank_machine
	account_department = ACCOUNT_NTS	//vault now basically use station account
