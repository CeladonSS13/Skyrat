/turf/closed/mineral/random/labormineral/mineral_chances()
	return list(
		/obj/item/stack/ore/bananium = check_holidays(APRIL_FOOLS) ? 3 : 0,
		/obj/item/stack/ore/bluespace_crystal = 1,
		/obj/item/stack/ore/diamond = 1,
		/obj/item/stack/ore/gold = 10,
		/obj/item/stack/ore/iron = 40,
		/obj/item/stack/ore/plasma = 20,
		/obj/item/stack/ore/silver = 12,
		/obj/item/stack/ore/titanium = 11,
		/obj/item/stack/ore/uranium = 5,
		/turf/closed/mineral/gibtonite = 4,
	)

/turf/closed/mineral/random/labormineral/volcanic/mineral_chances()
	return list(
		/obj/item/stack/ore/bluespace_crystal = 1,
		/obj/item/stack/ore/diamond = 1,
		/obj/item/stack/ore/gold = 8,
		/obj/item/stack/ore/iron = 94,
		/obj/item/stack/ore/plasma = 30,
		/obj/item/stack/ore/silver = 20,
		/obj/item/stack/ore/titanium = 8,
		/obj/item/stack/ore/uranium = 3,
		/turf/closed/mineral/gibtonite = 2,
	)

/turf/closed/mineral/random/labormineral/ice/mineral_chances()
	return list(
		/obj/item/stack/ore/bluespace_crystal = 1,
		/obj/item/stack/ore/diamond = 1,
		/obj/item/stack/ore/gold = 10,
		/obj/item/stack/ore/iron = 40,
		/obj/item/stack/ore/plasma = 20,
		/obj/item/stack/ore/silver = 12,
		/obj/item/stack/ore/titanium = 11,
		/obj/item/stack/ore/uranium = 5,
		/turf/closed/mineral/gibtonite/ice/icemoon = 4,
	)
