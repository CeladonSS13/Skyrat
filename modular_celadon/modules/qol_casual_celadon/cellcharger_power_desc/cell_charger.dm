#define POWERMONITORING_RED_TEXT span_notice("Power monitoring port is: [span_red("RED")], there is no surplus power in grid. <b>Can't charge cells</b>.")
#define POWERMONITORING_GREEN_TEXT span_notice("Power monitoring port is: [span_green("GREEN")], there is a surplus power in grid. <b>Can charge cells</b>.")

/proc/get_powermonitoring_desc(obj/machinery/relative_charger)
	var/area/home = get_area(relative_charger)
	if(isnull(home))
		return POWERMONITORING_RED_TEXT
	if(!home.requires_power)
		return POWERMONITORING_GREEN_TEXT
	var/obj/machinery/power/apc/local_apc = home.apc
	if(isnull(local_apc) || !local_apc.operating)
		return POWERMONITORING_RED_TEXT
	var/surplus = local_apc.surplus()
	if (surplus <= 0)
		return POWERMONITORING_RED_TEXT
	return POWERMONITORING_GREEN_TEXT

#undef POWERMONITORING_RED_TEXT
#undef POWERMONITORING_GREEN_TEXT
