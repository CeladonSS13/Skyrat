#define BASE_POINT_MULT 1
#define BASE_SHEET_MULT 1
#define POINT_MULT_ADD_PER_RATING 0.1
#define SHEET_MULT_ADD_PER_RATING 0.1

/obj/machinery/mineral/ore_redemption/RefreshParts()
	. = ..()
	//servo increase points(+10% * (tier-1))
	for(var/datum/stock_part/servo/S in component_parts)
		point_upgrade = BASE_POINT_MULT + (POINT_MULT_ADD_PER_RATING * (S.tier - 1))
	var/sheet_bonus = 0
	//matter bin and laser increase ore mult(+5% laser, +5% matter)
	for(var/datum/stock_part/matter_bin/B in component_parts)
		sheet_bonus += BASE_SHEET_MULT + (SHEET_MULT_ADD_PER_RATING * (B.tier - 1))
	for(var/datum/stock_part/micro_laser/M in component_parts)
		sheet_bonus += BASE_SHEET_MULT + (SHEET_MULT_ADD_PER_RATING * (M.tier - 1))
	ore_multiplier = sheet_bonus / 2

#undef BASE_POINT_MULT
#undef BASE_SHEET_MULT
#undef POINT_MULT_ADD_PER_RATING
#undef SHEET_MULT_ADD_PER_RATING
