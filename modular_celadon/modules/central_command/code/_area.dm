//1984 centcom areas
/area/centcom
	name = "CentCom"
	icon = 'icons/area/areas_centcom.dmi'
	icon_state = "centcom"
	static_lighting = TRUE
	requires_power = FALSE
	default_gravity = STANDARD_GRAVITY
	area_flags = UNIQUE_AREA | NOTELEPORT
	flags_1 = NONE

//cargo areas
/area/centcom/central_command_areas/supply/cargo_delivery
	name = "CentCom Cargo Pod Drop Area"
	icon_state = "centcom_supply"

/area/centcom/central_command_areas/supply/warehouse
	name = "CentCom Cargo Warehouse"
	icon_state = "centcom_supply"

/area/centcom/central_command_areas/supply/pod
	name = "CentCom Cargo Pod Elevator"

//command areas
/area/centcom/central_command_areas/meeting
	name = "CentCom Staff Meeting Room"
	icon_state = "centcom_briefing"

//civ areas
/area/centcom/central_command_areas/crew_wing
	name = "CentCom Crew Wing"
	icon_state = "centcom_evacuation"

//sec areas
/area/centcom/central_command_areas/security
	name = "Centcom Security"
	icon_state = "centcom_holding"

/area/centcom/central_command_areas/prison/reserve
	name = "Centcom Temporaly Prison"
	icon_state = "centcom_prison"

/area/centcom/central_command_areas/prison/reserve/cells
	name = "Centcom Temporaly Prison Cells"
	icon_state = "centcom_cells"
