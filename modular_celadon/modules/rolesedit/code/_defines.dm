//outfit code
/datum/outfit
	var/role_job = /datum/job/ghost_role
	var/paycheck_name = "Nanotrasen: Salary"

/datum/outfit/proc/handlebank(mob/living/carbon/human/owner)
	if(!owner.mind)
		return
	var/datum/bank_account/offstation_bank_account = new(owner.real_name, owner.mind.assigned_role)
	owner.account_id = offstation_bank_account.account_id
	offstation_bank_account.replaceable = FALSE
	offstation_bank_account.account_job = new role_job
	offstation_bank_account.paycheck_desc = paycheck_name
	owner.add_mob_memory(/datum/memory/key/account, remembered_id = owner.account_id)
	if(owner.wear_id)
		var/obj/item/card/id/id_card = owner.wear_id
		id_card.registered_account = offstation_bank_account
	return

//job code
/datum/job
	var/disable_all_loadout = FALSE

//airlocks
/obj/item/electronics/airlock/special
	var/regions_access_list = REGION_AREA_STATION
	var/regions_access_grant = REGION_ALL_STATION

/obj/item/electronics/airlock/special/ui_static_data(mob/user)
	var/list/data = list()
	var/list/regions = list()
	var/list/tgui_region_data = SSid_access.all_region_access_tgui
	for(var/region in regions_access_list)	//celadon edit
		regions += tgui_region_data[region]

	data["regions"] = regions
	return data

/obj/item/electronics/airlock/special/do_action(action, params)
	switch(action)
		if("clear_all")
			accesses = list()
			one_access = 0
		if("grant_all")
			accesses = SSid_access.get_region_access_list(list(regions_access_grant))	//celadon edit
		if("one_access")
			one_access = !one_access
		if("set")
			var/access = params["access"]
			if (!(access in accesses))
				accesses += access
			else
				accesses -= access
		if("set_shell")
			shell = !!params["on"]
		if("direc_set")
			var/unres_direction = text2num(params["unres_direction"])
			unres_sides ^= unres_direction
		if("grant_region")
			var/region = params["region"]
			if(isnull(region))
				return
			accesses |= SSid_access.get_region_access_list(list(region))
		if("deny_region")
			var/region = params["region"]
			if(isnull(region))
				return
			accesses -= SSid_access.get_region_access_list(list(region))
		if("passedName")
			var/new_name = trim("[params["passedName"]]", 30)
			passed_name = new_name
		if("passedCycleId")
			var/new_cycle_id = trim(params["passedCycleId"], 30)
			passed_cycle_id = new_cycle_id

/obj/effect/mapping_helpers/airlock/special_electronics
	name = "airlock special electronics helper"
	icon_state = "airlocknoteplacer"	//replace later
	var/obj/item/electronics/airlock/electronics_type = /obj/item/electronics/airlock/special

/obj/effect/mapping_helpers/airlock/special_electronics/payload(obj/machinery/door/airlock/ak)
	if(!ak.electronics)
		var/obj/item/electronics/airlock/ae = new electronics_type
		if(ak.closeOtherId)
			ae.passed_cycle_id = ak.closeOtherId
		if(length(ak.req_one_access))
			ae.one_access = 1
			ae.accesses = ak.req_one_access
		else if(length(ak.req_access))
			ae.accesses = ak.req_access
		ak.electronics = ae
		return TRUE
	log_mapping("[src] at [AREACOORD(src)] tried to add electronics to [ak] but it's already have one!")
	return
