/obj/item/circuitboard/computer/cargo/express/ghost/centcom
	name = "CentCom Express Supply Console"
	build_path = /obj/machinery/computer/cargo/express/ghost/centcom

/obj/machinery/computer/cargo/express/ghost/centcom
	name = "\improper CentCom Express Supply Console"
	desc = "This console allows the user to purchase a package \
		with 1/40th of the delivery time: made possible by Nanotrasen's new \"1500mm Orbital Drop Pod Railgun\".\
		All sales are near instantaneous - please choose carefully"
	circuit = /obj/item/circuitboard/computer/cargo/express/ghost/centcom
	landingzone = /area/centcom/central_command_areas/supply/cargo_delivery
	req_access = list(ACCESS_CENT_SUPPLY)
	cargo_account = ACCOUNT_CCD
	console_flag = CARGO_CONSOLE_NT_CENTCOM
