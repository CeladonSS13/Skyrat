/datum/market/blueshield
	name = "CentCom Blueshield Gear Delivery System"
	shipping = list(
		SHIPPING_METHOD_SUPPLYPOD_NT = 200,
	)
	legal_status = TRUE

/obj/item/market_uplink/blueshield
	name = "\improper CentCom Gear Delivery System"
	desc = "An legal military uplink. Used by ERT's."
	icon_state = "bs_beacon"
	inhand_icon_state = "bs_beacon"
	icon = 'modular_celadon/master_files/icons/remote.dmi'
	lefthand_file = 'modular_celadon/master_files/icons/inhand/mobs/lefthand_remote.dmi'
	righthand_file = 'modular_celadon/master_files/icons/inhand/mobs/righthand_remote.dmi'
	accessible_markets = list(/datum/market/blueshield)

/obj/item/market_uplink/blueshield/ui_interact(mob/user, datum/tgui/ui)
	if(!viewing_category)
		update_viewing_category()

	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "CeladonMarketUplink", name)
		ui.open()

//items
/datum/market_item/weapon/centcom
	category = "Special Weapons"
	abstract_path = /datum/market_item/weapon/centcom

/datum/market_item/weapon/centcom/blueshield_hellgun
	name = "\improper Streamlined Hellfire Laser Carbine"
	desc = "Get an upgraded, streamlined hellfire laser carbine, with even more charge."
	item = /obj/item/gun/energy/laser/hellgun/blueshield
	markets = list(/datum/market/blueshield)
	price_min = CARGO_CRATE_VALUE * 25
	price_max = CARGO_CRATE_VALUE * 45
	availability_prob = 100
	stock_min = 1
	stock_max = 1

/datum/market_item/weapon/centcom/blueshield_nt20
	name = "\improper Nanotrasen Armories \"NT20\" Submachinegun Gunset"
	desc = "Get a sleek, select-fire SMG chambered in the venerable .45 cartridge."
	item = /obj/item/storage/toolbox/guncase/nova/ntspecial/nt20
	markets = list(/datum/market/blueshield)
	price_min = CARGO_CRATE_VALUE * 50
	price_max = CARGO_CRATE_VALUE * 75
	availability_prob = 100
	stock_min = 1
	stock_max = 1

/datum/market_item/weapon/centcom/blueshield_cmg
	name = "\improper Nanotrasen Armories \"CMG-2\" Gunset"
	desc = "Get a PDW chambered in 9x25mm, developed by Nanotrasen R&D and based on a licensed Scarborough Arms design."
	item = /obj/item/storage/toolbox/guncase/nova/ntspecial/blueshield_cmg
	markets = list(/datum/market/blueshield)
	price_min = CARGO_CRATE_VALUE * 75
	price_max = CARGO_CRATE_VALUE * 100
	availability_prob = 100
	stock_min = 1
	stock_max = 1

/datum/market_item/weapon/centcom/blueshield_katyusha
	name = "\improper Nanotrasen Armories \"Katyusha\" gunset"
	desc = "Get a mag-fed shotgun for combat in narrow corridors."
	item = /obj/item/storage/toolbox/guncase/nova/katyusha
	markets = list(/datum/market/blueshield)
	price_min = CARGO_CRATE_VALUE * 100
	price_max = CARGO_CRATE_VALUE * 150
	availability_prob = 100
	stock_min = 1
	stock_max = 1

/datum/market_item/weapon/centcom/blueshield_shield
	name = "\improper Blueshield's energy shield"
	desc = "Get a advanced blue colored energy shield with a special propeller inside."
	item = /obj/item/shield/energy/returning/blueshield
	markets = list(/datum/market/blueshield)
	price_min = CARGO_CRATE_VALUE * 150
	price_max = CARGO_CRATE_VALUE * 200
	availability_prob = 100
	stock_min = 1
	stock_max = 1
