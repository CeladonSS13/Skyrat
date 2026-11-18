/obj/item/paper
	VAR_PRIVATE/ui_ver = 0 // used by code

/obj/item/paper/ui_assets(mob/user)
	. = ..()
	. += get_asset_datum(/datum/asset/simple/fax_templates_images)

/obj/item/paper/update_static_data_for_all_viewers()
	ui_ver++
	. = ..()

/obj/item/paper/ui_data(mob/user)
	. = ..()
	var/list/data = .
	if (!data)
		return .

	data["ui_ver"] = ui_ver

	return data
