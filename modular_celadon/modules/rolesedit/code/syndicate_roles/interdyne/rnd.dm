// IP techfab
/obj/item/circuitboard/machine/techfab/ip
	name = "\improper Techfab - Interdyne"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/rnd/production/techfab/ip

/obj/machinery/rnd/production/techfab/ip
	name = "techfab (Interdyne)"
	desc = "An advanced fabricator designed to print out the latest prototypes and circuits researched from Science. Contains hardware to sync to research networks. This one is department-locked and only possesses a limited set of decryption keys."
	allowed_department_flags = DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_MEDICAL
	allowed_buildtypes = PROTOLATHE | AWAY_LATHE | IMPRINTER | AWAY_IMPRINTER
	circuit = /obj/item/circuitboard/machine/techfab/ip
	stripe_color = "#4f8f56"
	payment_department = ACCOUNT_INT
