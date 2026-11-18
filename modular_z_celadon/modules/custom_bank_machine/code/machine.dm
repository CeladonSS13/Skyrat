// card code
/obj/item/card/id/departmental_budget
	var/budget_name = " Civilian Budget"
	var/radio_channel = RADIO_CHANNEL_COMMAND
	var/departament_access = ACCESS_CAPTAIN
	var/away = FALSE

/obj/item/card/id/departmental_budget/car
	budget_name = "Cargo Budget"
	departament_access = ACCESS_QM
	radio_channel = RADIO_CHANNEL_SUPPLY

/obj/item/card/id/departmental_budget/med
	budget_name = "Medical Budget"
	departament_access = ACCESS_CMO
	radio_channel = RADIO_CHANNEL_MEDICAL

/obj/item/card/id/departmental_budget/eng
	budget_name = "Engineering Budget"
	departament_access = ACCESS_CE
	radio_channel = RADIO_CHANNEL_ENGINEERING

/obj/item/card/id/departmental_budget/sci
	budget_name = "Scientific Budget"
	departament_access = ACCESS_RD
	radio_channel = RADIO_CHANNEL_SCIENCE

/obj/item/card/id/departmental_budget/srv
	budget_name = "Service Budget"
	departament_access = ACCESS_HOP
	radio_channel = RADIO_CHANNEL_SERVICE

/obj/item/card/id/departmental_budget/sec
	budget_name = "Defense Budget"
	departament_access = ACCESS_HOS
	radio_channel = RADIO_CHANNEL_SECURITY

/obj/item/card/id/departmental_budget/com
	budget_name = "Command Budget"
	departament_access = ACCESS_CENT_GENERAL
	radio_channel = RADIO_CHANNEL_CENTCOM

/obj/item/card/id/departmental_budget/centcom
	budget_name = "Central Command Budget"
	departament_access = ACCESS_CENT_OFFICER
	radio_channel = RADIO_CHANNEL_CENTCOM

//away
/obj/item/card/id/departmental_budget/interdyne
	budget_name = "Interdyne Pharmaceuticals"
	radio_channel = RADIO_CHANNEL_INTERDYNE
	departament_access = ACCESS_SYNDICATE_IP
	away = TRUE

/obj/item/card/id/departmental_budget/ds2
	budget_name = "Syndicate - Deep Space"
	radio_channel = RADIO_CHANNEL_INTERDYNE //before i add ds2 freq
	departament_access = ACCESS_SYNDICATE_DS
	away = TRUE

/obj/item/card/id/departmental_budget/tarkon
	budget_name = "Port Tarkon"
	radio_channel = RADIO_CHANNEL_TARKON
	departament_access = ACCESS_TARKON
	away = TRUE

//circut and console code
/obj/item/circuitboard/computer/custom_bankmachine
	name = "Bank Machine Console"
	greyscale_colors = CIRCUIT_COLOR_COMMAND
	build_path = /obj/machinery/computer/custom_bank_machine

/obj/machinery/computer/custom_bank_machine
	name = "advanced bank machine - not authorized"
	desc = "A machine used to deposit and withdraw station funds."
	circuit = /obj/item/circuitboard/computer/custom_bankmachine
	icon_screen = "vault"
	icon_keyboard = "security_key"
	req_access = list()
	var/siphoning = FALSE
	var/syphoning_credits = 0
	var/unauthorized = FALSE
	var/next_warning = 0
	var/minimum_time_between_warnings = 15 SECONDS

	var/obj/item/radio/radio
	var/radio_key = /obj/item/encryptionkey/debug // because ghost role account have not standart freq
	var/radio_channel = RADIO_CHANNEL_COMMON

	var/account_department = null
	var/budget_name = ""
	var/gps = FALSE
	var/away = FALSE

	var/datum/bank_account/synced_bank_account

/obj/machinery/computer/custom_bank_machine/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.keyslot = new radio_key
	radio.subspace_transmission = FALSE
	radio.canhear_range = 0
	radio.set_listening(FALSE)
	radio.recalculateChannels()
	if(account_department)
		synced_bank_account = SSeconomy.get_dep_account(account_department)
	else
		say("Please authorize console to budget bank card")

/obj/machinery/computer/custom_bank_machine/Destroy()
	QDEL_NULL(radio)
	synced_bank_account = null
	return ..()

/obj/machinery/computer/custom_bank_machine/attackby(obj/item/weapon, mob/user, list/modifiers, list/attack_modifiers)
	var/value = 0
	if(istype(weapon, /obj/item/stack/spacecash))
		var/obj/item/stack/spacecash/inserted_cash = weapon
		value = inserted_cash.value * inserted_cash.amount
	else if(istype(weapon, /obj/item/holochip))
		var/obj/item/holochip/inserted_holochip = weapon
		value = inserted_holochip.credits
	else if(istype(weapon, /obj/item/coin))
		var/obj/item/coin/inserted_coin = weapon
		value = inserted_coin.value
	else if(istype(weapon, /obj/item/card/id/departmental_budget))
		var/obj/item/card/id/departmental_budget/card = weapon
		if(siphoning)
			say("Credit withdrawal halted - account changed.")
			end_siphon()
		if(card.department_ID)
			account_department = card.department_ID
			synced_bank_account = SSeconomy.get_dep_account(account_department)
		else
			say("Critical error acquired! No budget id detected!")
			return ..()
		if(card.budget_name)
			budget_name = card.budget_name
			name = "advanced bank machine - " + card.budget_name
		else
			say("Not critical error acquired! No account name detected!")
		if(card.radio_channel)
			radio_channel = card.radio_channel
			radio.recalculateChannels()
		else
			say("Not critical error acquired! Radio channel not set!")
		if(card.departament_access)
			req_access = list(card.departament_access)
		else
			say("Error acquired! Bank account not protected!")
		away=card.away
		if(!card.away && !gps)
			AddComponent(/datum/component/gps, "Cash Signal")
			gps = TRUE
			say("Console bluespace protection enabled! GPS signal dispatched.")

	if(value)
		if(synced_bank_account)
			synced_bank_account.adjust_money(value)
			say("Credits deposited! The [synced_bank_account.account_holder] is now [synced_bank_account.account_balance] cr.")
			qdel(weapon)
		else
			say("Credits cannot be deposited! The Vault not linked to bank account.")
		return

	return ..()

/obj/machinery/computer/custom_bank_machine/process(seconds_per_tick)
	. = ..()
	if(!siphoning || !synced_bank_account)
		return
	if (machine_stat & (BROKEN | NOPOWER))
		say("Insufficient power. Halting siphon.")
		end_siphon()
		return
	var/siphon_am = 100 * seconds_per_tick
	if(!synced_bank_account.has_money(siphon_am))
		say("[synced_bank_account.account_holder] depleted. Halting siphon.")
		end_siphon()
		return

	playsound(src, 'sound/items/poster/poster_being_created.ogg', 100, TRUE)
	syphoning_credits += siphon_am
	synced_bank_account.adjust_money(-siphon_am)
	if(next_warning < world.time && prob(15))
		var/area/A = get_area(loc)
		var/message = "[unauthorized ? "Unauthorized c" : "C"]redit withdrawal underway in [initial(A.name)][unauthorized ? "!!" : "..."]"
		radio.talk_into(src, message, radio_channel)
		if(!away && unauthorized)
			if(radio_channel != RADIO_CHANNEL_SECURITY)
				radio.talk_into(src, message, RADIO_CHANNEL_SECURITY)
			if(radio_channel != RADIO_CHANNEL_COMMAND)
				radio.talk_into(src, message, RADIO_CHANNEL_COMMAND)
		next_warning = world.time + minimum_time_between_warnings

/obj/machinery/computer/custom_bank_machine/ui_interact(mob/user, datum/tgui/ui)
	. = ..()
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "BankMachine", name)
		ui.open()

/obj/machinery/computer/custom_bank_machine/ui_data(mob/user)
	var/list/data = list()

	data["current_balance"] = synced_bank_account?.account_balance || 0
	data["siphoning"] = siphoning
	if(!synced_bank_account)
		data["station_name"] = "Not Linked to"
	else if(away)
		data["station_name"] = " " + budget_name
	else
		data["station_name"] = station_name() + " " + budget_name

	return data

/obj/machinery/computer/custom_bank_machine/ui_act(action, params, datum/tgui/ui)
	. = ..()
	if(.)
		return

	switch(action)
		if("siphon")
			if(!synced_bank_account)
				say("Error: Console doesnt have linked account, withdrawal cannot begin.")
				. = TRUE
			else if(is_station_level(src.z) || is_centcom_level(src.z) || away)
				say("Siphon of station credits has begun!")
				start_siphon(ui.user)
			else
				say("Error: Console not in reach of station, withdrawal cannot begin.")
			. = TRUE
		if("halt")
			say("Station credit withdrawal halted.")
			end_siphon()
			. = TRUE

/obj/machinery/computer/custom_bank_machine/on_changed_z_level()
	. = ..()
	if(siphoning)
		say("Error: Console changed location. Connection severed, siphon halted .")
		end_siphon()

/obj/machinery/computer/custom_bank_machine/proc/end_siphon()
	siphoning = FALSE
	unauthorized = FALSE
	var/atom/droploc = drop_location()
	for(var/cash_typepath in credits_to_spacecash(syphoning_credits))
		new cash_typepath(droploc)
	syphoning_credits = 0

/obj/machinery/computer/custom_bank_machine/proc/start_siphon(mob/living/carbon/user)
	var/obj/item/card/id/card = user.get_idcard(hand_first = TRUE)
	var/obj/item/card/id/card_reserv = user.get_idcard(hand_first = FALSE)
	if(istype(card) && check_access(card))
		unauthorized = FALSE
	else if(istype(card_reserv) && check_access(card_reserv))
		unauthorized = FALSE
	else
		unauthorized = TRUE
	siphoning = TRUE

#define TECHWEB_NODE_CUSTOM_BANK "custom_bank"

/datum/design/board/bankmachine_custom
	name = "Advanced Bank Machine Board"
	desc = "Allows for the construction of circuit boards used to build a Departamental Bank Machine."
	id = "custom_bank"
	build_path = /obj/item/circuitboard/computer/custom_bankmachine
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_COMMAND
	)

/datum/techweb_node/bankmachine_custom
	id = TECHWEB_NODE_CUSTOM_BANK
	display_name = "Advanced Bank Console"
	description = "Special console that able to connect to departamental bank accounts."
	prereq_ids = list(TECHWEB_NODE_CONSOLES, TECHWEB_NODE_BLUESPACE_TRAVEL)
	design_ids = list(
		"custom_bank",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)
	announce_channels = list(RADIO_CHANNEL_COMMAND)
