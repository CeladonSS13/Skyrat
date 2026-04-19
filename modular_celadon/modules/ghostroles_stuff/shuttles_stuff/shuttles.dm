/obj/machinery/computer/shuttle/interdyne_cargo
	possible_destinations = "interdyne_cargo_home;interdyne_cargo_away;interdyne_cargo_custom"

/obj/machinery/computer/shuttle/tarkon_driver
	possible_destinations = "tarkon_driver_custom;port_tarkon;whiteship_away"

/obj/machinery/computer/camera_advanced/shuttle_docker/tarkon_driver
	jump_to_ports = list("port_tarkon" = 1, "whiteship_away" = 1)

/obj/item/shuttle_remote
	var/allow_call_to_custom_and_backhome = FALSE

/obj/item/shuttle_remote/tarkon
	shuttle_away_id = "tarkon_driver_custom" // sends HREF warnings and do nothing usually
	allow_call_to_custom_and_backhome = TRUE
