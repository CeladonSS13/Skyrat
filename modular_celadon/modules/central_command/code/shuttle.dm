//templates
/datum/map_template/shuttle/centcom
	who_can_purchase = null
	port_id = "centcom"

/datum/map_template/shuttle/centcom/interlink
	suffix = "interlink"
	name = "CentCom Interlink shuttle"

/datum/map_template/shuttle/centcom/podbay_elevator
	suffix = "supplypod"
	name = "CentCom PodBay Elevator"

//shuttle areas
/area/shuttle/centcom/interlink
	name = "CentCom-Interlink Shuttle"

/area/shuttle/centcom/podbay_elevator
	name = "CentCom PodBay Elevator"

//shuttle computers
/obj/machinery/computer/shuttle/centcom
	shuttleId = "centcom"
	req_access = list(ACCESS_CENT_GENERAL)
	var/allow_silicons = FALSE
	var/allow_emag = FALSE

/obj/machinery/computer/shuttle/centcom/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(!allow_emag)
		balloon_alert(user, "firewall too powerful!")
		return FALSE
	return ..()

/obj/machinery/computer/shuttle/centcom/attack_ai()
	return allow_silicons ? ..() : FALSE

/obj/machinery/computer/shuttle/centcom/attack_robot()
	return allow_silicons ? ..() : FALSE

/obj/machinery/computer/shuttle/centcom/interlink
	name = "CentCom-Interlink shuttle console"
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	shuttleId = "centcom_interlink"
	req_access = list(ACCESS_CENT_OFFICER)
	possible_destinations = "centcom_interlink_home;centcom_interlink_away"

/obj/machinery/computer/shuttle/centcom/podbay_elevator
	name = "Elevator console"
	desc = "A elevator control computer."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	shuttleId = "centcom_supplypod"
	possible_destinations = "centcom_supplypod_warehouse;centcom_supplypod_podbay"

//docking ports
///interlink
/obj/docking_port/stationary/centcom/interlink
	dir = 8
	height = 6
	width = 12
	dwidth = 3

/obj/docking_port/stationary/centcom/interlink/home
	shuttle_id = "centcom_interlink_home"
	name = "CentCom Security"
	roundstart_template = /datum/map_template/shuttle/centcom/interlink

/obj/docking_port/stationary/centcom/interlink/away
	shuttle_id = "centcom_interlink_away"
	name = "Interlink Dock"

///cargo elevator
/obj/docking_port/stationary/centcom/podbay_elevator
	dir = 4
	height = 7
	dwidth = 3
	width = 7

/obj/docking_port/stationary/centcom/podbay_elevator/warehouse
	shuttle_id = "centcom_supplypod_warehouse"
	name = "CentCom Warehouse"
	roundstart_template = /datum/map_template/shuttle/centcom/podbay_elevator

/obj/docking_port/stationary/centcom/podbay_elevator/podbay
	shuttle_id = "centcom_supplypod_podbay"
	name = "CentCom PodBay"
