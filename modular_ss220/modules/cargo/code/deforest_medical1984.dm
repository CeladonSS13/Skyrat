/datum/supply_pack/companies/deforest
	group = DEFOREST_MEDICAL_NAME_1984
	special = FALSE // required to be shown in cargo
	special_enabled = TRUE // required to be shown in cargo
	dangerous = FALSE // required to be shown in cargo

// Precompiled first aid kits, ready to go if you don't want to bother getting individual items

/datum/supply_pack/companies/deforest/first_aid_kit/civil_defense/comfort
	contains = list(/obj/item/storage/medkit/civil_defense/comfort/stocked)
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/deforest/first_aid_kit/civil_defense
	contains = list(/obj/item/storage/medkit/civil_defense/stocked)
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/deforest/first_aid_kit/frontier
	contains = list(/obj/item/storage/medkit/frontier/stocked)
	cost = PAYCHECK_COMMAND * 7

/datum/supply_pack/companies/deforest/first_aid_kit/combat_surgeon
	contains = list(/obj/item/storage/medkit/combat_surgeon/stocked)
	cost = PAYCHECK_COMMAND * 7

/datum/supply_pack/companies/deforest/first_aid_kit/robo_repair
	contains = list(/obj/item/storage/medkit/robotic_repair/stocked)
	cost = PAYCHECK_COMMAND * 7

/datum/supply_pack/companies/deforest/first_aid_kit/robo_repair_super
	contains = list(/obj/item/storage/medkit/robotic_repair/preemo/stocked)
	cost = PAYCHECK_COMMAND * 16

/datum/supply_pack/companies/deforest/first_aid_kit/first_responder
	contains = list(/obj/item/storage/backpack/duffelbag/deforest_surgical/stocked)
	cost = PAYCHECK_COMMAND * 21

/datum/supply_pack/companies/deforest/first_aid_kit/orange_satchel
	contains = list(/obj/item/storage/backpack/duffelbag/deforest_medkit/stocked)
	cost = PAYCHECK_COMMAND * 19

/datum/supply_pack/companies/deforest/first_aid_kit/technician_satchel
	contains = list(/obj/item/storage/backpack/duffelbag/deforest_paramedic/stocked)
	cost = PAYCHECK_COMMAND * 32

// Basic first aid supplies like gauze, sutures, mesh, so on

/datum/supply_pack/companies/deforest/first_aid/bandage
	contains = list(/obj/item/stack/medical/bandage)
	cost = PAYCHECK_LOWER * 3

/datum/supply_pack/companies/deforest/first_aid/normal_sutures
	contains = list(/obj/item/stack/medical/suture)
	cost = PAYCHECK_LOWER * 5

/datum/supply_pack/companies/deforest/first_aid/bloody_sutures
	contains = list(/obj/item/stack/medical/suture/bloody)
	cost = PAYCHECK_LOWER * 8

/datum/supply_pack/companies/deforest/first_aid/coagulant
	contains = list(/obj/item/stack/medical/suture/coagulant)
	cost = PAYCHECK_LOWER * 10

/datum/supply_pack/companies/deforest/first_aid/medicated_sutures
	contains = list(/obj/item/stack/medical/suture/medicated)
	cost = PAYCHECK_LOWER * 15

/datum/supply_pack/companies/deforest/first_aid/red_sun
	contains = list(/obj/item/stack/medical/ointment/red_sun)
	cost = PAYCHECK_LOWER * 3

/datum/supply_pack/companies/deforest/first_aid/ointment
	contains = list(/obj/item/stack/medical/ointment)
	cost = PAYCHECK_LOWER * 5

/datum/supply_pack/companies/deforest/first_aid/mesh
	contains = list(/obj/item/stack/medical/mesh)
	cost = PAYCHECK_LOWER * 6

/datum/supply_pack/companies/deforest/first_aid/advanced_mesh
	contains = list(/obj/item/stack/medical/mesh/advanced)
	cost = PAYCHECK_LOWER * 15

/datum/supply_pack/companies/deforest/first_aid/sterile_gauze
	contains = list(/obj/item/stack/medical/gauze)
	cost = PAYCHECK_LOWER * 4

/datum/supply_pack/companies/deforest/first_aid/sterile_gauze
	contains = list(/obj/item/stack/medical/gauze/sterilized)
	cost = PAYCHECK_LOWER * 6

/datum/supply_pack/companies/deforest/first_aid/amollin
	contains = list(/obj/item/storage/pill_bottle/painkiller)
	cost = PAYCHECK_CREW * 10

/datum/supply_pack/companies/deforest/first_aid/robo_patch
	contains = list(/obj/item/stack/medical/synth_repair)
	cost = PAYCHECK_CREW * 3

/datum/supply_pack/companies/deforest/first_aid/bandaid
	contains = list(/obj/item/storage/box/bandages)
	cost = PAYCHECK_CREW * 4

/datum/supply_pack/companies/deforest/first_aid/subdermal_splint
	contains = list(/obj/item/stack/medical/wound_recovery)
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/companies/deforest/first_aid/rapid_coagulant
	contains = list(/obj/item/stack/medical/wound_recovery/rapid_coagulant)
	cost = PAYCHECK_COMMAND * 8

/datum/supply_pack/companies/deforest/first_aid/robofoam
	contains = list(/obj/item/stack/medical/wound_recovery/robofoam)
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/companies/deforest/first_aid/super_robofoam
	contains = list(/obj/item/stack/medical/wound_recovery/robofoam_super)
	cost = PAYCHECK_COMMAND * 8

/datum/supply_pack/companies/deforest/first_aid/mannitol
	contains = list(/obj/item/storage/pill_bottle/mannitol)
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/deforest/first_aid/neurine
	contains = list(/obj/item/storage/pill_bottle/neurine)
	cost = PAYCHECK_COMMAND * 8

/datum/supply_pack/companies/deforest/neuroware
	cost = PAYCHECK_CREW * 3

/datum/supply_pack/companies/deforest/neuroware/reset
	contains = list(/obj/item/disk/neuroware/reset)

/datum/supply_pack/companies/deforest/neuroware/brain
	contains = list(/obj/item/disk/neuroware/brain)

/datum/supply_pack/companies/deforest/neuroware/morphine
	contains = list(/obj/item/disk/neuroware/morphine)

/datum/supply_pack/companies/deforest/neuroware/lidocaine
	contains = list(/obj/item/disk/neuroware/lidocaine)

/datum/supply_pack/companies/deforest/neuroware/neuroware/happiness
	contains = list(/obj/item/disk/neuroware/happiness)

/datum/supply_pack/companies/deforest/neuroware/synaptizine
	contains = list(/obj/item/disk/neuroware/synaptizine)

/datum/supply_pack/companies/deforest/neuroware/psicodine
	contains = list(/obj/item/disk/neuroware/psicodine)

// Autoinjectors for healing
/datum/supply_pack/companies/deforest/medpens
	cost = PAYCHECK_LOWER * 6

/datum/supply_pack/companies/deforest/medpens/occuisate
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/occuisate)

/datum/supply_pack/companies/deforest/medpens/morpital
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/morpital)

/datum/supply_pack/companies/deforest/medpens/lipital
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/lipital)

/datum/supply_pack/companies/deforest/medpens/meridine
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/meridine)

/datum/supply_pack/companies/deforest/medpens/calopine
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/calopine)

/datum/supply_pack/companies/deforest/medpens/coagulants
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/coagulants)

/datum/supply_pack/companies/deforest/medpens/lepoturi
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/lepoturi)

/datum/supply_pack/companies/deforest/medpens/psifinil
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/psifinil)

/datum/supply_pack/companies/deforest/medpens/halobinin
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/halobinin)

/datum/supply_pack/companies/deforest/medpens/robo_solder
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/robot_liquid_solder)

/datum/supply_pack/companies/deforest/medpens/robo_cleaner
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/robot_system_cleaner)

// Autoinjectors for fighting

/datum/supply_pack/companies/deforest/medpens_stim
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/deforest/medpens_stim/adrenaline
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/adrenaline)

/datum/supply_pack/companies/deforest/medpens_stim/pentibinin
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/pentibinin)

/datum/supply_pack/companies/deforest/medpens_stim/synephrine
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/synephrine)

/datum/supply_pack/companies/deforest/medpens_stim/krotozine
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/krotozine)

/datum/supply_pack/companies/deforest/medpens_stim/aranepaine
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/aranepaine)
	cost = PAYCHECK_COMMAND * 7
	contraband = TRUE

/datum/supply_pack/companies/deforest/medpens_stim/synalvipitol
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/synalvipitol)
	cost = PAYCHECK_COMMAND * 10
	contraband = TRUE

/datum/supply_pack/companies/deforest/medpens_stim/twitch
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/twitch)
	cost = PAYCHECK_COMMAND * 12
	contraband = TRUE

/datum/supply_pack/companies/deforest/medpens_stim/demoneye
	contains = list(/obj/item/reagent_containers/hypospray/medipen/deforest/demoneye)
	cost = PAYCHECK_COMMAND * 12
	contraband = TRUE

// Equipment, from defibs to scanners to surgical tools

/datum/supply_pack/companies/deforest/equipment
	cost = PAYCHECK_LOWER

/datum/supply_pack/companies/deforest/equipment/wound_analyzer
	contains = list(/obj/item/healthanalyzer/simple)

/datum/supply_pack/companies/deforest/equipment/disease_analyzer
	contains = list(/obj/item/healthanalyzer/simple/disease)

/datum/supply_pack/companies/deforest/equipment/health_analyzer
	contains = list(/obj/item/healthanalyzer)
	cost = PAYCHECK_LOWER * 3

/datum/supply_pack/companies/deforest/equipment/advanced_health_analyer
	contains = list(/obj/item/healthanalyzer/advanced)
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/deforest/equipment/treatment_zone_projector
	contains = list(/obj/item/holosign_creator/medical/treatment_zone)
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/deforest/equipment/loaded_defib
	contains = list(/obj/item/defibrillator/loaded)
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/deforest/equipment/surgical_tools
	contains = list(/obj/item/surgery_tray/full)
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/deforest/equipment/penlite_defib_mount
	contains = list(/obj/item/wallframe/defib_mount/charging)
	cost = PAYCHECK_CREW * 7

/datum/supply_pack/companies/deforest/equipment/advanced_scalpel
	contains = list(/obj/item/scalpel/advanced)
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/companies/deforest/equipment/advanced_retractor
	contains = list(/obj/item/retractor/advanced)
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/companies/deforest/equipment/advanced_cautery
	contains = list(/obj/item/cautery/advanced)
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/companies/deforest/equipment/medigun_upgrade
	contains = list(/obj/item/device/custom_kit/medigun_fastcharge)
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/companies/deforest/equipment/hypospray_upgrade
	contains = list(/obj/item/device/custom_kit/deluxe_hypo2)
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/companies/deforest/equipment/afad
	contains = list(/obj/item/gun/medbeam/afad)
	cost = PAYCHECK_COMMAND * 10

/datum/supply_pack/companies/deforest/equipment/medstation
	contains = list(/obj/item/wallframe/frontier_medstation)
	cost = PAYCHECK_COMMAND * 12

/datum/supply_pack/companies/deforest/equipment/cyber_repair_paste
	contains = list(/obj/item/cybernetic_repair_paste)
	cost = PAYCHECK_COMMAND * 3

// Advanced implants, some of these can be printed but this is a way to get them before tech if you REALLY wanted

/datum/supply_pack/companies/deforest/cyber_implants
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/deforest/cyber_implants/razorwire
	name = "Razorwire Spool Implant"
	contains = list(/obj/item/organ/cyberimp/arm/toolkit/razorwire)
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/companies/deforest/cyber_implants/shell_launcher
	name = "Shell Launch System Implant"
	contains = list(/obj/item/organ/cyberimp/arm/toolkit/shell_launcher)
	cost = PAYCHECK_COMMAND * 8
	contraband = TRUE

/datum/supply_pack/companies/deforest/cyber_implants/sandy
	name = "Qani-Laaca Sensory Computer Implant"
	contains = list(/obj/item/organ/cyberimp/sensory_enhancer)
	cost = PAYCHECK_COMMAND * 15
	contraband = TRUE

/datum/supply_pack/companies/deforest/cyber_implants/hackerman
	name = "Binyat Wireless Hacking System Implant"
	contains = list(/obj/item/organ/cyberimp/hackerman_deck)
	cost = PAYCHECK_COMMAND * 20
	contraband = TRUE

// Modsuit Modules from the medical category, here instead of in Nakamura because nobody buys from this company

/datum/supply_pack/companies/deforest/medical_modules
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/deforest/medical_modules/injector
	name = "MOD injector module"
	contains = list(/obj/item/mod/module/injector)

/datum/supply_pack/companies/deforest/medical_modules/organizer
	name = "MOD organizer module"
	contains = list(/obj/item/mod/module/organizer)

/datum/supply_pack/companies/deforest/medical_modules/patient_transport
	name = "MOD patient transport module"
	contains = list(/obj/item/mod/module/criminalcapture/patienttransport)

/datum/supply_pack/companies/deforest/medical_modules/thread_ripper
	name = "MOD thread ripper module"
	contains = list(/obj/item/mod/module/thread_ripper)

/datum/supply_pack/companies/deforest/medical_modules/surgical_processor
	name = "MOD surgical processor module"
	contains = list(/obj/item/mod/module/surgical_processor)

/datum/supply_pack/companies/deforest/medical_modules/quick_carry
	name = "MOD quick carry module"
	contains = list(/obj/item/mod/module/quick_carry)
