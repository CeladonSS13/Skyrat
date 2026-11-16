/obj/item/stack/sheet/animalhide/goliath_hide/New()
	. = ..()
	if (isnull(worn_icon_state))
		worn_icon_state = "nothing"
