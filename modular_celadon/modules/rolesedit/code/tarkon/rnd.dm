//id card
/datum/design/tarkon_id
	name = "Tarkon Identification Card"
	desc = "A card used to provide ID and determine access across the Port Tarkon. Has an integrated digital display and advanced microchips."
	id = "tarkonidcard"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(
		/datum/material/plastic = SMALL_MATERIAL_AMOUNT * 2,
		/datum/material/iron=SMALL_MATERIAL_AMOUNT,
		/datum/material/glass =SMALL_MATERIAL_AMOUNT,)
	build_path = /obj/item/card/id/advanced/tarkon/printed
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SERVICE
	)

/datum/techweb_node/tarkon/New()
	design_ids += "tarkonidcard"
	return ..()
