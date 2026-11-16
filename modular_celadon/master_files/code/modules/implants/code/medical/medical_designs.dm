
//medical items
/datum/design/defibrillator_compact
	name = "Compact Defibrillator"
	desc = "A compact defibrillator that can be worn on a belt."
	id = "defibrillator_compact"
	build_type = PROTOLATHE | AWAY_LATHE
	build_path = /obj/item/defibrillator/compact
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*6, /datum/material/glass = SHEET_MATERIAL_AMOUNT*4, /datum/material/silver = SHEET_MATERIAL_AMOUNT*3, /datum/material/gold =SHEET_MATERIAL_AMOUNT * 1.5)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

//implants
/datum/design/cyberimp_hackerman
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/plastic = HALF_SHEET_MATERIAL_AMOUNT * 3,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT * 3,
		/datum/material/gold = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/diamond = SMALL_MATERIAL_AMOUNT * 2,
		/datum/material/bluespace = HALF_SHEET_MATERIAL_AMOUNT,
	)
