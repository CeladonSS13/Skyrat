///SECMED
/obj/item/clothing/under/rank/medical/scrubs/nova/red/sec
	name = "security medic scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards and acid, along with some light padding. This one is in a deep red."
	armor_type = /datum/armor/brigmed_under

/datum/armor/brigmed_under
	melee = 10
	bio = 10
	fire = 30
	acid = 30
	wound = 10

/datum/loadout_item/under/miscellaneous/medrscrubs
	name = "Security Medic's Scrubs"
	item_path = /obj/item/clothing/under/rank/medical/scrubs/nova/red/sec
	restricted_roles = list(JOB_SECURITY_MEDIC)

/obj/item/clothing/suit/toggle/labcoat/security_medic
	name = "security medic labcoat"
	icon_state = "secmed_labcoat"
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/labcoat.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/sec_haul/icons/labcoatworn.dmi'
	blood_overlay_type = "armor"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	armor_type = /datum/armor/security_medic_coat

/datum/armor/security_medic_coat
	melee = 20
	bullet = 15
	laser = 20
	energy = 30
	bomb = 25
	fire = 60
	acid = 60
	bio = 60
	wound = 10

/obj/item/clothing/suit/toggle/labcoat/security_medic/Initialize(mapload)
	. = ..()
	allowed += list(
		/obj/item/flashlight,
		/obj/item/gun,
		/obj/item/melee/baton/telescopic,
		/obj/item/storage/medkit
		)

/obj/item/clothing/suit/toggle/labcoat/security_medic/blue
	icon_state = "secmed_labcoat_blue"

/datum/armor/security_medic_hazardvest
	melee = 20
	bullet = 10
	laser = 30
	energy = 40
	bomb = 25
	fire = 50
	acid = 50
	bio = 20
	wound = 15

/obj/item/clothing/suit/hazardvest/security_medic
	name = "security medic vest"
	desc = "A lightweight vest worn by the Security Medic."
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/armor.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/sec_haul/icons/armorworn.dmi'
	icon_state = "secmed_vest"
	worn_icon_state = "secmed_vest"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	allowed = list(/obj/item/analyzer, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight, /obj/item/reagent_containers/cup/bottle, /obj/item/reagent_containers/cup/beaker, /obj/item/reagent_containers/applicator/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/baton/telescopic, /obj/item/soap, /obj/item/tank/internals/emergency_oxygen, /obj/item/gun, /obj/item/storage/medkit)
	armor_type = /datum/armor/security_medic_hazardvest
	cold_protection = CHEST|GROIN
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT

/obj/item/clothing/suit/hazardvest/security_medic/blue
	icon_state = "secmed_vest_blue"
	worn_icon_state = "secmed_vest_blue"

/obj/item/clothing/suit/armor/vest/peacekeeper/security_medic
	name = "security medic armor vest"
	desc = "A security medic's armor vest, with little pockets for little things."
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/armor.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/sec_haul/icons/armorworn.dmi'
	icon_state = "secmed_armor"
	worn_icon_state = "secmed_armor"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	allowed = list(/obj/item/analyzer, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight, /obj/item/reagent_containers/cup/bottle, /obj/item/reagent_containers/cup/beaker, /obj/item/reagent_containers/applicator/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/baton/telescopic, /obj/item/soap, /obj/item/tank/internals/emergency_oxygen, /obj/item/gun, /obj/item/storage/medkit)

/obj/item/clothing/under/rank/security/nova/security_medic/alternate
	name = "security medic uniform"
	desc = "A lightly armored uniform worn by Nanotrasen's Asset Protection Medical Corps."
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/under.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/sec_haul/icons/underworn.dmi'
	worn_icon_digi = 'modular_ss220/modules/return_prs/sec_haul/icons/underworn_digi.dmi'
	icon_state = "security_medic_jumpsuit"

/obj/item/clothing/under/rank/security/nova/security_medic
	name = "security medic turtleneck"
	desc = "A comfy turtleneck with a white armband, denoting the wearer as a security medic."
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/under.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/sec_haul/icons/underworn.dmi'
	worn_icon_digi = 'modular_ss220/modules/return_prs/sec_haul/icons/underworn_digi.dmi'
	icon_state = "security_medic_turtleneck"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/under/rank/security/nova/security_medic/skirt
	name = "security medic skirtleneck"
	desc = "A comfy turtleneck with a white armband and brown skirt, denoting the wearer as a security medic."
	icon_state = "security_medic_turtleneck_skirt"
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/under.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/sec_haul/icons/underworn.dmi'
	worn_icon_digi = 'modular_ss220/modules/return_prs/sec_haul/icons/underworn_digi.dmi'
	body_parts_covered = CHEST|GROIN|ARMS
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/head/beret/sec/nova/security_medic
	name = "security medic beret"
	desc = "A robust beret with the medical insignia emblazoned on it. Uses reinforced fabric to offer sufficient protection."
	greyscale_colors = "#3F3C40#870E12"
	icon_state = "beret_badge_med"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/head/helmet/sec/security_medic
	name = "security medic helmet"
	desc = "A standard issue combat helmet for security medics. Has decent tensile strength and armor. Keep your head down."
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/head.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/sec_haul/icons/headworn.dmi'
	icon_state = "secmed_helmet"
	base_icon_state = "secmed_helmet"
	flags_cover = HEADCOVERSEYES|EARS_COVERED|PEPPERPROOF
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/head/helmet/sec/click_alt(mob/user)
	return

/obj/item/storage/belt/security/medic
	name = "security medic belt"
	desc = "A fancy looking security belt emblazoned with markings of the security medic. Sadly only holds security gear."
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/belt.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/sec_haul/icons/beltworn.dmi'
	worn_icon_state = "belt_medic"
	icon_state = "belt_medic"

/datum/atom_skin/belt_secmed
	abstract_type = /datum/atom_skin/belt_secmed

/datum/atom_skin/belt_secmed/basic
	preview_name = "Basic"
	new_icon_state = "belt_medic"

/datum/atom_skin/belt_secmed/second
	preview_name = "Second"
	new_icon_state = "belt_medic_alt"

/obj/item/storage/belt/security/medic/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/reskinable_item, /datum/atom_skin/belt_secmed)

/obj/item/storage/belt/security/medic/full/PopulateContents()
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/melee/baton/security/loaded(src)
	update_appearance()

/obj/item/storage/bag/garment/brigmed
	name = "security medic's garment bag"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the security medic."

/obj/item/storage/bag/garment/brigmed/PopulateContents()
	new /obj/item/clothing/suit/toggle/labcoat/security_medic(src)
	new /obj/item/clothing/suit/toggle/labcoat/security_medic/blue(src)
	new /obj/item/clothing/suit/hazardvest/security_medic(src)
	new /obj/item/clothing/suit/hazardvest/security_medic/blue(src)
	new /obj/item/clothing/head/helmet/sec/security_medic(src)
	new /obj/item/clothing/under/rank/medical/scrubs/nova/red/sec(src)
	new /obj/item/clothing/under/rank/security/nova/security_medic/alternate(src)
	new /obj/item/clothing/under/rank/security/nova/security_medic(src)
	new /obj/item/clothing/under/rank/security/nova/security_medic/skirt(src)
	new /obj/item/clothing/shoes/jackboots/sec(src)
	new /obj/item/clothing/suit/jacket/straight_jacket(src)
