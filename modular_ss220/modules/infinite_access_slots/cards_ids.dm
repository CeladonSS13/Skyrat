/obj/item/card/id/Initialize(mapload)
	..()
	if (CONFIG_GET(flag/infinite_access_slots))
		wildcard_slots = WILDCARD_LIMIT_ADMIN
