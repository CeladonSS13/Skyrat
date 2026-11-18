//Justice (emaged only)
/datum/design/justice_chassis
	name = "Exosuit Chassis (\"Justice\")"
	id = "justice_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/justice
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*20)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_JUSTICE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/justice_torso
	name = "Exosuit Torso (\"Justice\")"
	id = "justice_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/justice_torso
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 50,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT * 5,
	)
	construction_time = 30 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_JUSTICE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/justice_left_arm
	name = "Exosuit Left Arm (\"Justice\")"
	id = "justice_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/justice_left_arm
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT * 2,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_JUSTICE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/justice_right_arm
	name = "Exosuit Right Arm (\"Justice\")"
	id = "justice_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/justice_right_arm
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_JUSTICE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/justice_left_leg
	name = "Exosuit Left Leg (\"Justice\")"
	id = "justice_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/justice_left_leg
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_JUSTICE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/justice_right_leg
	name = "Exosuit Right Leg (\"Justice\")"
	id = "justice_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/justice_right_leg
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_JUSTICE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/justice_armor
	name = "Exosuit Armor (\"Justice\")"
	id = "justice_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/justice_armor
	materials = list(
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/plastic=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/diamond=SHEET_MATERIAL_AMOUNT*1,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_JUSTICE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)
