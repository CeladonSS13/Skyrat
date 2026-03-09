/obj/item/card/id
	var/wildcard_expanded = null //basically cards doesn't have expanded version due to upstreams and possible issues with new added cards

/obj/item/card/id/Initialize(mapload)
	..()
	if(CONFIG_GET(flag/infinite_access_slots) && wildcard_expanded)
		wildcard_slots = wildcard_expanded
	wildcard_expanded = null	//cleans after init

/obj/item/card/id/advanced		//not ideal, because this is basic card
	wildcard_expanded = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/prisoner
	wildcard_expanded = null

/obj/item/card/id/advanced/centcom
	wildcard_expanded = null

/obj/item/card/id/advanced/centcom/station	//decorative centcom like card, for bridge officer
	wildcard_expanded = WILDCARD_LIMIT_GOLD

/obj/item/card/id/advanced/debug
	wildcard_expanded = null

/obj/item/card/id/advanced/highlander
	wildcard_expanded = null

/obj/item/card/id/advanced/factory
	wildcard_expanded = null

/obj/item/card/id/advanced/solfed
	wildcard_expanded = null

/obj/item/card/id/advanced/armadyne
	wildcard_expanded = null

/obj/item/card/id/advanced/tarkon
	wildcard_expanded = null

/obj/item/card/id/advanced/black
	wildcard_expanded = null

/obj/item/card/id/advanced/visitor
	wildcard_expanded = null

/obj/item/card/id/advanced/simple_bot
	wildcard_expanded = null

/obj/item/card/id/advanced/chameleon
	wildcard_expanded = WILDCARD_LIMIT_CHAMELEON_ID_EXPANDED

/obj/item/card/id/advanced/chameleon/ghost_cafe
	wildcard_expanded = null
