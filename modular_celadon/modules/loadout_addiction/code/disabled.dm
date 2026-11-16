/datum/loadout_item
	var/is_disabled = FALSE

//disabled for reasons of other lore or because they are not should be available for everyone
/datum/loadout_item/inhand/plasteel_chef	//maybe
	is_disabled = TRUE

/datum/loadout_item/pocket_items/marsoc_coin
	is_disabled = TRUE

/datum/loadout_item/pocket_items/akarimod
	is_disabled = TRUE

/datum/loadout_item/inhand/sqn_box	//bugged items inside
	is_disabled = TRUE

/datum/loadout_item/pocket_items/darksabresheath	//bugged icon
	is_disabled = TRUE

/datum/loadout_item/toys/darksabre
	is_disabled = TRUE

// setting this things to both flags so they wont appear without config
/datum/loadout_item/pocket_items/gay_pride_flag
	is_disabled = TRUE
	erp_item = TRUE

/datum/crafting_recipe/gay_pride_flag
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED	//now they wont appear untill someone(admin/debugger) will somehow learn this

/datum/loadout_item/pocket_items/ace_pride_flag
	is_disabled = TRUE
	erp_item = TRUE

/datum/crafting_recipe/ace_pride_flag
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/loadout_item/pocket_items/bi_pride_flag
	is_disabled = TRUE
	erp_item = TRUE

/datum/crafting_recipe/bi_pride_flag
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/loadout_item/pocket_items/lesbian_pride_flag
	is_disabled = TRUE
	erp_item = TRUE

/datum/crafting_recipe/lesbian_pride_flag
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/loadout_item/pocket_items/pan_pride_flag
	is_disabled = TRUE
	erp_item = TRUE

/datum/crafting_recipe/pan_pride_flag
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/loadout_item/pocket_items/trans_pride_flag
	is_disabled = TRUE
	erp_item = TRUE

/datum/crafting_recipe/trans_pride_flag
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED
