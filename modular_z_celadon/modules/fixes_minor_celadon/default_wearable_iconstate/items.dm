/obj/item/disk/nuclear/New()
	. = ..()
	if (isnull(worn_icon_state))
		worn_icon_state = "nothing"

/obj/item/melee/energy/sword/New()
	. = ..()
	if (isnull(worn_icon_state))
		worn_icon_state = "nothing"

/obj/item/shield/energy/New()
	. = ..()
	if (isnull(worn_icon_state))
		worn_icon_state = "nothing"

/obj/item/storage/toolbox/emergency/turret/mag_fed/toy
	icon = 'icons/map_icons/items/_item.dmi'
