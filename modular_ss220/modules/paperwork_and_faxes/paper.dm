/obj/item/paper
	VAR_PRIVATE/should_update_ui_now = FALSE // used by code

/obj/item/paper/ui_assets(mob/user)
	. = ..()
	. += get_asset_datum(/datum/asset/simple/fax_templates_images)

/obj/item/paper/update_static_data_for_all_viewers()
	should_update_ui_now = TRUE
	. = ..()
	should_update_ui_now = FALSE

/obj/item/paper/ui_static_data(mob/user)
	. = ..()
	var/list/static_data = .
	if (!static_data)
		return .

	static_data["should_update_ui"] = should_update_ui_now

	return static_data
