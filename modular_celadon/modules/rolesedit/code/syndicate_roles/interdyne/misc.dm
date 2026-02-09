//qm console
/obj/machinery/computer/id_upgrader/ip
	name = "interdyne access upgrader laptop"
	desc = "A compact console meant to allow modifications to IDs. This one made by interdyne pharmaceutics and add IP access."
	icon = 'icons/obj/machines/computer.dmi'
	density = FALSE
	icon_state = "laptop"
	icon_screen = "medlaptop"
	icon_keyboard = "laptop_key"
	pass_flags = PASSTABLE
	projectiles_pass_chance = 100
	circuit = /obj/item/circuitboard/computer/id_upgrader/ip
	access_to_give = list(ACCESS_SYNDICATE_IP)
	req_access = list(ACCESS_SYNDICATE)

/obj/item/circuitboard/computer/id_upgrader/ip
	name = "interdyne access upgrader laptop circuit"
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/computer/id_upgrader/ip

//bank card code
/obj/item/card/id/departmental_budget/interdyne
	budget_name = "Interdyne Pharmaceuticals"
	radio_channel = RADIO_CHANNEL_INTERDYNE
	departament_access = ACCESS_SYNDICATE_IP
	away = TRUE

//mod
/obj/item/mod/control/pre_equipped/interdyne/nerfed
	locked = 1
	req_one_access = list(ACCESS_SYNDICATE_IP, ACCESS_SYNDICATE_DS)

//shuttle
/obj/machinery/computer/shuttle/interdyne_cargo
	req_one_access = list(ACCESS_SYNDICATE_IP, ACCESS_SYNDICATE_DS)
