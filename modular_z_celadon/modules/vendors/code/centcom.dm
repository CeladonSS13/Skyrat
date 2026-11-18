/obj/machinery/vending/access/centcom
	name = "\improper CentDrobe"
	desc = "A one-of-a-kind vending machine for all your centcom aesthetic needs! Now with extended access checking protocol!"
	icon_state = "centdrobe"
	product_ads = "Show those ERTs who's the most stylish in the briefing room!;File paperwork in style!;You have the right to be fashionable!;Now you can be the fashion police you always wanted to be!"
	vend_reply = "Thank you for using the CentDrobe!"
	light_mask = "wardrobe-light-mask"
	auto_build_products = TRUE
	all_products_free = FALSE
	onstation = TRUE	//do not bypass id check
	onstation_override = TRUE	//do not bypass id check
	payment_department = ACCOUNT_CCD

	refill_canister = /obj/item/vending_refill/wardrobe/centcom_access_wardrobe
	light_color = LIGHT_COLOR_ELECTRIC_GREEN
	allow_custom = TRUE

/obj/machinery/vending/access/centcom/build_access_list(list/access_lists)
	access_lists[ACCESS_CENT_GENERAL] = list(
		//eyes
		/obj/item/clothing/glasses/sunglasses = 1,
		//hat
		/obj/item/clothing/head/hats/imperial = 1,
		/obj/item/clothing/head/hats/caphat/naval/custom = 1,
		/obj/item/clothing/head/hats/caphat/naval/custom/gold = 1,
		//under
		/obj/item/clothing/under/imperial = 1,
		/obj/item/clothing/under/imperialskirt = 1,
		//shoes
		/obj/item/clothing/shoes/sneakers/brown = 1,
		/obj/item/clothing/shoes/laceup = 1,
		/obj/item/clothing/shoes/jackboots = 1,
		//hop
		/obj/item/clothing/neck/cloak/hop = 1,
		/obj/item/clothing/neck/mantle/hopmantle = 1,
		//ce
		/obj/item/clothing/neck/cloak/ce = 1,
		/obj/item/clothing/neck/mantle/cemantle = 1,
		//cmo
		/obj/item/clothing/neck/cloak/cmo = 1,
		/obj/item/clothing/neck/mantle/cmomantle = 1,
		//hos
		/obj/item/clothing/neck/cloak/hos = 1,
		/obj/item/clothing/neck/cloak/hos/blue = 1,
		/obj/item/clothing/neck/mantle/hosmantle = 1,
		//qm
		/obj/item/clothing/neck/cloak/qm = 1,
		/obj/item/clothing/neck/mantle/qm = 1,
		//rd
		/obj/item/clothing/neck/cloak/rd = 1,
		/obj/item/clothing/neck/mantle/rdmantle = 1,
		//cap
		/obj/item/clothing/neck/cloak/cap = 1,
		/obj/item/clothing/neck/mantle/capmantle = 1,
		//bs
		/obj/item/clothing/neck/mantle/bsmantle = 1,
		//bun
		/obj/item/clothing/head/playbunnyears/centcom = 1,
		/obj/item/clothing/neck/tie/bunnytie/centcom = 1,
		/obj/item/clothing/suit/jacket/tailcoat/centcom = 1,
		/obj/item/clothing/under/costume/playbunny/centcom = 1,
	)
	access_lists[ACCESS_CENT_LIVING] = list(
		/obj/item/clothing/head/hats/intern = 1,
		/obj/item/clothing/under/rank/centcom/intern = 1,
	)
	access_lists[ACCESS_CENT_OFFICIAL] = list(
		/obj/item/clothing/head/nanotrasen_consultant = 1,
		/obj/item/clothing/head/nanotrasen_consultant/beret = 1,
		/obj/item/clothing/head/beret/centcom_formal/nt_consultant = 1,
		/obj/item/clothing/head/hats/imperial/nanotrasen_consultant = 1,
		/obj/item/clothing/head/hats/centhat = 1,
		/obj/item/clothing/under/rank/nanotrasen_consultant = 1,
		/obj/item/clothing/under/rank/nanotrasen_consultant/skirt = 1,
		/obj/item/clothing/under/imperial/nanotrasen_consultant = 1,
		/obj/item/clothing/under/imperialskirt/nanotrasen_consultant = 1,
		/obj/item/clothing/under/rank/centcom/official = 1,
		/obj/item/clothing/under/rank/centcom/nova/naval = 1,
		/obj/item/clothing/suit/armor/centcom_formal/nt_consultant = 1,
		/obj/item/clothing/suit/armor/vest/nanotrasen_consultant = 1,
		/obj/item/clothing/suit/armor/vest/nanotrasen_consultant/hubert = 1,
		/obj/item/clothing/suit/armor/vest/nanotrasen_consultant/green = 1,
		/obj/item/clothing/suit/hooded/wintercoat/centcom/nt_consultant = 1,
		/obj/item/clothing/glasses/hud/security/sunglasses/black = 1,
		/obj/item/clothing/gloves/combat = 1,
		/obj/item/clothing/gloves/combat/naval/nanotrasen_consultant = 1,
	)
	access_lists[ACCESS_CENT_SECURITY] = list(
		/obj/item/clothing/glasses/hud/security/sunglasses/peacekeeper = 1,
		/obj/item/clothing/suit/armor/vest/peacekeeper = 1,
		/obj/item/clothing/suit/armor/vest/peacekeeper/black = 1,
		/obj/item/clothing/suit/armor/vest/peacekeeper/spacecoat = 1,
		/obj/item/clothing/gloves/combat/peacekeeper = 1,
		/obj/item/clothing/gloves/tackler/peacekeeper = 1,
		//shoes
		/obj/item/clothing/shoes/jackboots/sec = 1,
		/obj/item/clothing/shoes/jackboots/sec/blue = 1,
		/obj/item/clothing/shoes/jackboots/peacekeeper = 1,
	)
	access_lists[ACCESS_CENT_SPECOPS] = list(
		//shoes
		/obj/item/clothing/shoes/combat = 1,
	)
	access_lists[ACCESS_CENT_OFFICER] = list(
		/obj/item/clothing/head/hats/centcom_cap = 1,
		/obj/item/clothing/under/rank/centcom/officer = 1,
		/obj/item/clothing/under/rank/centcom/officer_skirt = 1,
		/obj/item/clothing/under/rank/centcom/nova/naval/commander = 1,
		/obj/item/clothing/under/rank/centcom/commander = 1,
		/obj/item/clothing/under/rank/centcom/centcom_skirt = 1,
		/obj/item/clothing/suit/armor/centcom_formal = 1,
		/obj/item/clothing/suit/armor/vest/capcarapace/naval = 1,
		/obj/item/clothing/suit/hooded/wintercoat/centcom = 1,
		/obj/item/clothing/gloves/combat/naval = 1,
		/obj/item/clothing/neck/pauldron = 1,
		/obj/item/clothing/neck/pauldron/commander = 1,
		//shoes
		/obj/item/clothing/shoes/combat/swat = 1,
	)
	access_lists[ACCESS_CENT_SPECOPS_OFFICER] = list(
		//spaceproof
		/obj/item/clothing/head/helmet/space/beret = 1,
		/obj/item/clothing/suit/space/officer = 1,
	)
	access_lists[ACCESS_CENT_CAPTAIN] = list(
		/obj/item/clothing/neck/pauldron/captain = 1,
	)
	access_lists[ACCESS_CENT_ADMIRAL] = list(
		/obj/item/clothing/head/hats/caphat/naval = 1,
		/obj/item/clothing/under/rank/centcom/nova/naval/admiral = 1,
		/obj/item/clothing/neck/cloak/admiral = 1,
	)
	access_lists[ACCESS_CENT_FLEET_ADMIRAL] = list(
		/obj/item/clothing/head/hats/caphat/naval/fleet_admiral = 1,
		/obj/item/clothing/under/rank/centcom/nova/naval/fleet_admiral = 1,
		/obj/item/clothing/gloves/combat/naval/fleet_admiral = 1,
		/obj/item/clothing/neck/cloak/fleet_admiral = 1,
	)

/obj/machinery/vending/access/centcom/emag_act(mob/user, obj/item/card/emag/emag_card)
	balloon_alert(user, "firewall too powerful!")
	return FALSE

/obj/item/vending_refill/wardrobe/centcom_access_wardrobe
	machine_name = "CentDrobe"
	icon_state = "refill_centdrobe"
	light_color = LIGHT_COLOR_ELECTRIC_GREEN
