/datum/uplink_item/bundles_tc/blood_worm_kit
	name = "Blood Worm Kit"
	desc = "The Syndicate has offered you the chance to upgrade yourself into a blood worm form. \
		Upon purchase, you'll be granted special DNA injector (not compatible with changelings and species who live without any type of blood). \
		Additionally, you will be provided with some bloodloss first aid gear and mini fire extinguisher to help you survive after serious paper cut and a light bulb burn. \
		Not compatible with slimepersons, No refunds!"
	item = /obj/item/storage/box/syndicate/blood_worm_kit
	category = /datum/uplink_category/special
	cost = 25
	purchasable_from = UPLINK_TRAITORS | UPLINK_SPY

/obj/item/storage/box/syndicate/blood_worm_kit
	desc = "It's just an ordinary box."
	special_desc_requirement = EXAMINE_CHECK_SYNDICATE
	special_desc = "Supplied by Syndicate, this one comes with one experimental blood worm mutator injector."

/obj/item/storage/box/syndicate/blood_worm_kit/PopulateContents()
	new /obj/item/blood_worm_mutator(src)
	new /obj/item/extinguisher/mini(src)
	new /obj/item/storage/pill_bottle/iron(src)
	new /obj/item/stack/medical/suture/bloody(src)
	new /obj/item/stack/medical/mesh/bloody(src)
	new /obj/item/stack/medical/wrap/gauze/sterilized(src)
	new /obj/item/reagent_containers/hypospray/medipen/deforest/coagulants(src)
	new /obj/item/stack/medical/suture/coagulant(src)
