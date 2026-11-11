
//hop
/datum/job/head_of_personnel
	antagonist_restricted = FALSE


//clown
/datum/job/clown
	nova_stars_only = FALSE


//mime
/datum/job/mime
	nova_stars_only = FALSE


//chaplain
/datum/job/chaplain
	banned_quirks = list(CHAPLAIN_RESTRICTED_QUIRKS)

/datum/armor/techpriest
	melee = 25
	bullet = 10
	laser = 10
	energy = 10
	fire = 40
	acid = 40
	wound = 20

/obj/item/clothing/head/hooded/techchapel
	name = "techpriest hood"
	desc = "A techpriest hood. Seems, someone just tore it from suit"
	icon = 'icons/obj/clothing/head/chaplain.dmi'
	worn_icon = 'icons/mob/clothing/head/chaplain.dmi'
	icon_state = "techpriesthood"
	body_parts_covered = HEAD
	inhand_icon_state = null
	flags_inv = HIDEHAIR|HIDEEARS|HIDEFACE
	armor_type = /datum/armor/techpriest

/obj/item/clothing/suit/hooded/chaplainsuit/techchapel
	name = "techpriest suit"
	desc = "A techpriest suit"
	icon = 'icons/obj/clothing/suits/chaplain.dmi'
	worn_icon = 'icons/mob/clothing/suits/chaplain.dmi'
	icon_state = "techpriest"
	inhand_icon_state = null
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor_type = /datum/armor/techpriest
	hoodtype = /obj/item/clothing/head/hooded/techchapel

/obj/item/storage/box/holy/techpriest
	name = "Techpriest Kit"
	typepath_for_preview = /obj/item/clothing/suit/hooded/techpriest

/obj/item/storage/box/holy/techpriest/PopulateContents()
	new /obj/item/clothing/suit/hooded/chaplainsuit/techchapel(src)

//if this thing will break, look in  'icons/obj/clothing/suits/chaplain.dmi' 'icons/mob/clothing/suits/chaplain.dmi'	 'icons/obj/clothing/head/chaplain.dmi''icons/mob/clothing/head/chaplain.dmi'
