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
