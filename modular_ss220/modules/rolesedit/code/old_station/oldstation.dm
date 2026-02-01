//  old trims overrides and new one's

/datum/id_trim/away/old/sci
	sechud_icon_state = SECHUD_OLD_SCI

/datum/id_trim/away/old/robo
	sechud_icon_state = SECHUD_ROBOTICIST

/datum/id_trim/away/old/equipment
	sechud_icon_state = SECHUD_STATION_ENGINEER

/datum/id_trim/away/old/eng
	sechud_icon_state = SECHUD_OLD_ENG

/datum/id_trim/away/old/sec
	sechud_icon_state = SECHUD_OLD_SEC
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_SEC, ACCESS_WEAPONS)

// new medic
/datum/id_trim/away/old/med
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_MEDICAL)
	assignment = "Charlie Station Medic"
	sechud_icon_state = SECHUD_OLD_MED

// charlie captain's spare(cool id card with (probably)all necessary access
/datum/id_trim/away/old/captain
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_MAINTENANCE, ACCESS_AWAY_SUPPLY, ACCESS_AWAY_MEDICAL, ACCESS_AWAY_SCIENCE, ACCESS_AWAY_ENGINEERING, ACCESS_AWAY_SEC, ACCESS_AWAY_COMMAND, ACCESS_ENGINEERING, ACCESS_ENGINE_EQUIP, ACCESS_CONSTRUCTION, ACCESS_ROBOTICS, ACCESS_ORDNANCE, ACCESS_RESEARCH, ACCESS_MEDICAL, ACCESS_SECURITY, ACCESS_COMMAND, ACCESS_MINERAL_STOREROOM, ACCESS_WEAPONS)
	assignment = "Charlie Station Captain"
	sechud_icon_state = SECHUD_OLD_CAPTAIN
	big_pointer = TRUE

// id overrides

/obj/item/card/id/away/old
	name = "\proper a perfectly generic identification ID"
	desc = "A perfectly generic clip on ID Badge. Looks like it could use some flavor."
	icon= 'modular_ss220/modules/rolesedit/icons/old_station/card.dmi'
	icon_state = "retro"

/obj/item/card/id/away/old/sec
	name = "Charlie Station Security Officer's ID"
	desc = "A clip on ID Badge, has one of those fancy new magnetic strips built in. You can make out this one is encoded for the \"Security Dept\"."
	icon_state = "retro_sec"
	trim = /datum/id_trim/away/old/sec

/obj/item/card/id/away/old/sci
	name = "Charlie Station Scientist's ID"
	desc = "A clip on ID Badge, has one of those fancy new magnetic strips built in. You can make out this one is encoded for the \"Science Dept\"."
	icon_state = "retro_sci"
	trim = /datum/id_trim/away/old/sci

/obj/item/card/id/away/old/eng
	name = "Charlie Station Engineer's ID"
	desc = "A clip on ID Badge, has one of those fancy new magnetic strips built in. You can make out this one is encoded for the \"Engineering Dept\"."
	icon_state = "retro_eng"
	trim = /datum/id_trim/away/old/eng

/obj/item/card/id/away/old/equipment
	name = "Engineering Equipment Access"
	desc = "A special ID Badge that allows access to engineering equipment."
	trim = /datum/id_trim/away/old/equipment

/obj/item/card/id/away/old/robo
	name = "Delta Station Roboticist's ID"
	desc = "A clip on ID Badge, has one of those fancy new magnetic strips built in. You can make out this one is encoded for the \"Science Dept\". This one allows access to bots maintenance protocols."
	icon_state = "retro_sci"
	trim = /datum/id_trim/away/old/robo

//medic id
/obj/item/card/id/away/old/med
	name = "Charlie Station Medical ID"
	desc = "A clip on ID Badge, has one of those fancy new magnetic strips built in. This one is encoded for the \"Medical Dept\"."
	icon_state = "retro_med"
	trim = /datum/id_trim/away/old/med

// captain space id(in safe)
/obj/item/card/id/away/old/captains_spare
	name = "Charlie Station Spare Captain's ID"
	desc = "A clip on ID Badge, has one of those fancy new magnetic strips built in. This one is encoded for the \"High Command Dept\"."
	icon_state = "retro_nt"
	trim = /datum/id_trim/away/old/captain

// communications computer
/obj/machinery/computer/communications/old
	name = "charlie station communications console"
	icon_screen = "comm_monitor"
	icon_keyboard = "med_key"
	light_color = LIGHT_COLOR_GREEN
	circuit = /obj/item/circuitboard/computer/communications/old
	away = TRUE
	can_call_911 = FALSE
	req_access = null
	req_one_access = list(ACCESS_AWAY_COMMAND, ACCESS_COMMAND)

/obj/item/circuitboard/computer/communications/old
	name = "Station Communications"
	greyscale_colors = CIRCUIT_COLOR_COMMAND
	build_path = /obj/machinery/computer/communications/old

/obj/machinery/computer/communications/old/can_buy_shuttles(mob/user)
	return FALSE

/obj/machinery/computer/communications/old/authenticated_as_silicon_or_captain(mob/user)
	return FALSE

/obj/machinery/computer/communications/old/can_send_messages_to_other_sectors(mob/user)
	return FALSE

// comps overrides
//this because ds2/blackmarket maybe can spawn in sector, and try to steal data
/obj/machinery/computer/rdservercontrol
	req_access = list()
	req_one_access = list(ACCESS_RD, ACCESS_AWAY_SCIENCE)

//this because apc control can be deconstucted relocated from eng to other place
/obj/machinery/computer/apc_control
	req_access = list()
	req_one_access = list(ACCESS_CE, ACCESS_AWAY_ENGINEERING)

/obj/machinery/computer/apc_control/away
	req_one_access = list()

// misc computers for decoration
/obj/machinery/computer/broken
	name = "broken computer"
	desc = "A computer long since rendered non-functional due to lack of maintenance. Spitting out error messages."
	circuit = /obj/item/circuitboard/computer/broken
	icon_screen = "generic"
	icon_keyboard = "generic_key"

/obj/item/circuitboard/computer/broken
	build_path = /obj/machinery/computer/broken

/obj/machinery/computer/broken/cryo
	name = "old cryogenic oversight console"
	desc = "An interface between crew and the cryogenic storage oversight systems. This one looks broken."
	icon = 'modular_nova/modules/cryosleep/icons/cryogenics.dmi'
	icon_state = "cellconsole_1"
	pixel_x = 32
	icon_screen = null
	icon_keyboard = null
	circuit = /obj/item/circuitboard/computer

/obj/machinery/computer/broken/acc
	icon_screen = "accounts"
	icon_keyboard = "id_key"

/obj/machinery/computer/broken/com
	icon_screen = "comm_monitor"
	icon_keyboard = "med_key"

/obj/machinery/computer/broken/comlog
	icon_screen = "comm_logs"
	icon_keyboard = "tech_key"

/obj/machinery/computer/broken/sec
	icon_screen = "security"
	icon_keyboard = "security_key"

/obj/machinery/computer/broken/eng
	icon_screen = "command"
	icon_keyboard = "power_key"

/obj/machinery/computer/broken/atm
	icon_screen = "alert:2"
	icon_keyboard = "atmos_key"

// suits
/obj/item/clothing/under/retro
	desc = "A generic retro jumpsuit."
	name = "generic retro uniform"
	icon = 'modular_ss220/modules/rolesedit/icons/old_station/suit.dmi'
	icon_state = "retro_sec"
	worn_icon = 'modular_ss220/modules/rolesedit/icons/old_station/suitworn.dmi'
	can_adjust = FALSE
	armor_type = /datum/armor/clothing_under/retro


/obj/item/clothing/under/retro/sec
	desc = "A (now) retro corporate security jumpsuit."
	name = "retro security officer's uniform"
	icon_state = "retro_sec"
	armor_type = /datum/armor/clothing_under/retro/sec

/obj/item/clothing/under/retro/eng
	desc = "A (now) retro engineering uniform and overall combo. It's coated with oil, dust, and grit."
	name = "retro engineering uniform"
	icon_state = "retro_eng"
	armor_type = /datum/armor/clothing_under/retro/eng

/obj/item/clothing/under/retro/sci
	desc = "A (now) retro faded polo and set of distinct white slacks. What a ridiculous tie."
	name = "retro scientist's uniform"
	icon_state = "retro_sci"
	armor_type = /datum/armor/clothing_under/retro/sci

/obj/item/clothing/under/retro/med
	desc = "A (now) retro medical uniform. The high-vis stripes are faded and unreflective."
	name = "retro doctor's uniform"
	icon_state = "retro_med"
	armor_type = /datum/armor/clothing_under/retro/med


//damaged captains armor
/obj/item/clothing/head/helmet/space/damaged_captain
	name = "damaged captain's space helmet"
	icon = 'modular_ss220/modules/rolesedit/icons/old_station/spacehelm.dmi'
	worn_icon = 'modular_ss220/modules/rolesedit/icons/old_station/spacehelmworn.dmi'
	lefthand_file = 'modular_ss220/modules/rolesedit/icons/old_station/spacehelm_l.dmi'
	righthand_file = 'modular_ss220/modules/rolesedit/icons/old_station/spacehelm_r.dmi'
	icon_state = "broken-cap"
	inhand_icon_state = "broken-cap"
	desc = "A whole once special helmet designed for only the most fashionable of military figureheads, now it's a piece of damaged junk, and no longer provides what it used to."
	flags_inv = HIDEEARS| HIDEEYES
	clothing_flags = SNUG_FIT | STACKABLE_HELMET_EXEMPT
	cold_protection = 0
	min_cold_protection_temperature = 0
	heat_protection = 0
	slowdown = 0
	max_heat_protection_temperature = 0
	flags_cover = 0
	flash_protect = FLASH_PROTECTION_WELDER
	tint = 2
	armor_type = /datum/armor/damaged_captain_space

/obj/item/clothing/suit/space/damaged_captain
	name = "damaged captain's space suit"
	desc = "A old, bulky, heavy-duty piece of exclusive Nanotrasen armor. But... this suit not in charge anymore."
	icon = 'modular_ss220/modules/rolesedit/icons/old_station/spacesuit.dmi'
	worn_icon = 'modular_ss220/modules/rolesedit/icons/old_station/spacesuitworn.dmi'
	lefthand_file = 'modular_ss220/modules/rolesedit/icons/old_station/spacesuit_l.dmi'
	righthand_file = 'modular_ss220/modules/rolesedit/icons/old_station/spacesuit_r.dmi'
	icon_state = "broken-cap"
	inhand_icon_state = "broken-cap"
	armor_type = /datum/armor/damaged_captain_space
	flags_inv = null
	clothing_flags = 0
	slowdown = 4
	cell = null
	cold_protection = 0
	min_cold_protection_temperature = null
	heat_protection = 0
	max_heat_protection_temperature = null
	allowed = list(
		/obj/item/flashlight,
		/obj/item/tank/internals,
		/obj/item/tank/jetpack/captain,
		/obj/item/flashlight,
		/obj/item/gun/energy,
		/obj/item/gun/ballistic,
		/obj/item/melee/baton,
		/obj/item/restraints/handcuffs,
		)

// emergency captain suit(in safe, doesnt provide too much slowdown)
/obj/item/clothing/head/helmet/space/nasavoid/captain
	name = "Fancy Retro Void Helmet"
	desc = "A old but high tech, NASA Centcom branch designed space suit helmet. Used for emergency situations. This one is tagged - \"emergency captain's space helmet\"."
	icon = 'modular_ss220/modules/rolesedit/icons/old_station/spacehelm.dmi'
	worn_icon = 'modular_ss220/modules/rolesedit/icons/old_station/spacehelmworn.dmi'
	icon_state = "void-cap"
	lefthand_file = 'modular_ss220/modules/rolesedit/icons/old_station/spacehelm_l.dmi'
	righthand_file = 'modular_ss220/modules/rolesedit/icons/old_station/spacehelm_r.dmi'
	inhand_icon_state = "void-cap"
	slowdown = 0

/obj/item/clothing/suit/space/nasavoid/captain
	name = "Fancy NASA Void Suit"
	desc = "A old but high tech, NASA Centcom branch designed space suit. Used for emergency situations. This one is tagged - \"emergency captain's space suit\". This one made from wear-resistant materials, despite its old appearance, it has not degraded."
	icon = 'modular_ss220/modules/rolesedit/icons/old_station/spacesuit.dmi'
	worn_icon = 'modular_ss220/modules/rolesedit/icons/old_station/spacesuitworn.dmi'
	icon_state = "void-cap"
	lefthand_file = 'modular_ss220/modules/rolesedit/icons/old_station/spacesuit_l.dmi'
	righthand_file = 'modular_ss220/modules/rolesedit/icons/old_station/spacesuit_r.dmi'
	inhand_icon_state = "void-cap"
	slowdown = 1

/obj/item/clothing/head/helmet/space/nasavoid/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/radiation_protected_clothing)

/obj/item/clothing/suit/space/nasavoid/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/radiation_protected_clothing)

// outfit override
/datum/outfit/oldsec
	name = "Ancient Security"
	id = /obj/item/card/id/away/old/sec
	uniform = /obj/item/clothing/under/retro/sec
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/assembly/flash/handheld
	r_pocket = /obj/item/restraints/handcuffs

/datum/outfit/oldeng
	name = "Ancient Engineer"
	id = /obj/item/card/id/away/old/eng
	uniform = /obj/item/clothing/under/retro/eng
	gloves = /obj/item/clothing/gloves/color/fyellow/old
	shoes = /obj/item/clothing/shoes/workboots
	l_pocket = /obj/item/tank/internals/emergency_oxygen
	r_pocket = /obj/item/blueprints/oldstation/eng

/datum/outfit/oldsci
	name = "Ancient Scientist"
	id = /obj/item/card/id/away/old/sci
	uniform = /obj/item/clothing/under/retro/sci
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/laceup
	l_pocket = /obj/item/stack/medical/bruise_pack

//medic outfit
/datum/outfit/oldmed
	name = "Ancient Medic"
	id = /obj/item/card/id/away/old/med
	uniform = /obj/item/clothing/under/retro/med
	gloves = /obj/item/clothing/gloves/latex
	shoes = /obj/item/clothing/shoes/sneakers/white
	l_pocket = /obj/item/stack/medical/ointment
	r_pocket = /obj/item/stack/medical/bruise_pack


//post equip code
/datum/outfit/oldsec/post_equip(mob/living/carbon/human/nt, visualsOnly = FALSE)
	var/obj/item/card/id/id_card = nt.wear_id
	if(istype(id_card))
		id_card.registered_name = nt.real_name
		id_card.update_label()
		id_card.update_icon()

	return ..()

/datum/outfit/oldeng/post_equip(mob/living/carbon/human/nt, visualsOnly = FALSE)
	var/obj/item/card/id/id_card = nt.wear_id
	if(istype(id_card))
		id_card.registered_name = nt.real_name
		id_card.update_label()
		id_card.update_icon()

	return ..()

/datum/outfit/oldsci/post_equip(mob/living/carbon/human/nt, visualsOnly = FALSE)
	var/obj/item/card/id/id_card = nt.wear_id
	if(istype(id_card))
		id_card.registered_name = nt.real_name
		id_card.update_label()
		id_card.update_icon()

	return ..()

/datum/outfit/oldmed/post_equip(mob/living/carbon/human/nt, visualsOnly = FALSE)
	var/obj/item/card/id/id_card = nt.wear_id
	if(istype(id_card))
		id_card.registered_name = nt.real_name
		id_card.update_label()
		id_card.update_icon()

	return ..()

//spawner override

/obj/effect/mob_spawn/ghost_role/human/oldstation
	allow_custom_character = GHOSTROLE_TAKE_PREFS_APPEARANCE
	restricted_species = list(/datum/species/human, /datum/species/human/felinid, /datum/species/synthetic)

/obj/effect/mob_spawn/ghost_role/human/oldstation/eng
	restricted_species = list(/datum/species/human, /datum/species/human/felinid, /datum/species/synthetic)

/obj/effect/mob_spawn/ghost_role/human/oldstation/sci
	restricted_species = list(/datum/species/human, /datum/species/human/felinid, /datum/species/synthetic)

/obj/effect/mob_spawn/ghost_role/human/oldstation/sec
	restricted_species = list(/datum/species/human, /datum/species/human/felinid, /datum/species/synthetic)


//medic spawner
/obj/effect/mob_spawn/ghost_role/human/oldstation/med
	desc = "A humming cryo pod. You can barely recognise an medical uniform underneath the built up ice. The machine is attempting to wake up its occupant."
	prompt_name = "a medical doctor"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	you_are_text = "You are a medical doctor working for Nanotrasen, stationed onboard a state of the art research station."
	outfit = /datum/outfit/oldmed
	restricted_species = list(/datum/species/human, /datum/species/human/felinid, /datum/species/synthetic)

// medic closet(for beta station)

/obj/structure/closet/secure_closet/old_med
	name = "medical closet"
	desc = "Filled with medical junk."
	icon_state = "med"
	req_access = list(ACCESS_AWAY_MEDICAL)

/obj/structure/closet/secure_closet/old_med/PopulateContents()
	..()
	new /obj/item/clothing/head/utility/surgerycap(src)
	new /obj/item/clothing/gloves/latex/nitrile(src)
	new /obj/item/clothing/mask/breath/medical(src)
	new /obj/item/reagent_containers/hypospray/medipen/atropine(src)
	new /obj/item/clothing/head/bio_hood/general(src)
	new /obj/item/clothing/suit/bio_suit/general(src)
	new /obj/item/clothing/suit/toggle/labcoat/medical(src)
	new /obj/item/storage/box/masks(src)

/obj/structure/showcase/machinery/oldpod/used
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper-open"

//skillchips
/obj/item/skillchip/job/oldstation
	name = "Prototype skillchip"
	desc = "Endorsed by the Nanotrasen Navy."
	complexity = 2
	abstract_parent_type = /obj/item/skillchip/job/oldstation

/obj/item/skillchip/job/oldstation/engineering
	name = "Prototype Engineering C0-RCU-1T-N11H5M2R1 skillchip"
	desc = "Endorsed by the Chief Engineer of the Nanotrasen Navy and the Head Janitor himself."
	auto_traits = list(TRAIT_KNOW_ENGI_WIRES, TRAIT_LIGHTBULB_REMOVER)
	skill_name = "Combined Engineering Circuitry / Lightbulb Removing skills Beta"
	skill_description = "Recognise airlock and APC wire layouts and understand their functionality at a glance and also stop failing taking out lightbulbs, even without gloves!"
	skill_icon = "sitemap"
	activate_message = span_notice("You suddenly comprehend the secrets behind airlock and APC circuitry and your pain recentors in hands seems less sensetive to hot objects.")
	deactivate_message = span_notice("Airlock and APC circuitry stops making sense as images of coloured wires fade from your mind... And you feel like hot objects could stop you again...")

/obj/item/skillchip/job/oldstation/medical
	name = "Prototype Medical SRX-4H912T skillchip"
	desc = "A skillchip containing 'new' Nanotrasen medical training protocols, boosting overall medical efficiency. Endorsed by the Nanotrasen Navy Security and Medical ERTs."
	auto_traits = list(TRAIT_MADNESS_IMMUNE, TRAIT_ENTRAILS_READER, TRAIT_SELF_SURGERY)
	skill_name = "Medic++"
	skill_description = "Become a real field doctor in an instant!"
	skill_icon = FA_ICON_USER_DOCTOR
	activate_message = span_notice("You realize that your surgical skills have become noticeably better and also there's nothing stopping you from performing surgery on yourself.")
	deactivate_message = span_notice("You suddenly feel like your medical skills are fading.")
	slot_use = 3

/obj/item/skillchip/job/oldstation/medical/on_activate(mob/living/carbon/user, silent)
	. = ..()
	RegisterSignal(user, COMSIG_LIVING_INITIATE_SURGERY_STEP, PROC_REF(apply_surgery_buff))

/obj/item/skillchip/job/oldstation/medical/on_deactivate(mob/living/carbon/user, silent)
	. = ..()
	UnregisterSignal(user, COMSIG_LIVING_INITIATE_SURGERY_STEP)

/obj/item/skillchip/job/oldstation/medical/proc/apply_surgery_buff(mob/living/carbon/_source, mob/living/user, mob/living/target, target_zone, obj/item/tool, datum/surgery/surgery, datum/surgery_step/step, list/modifiers)
	SIGNAL_HANDLER
	if(user != target)
		modifiers[FAIL_PROB_INDEX] -= 10
		modifiers[SPEED_MOD_INDEX] *= 0.9

//blueprints
#define LEGEND_VIEWING_LIST "watching_list"
///The blueprints are on the main page.
#define LEGEND_OFF "off"

/obj/item/blueprints/oldstation
	name = "A.B.C.D stations blueprints"
	desc = "Blueprints of the complex of stations. There is a \"Nanotrasen Navy - Classified\" stamp and some old coffee stains on it."
	fluffnotice = "Property of Nanotrasen Navy. For heads of staff or engineering personnel only. Store in high-secure storage."

/obj/item/blueprints/oldstation/ui_static_data(mob/user)
	var/list/data = list()
	data["legend_viewing_list"] = LEGEND_VIEWING_LIST
	data["legend_off"] = LEGEND_OFF
	data["fluff_notice"] = fluffnotice
	data["station_name"] = "Nanotrasen Station Complex - Alpha, Beta, Charlie, Delta."
	data["wire_devices"] = list()
	for(var/wireset in GLOB.wire_color_directory)
		data["wire_devices"] += list(list(
			"name" = GLOB.wire_name_directory[wireset],
			"ref" = wireset,
		))
	return data

/obj/item/blueprints/oldstation/eng
	name = "Crude copy of A.B.C.D stations blueprints"
	desc = "Small crude copy of stations complex blueprints. It contain information about some wires, that are likely to help in the maintenance of the airlocks and other electronic devices."
	icon_state = "shuttle_blueprints_crude1"
	w_class = WEIGHT_CLASS_SMALL

#undef LEGEND_VIEWING_LIST
#undef LEGEND_OFF
