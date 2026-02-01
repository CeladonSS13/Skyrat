/obj/item/circuitboard/computer/id_upgrader
	name = "Generic ID Upgrade Machine circuit"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/computer/id_upgrader

/obj/machinery/computer/id_upgrader
	name = "ID Upgrade Machine"
	desc = "An old computer, that can add access to the card."
	icon = 'modular_ss220/modules/access_upgrader/icons/pass.dmi'
	density = FALSE
	icon_state = "guest"
	icon_screen = "pass"
	circuit = /obj/item/circuitboard/computer/id_upgrader
	var/list/access_to_give = list(ACCESS_AWAY_GENERAL)
	req_access = list()

/obj/machinery/computer/id_upgrader/attackby(obj/item/I, mob/user, params)
	if(I.GetID())
		var/obj/item/card/id/D = I.GetID()
		if((machine_stat & (NOPOWER|BROKEN|MAINT)))
			to_chat(user, "<span class='notice'>This machine appears to be not operational.</span>")
			return
		if(!access_to_give.len)
			to_chat(user, "<span class='notice'>This machine appears to be configured incorrectly.</span>")
			return
		if(length(req_access))
			var/have_access = FALSE
			var/list/id_access = D.GetAccess()
			for(var/this_access in req_access)
				if(this_access in id_access)
					have_access = TRUE
					break
			if(!have_access)
				to_chat(user, "<span class='notice'>Your ID card doesn't have required access.</span>")
				return
		var/did_upgrade = 0
		var/list/id_access = D.GetAccess()
		for(var/this_access in access_to_give)
			if(!(this_access in id_access))
				D.access |= this_access
				D.add_wildcards(list(this_access), mode = FORCE_ADD_ALL)
				did_upgrade = 1
		if(did_upgrade)
			add_fingerprint(user)
			to_chat(user, "<span class='notice'>An access type was added to your ID card.</span>")
		else
			to_chat(user, "<span class='notice'>Your ID card already has all the access this machine can give.</span>")
		return
	return ..()

/obj/machinery/computer/id_upgrader/away_sec
	name = "ID Upgrade Machine"
	desc = "An old computer, that can add access a the card"
	circuit = /obj/item/circuitboard/computer/id_upgrader/away_sec
	access_to_give = list(ACCESS_AWAY_SEC)

/obj/item/circuitboard/computer/id_upgrader/away_sec
	name = "Old Security ID Upgrade Machine circuit"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/computer/id_upgrader/away_sec
