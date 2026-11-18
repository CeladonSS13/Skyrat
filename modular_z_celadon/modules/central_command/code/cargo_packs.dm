/datum/supply_pack/centcom
	crate_type = /obj/structure/closet/crate/secure/centcom
	console_flag = CARGO_CONSOLE_NT_CENTCOM
	access_view = ACCESS_CENT_GENERAL


/datum/supply_pack/centcom/imports
	group = "Imports"

/datum/supply_pack/centcom/imports/clear_pda
	name = "Mint Condition Nanotrasen Clear PDA"
	desc = "Mint condition, freshly repackaged! A valuable collector's item normally valued at over 2.5 million credits, now available for a steal!"
	cost = CARGO_CRATE_VALUE * 500
	contains = list(/obj/item/modular_computer/pda/clear)

/datum/supply_pack/centcom/security
	group = "Security"

//security overrides



/datum/supply_pack/centcom/armory
	group = "Armory"
	access = ACCESS_CENT_SECURITY


//weapons

//surplus
/datum/supply_pack/centcom/armory/wt550
	name = "WT-550 Crate"
	desc = "A crate of WT-550 security rifles with ammunition."
	cost = CARGO_CRATE_VALUE * 15
	contains = list(
		/obj/item/gun/ballistic/automatic/wt550 = 3,
		/obj/item/ammo_box/magazine/wt550m9 = 3,
		/obj/item/ammo_box/magazine/wt550m9/rub = 3,
	)

/datum/supply_pack/centcom/armory/recharge_laser
	name = "NT laser rifle"
	desc = "A prototype of laser rifle, uses power packs as magasine."
	cost = CARGO_CRATE_VALUE * 100
	contains = list(/obj/item/gun/ballistic/automatic/laser)

/datum/supply_pack/centcom/armory/recharge_laser_ammo
	name = "NT laser rifle power packs"
	desc = "A special power cells for a prototype laser rifle."
	cost = CARGO_CRATE_VALUE * 75
	contains = list(/obj/item/ammo_box/magazine/recharge = 3)

//shotguns
/datum/supply_pack/centcom/armory/shotgun
	name = "Riot Shotguns Crate"
	desc = "Three 12ga riot shotguns, with matching bandoliers for each."
	cost = CARGO_CRATE_VALUE * 10
	contains = list(
		/obj/item/gun/ballistic/shotgun/riot = 3,
		/obj/item/storage/belt/bandolier = 3,
	)

/datum/supply_pack/centcom/armory/shotgun/combat
	name = "Combat Shotguns Crate"
	desc = "Three 12ga combat shotguns, with matching bandoliers for each."
	cost = CARGO_CRATE_VALUE * 20
	contains = list(
		/obj/item/gun/ballistic/shotgun/automatic/combat = 3,
		/obj/item/storage/belt/bandolier = 3,
	)

/datum/supply_pack/centcom/armory/shotgun/compact
	name = "Compact Combat Shotgun"
	desc = "A compact version of the semi automatic combat shotgun. Lower magazine capacity, but more easily carried."
	cost = CARGO_CRATE_VALUE * 20
	contains = list(
		/obj/item/gun/ballistic/shotgun/automatic/combat/compact)

/datum/supply_pack/centcom/armory/shotgun/dual_tube
	name = "Dual tube shotgun"
	desc = "An advanced shotgun with two separate magazine tubes."
	cost = CARGO_CRATE_VALUE * 75
	contains = list(/obj/item/gun/ballistic/shotgun/automatic/dual_tube)

/datum/supply_pack/centcom/armory/shotgun/katyusha
	name = "Katyusha NanoTrasen shotgun gunset"
	desc = "A mag-fed shotgun for combat in narrow corridors, nicknamed 'Katyusha' by the blueshields for its versatility. Compatible only with specialized drum magazines."
	cost = CARGO_CRATE_VALUE * 125
	contains = list(
		/obj/item/storage/toolbox/guncase/nova/katyusha,
	)

//smgs
/datum/supply_pack/centcom/armory/c20nt
	name = "NT20 Submachine Gun gunset"
	desc = "A sleek, select-fire SMG chambered in the venerable .45 cartridge. The Blueshield's favorite toy."
	cost = CARGO_CRATE_VALUE * 75
	contains = list(
		/obj/item/storage/toolbox/guncase/nova/ntspecial/nt20,
	)

/datum/supply_pack/centcom/armory/cmg
	name = "NT CMG-2 PDW"
	desc = "A bullpup, two-round burst PDW chambered in 9x25mm. It features a folding stock and comes pre-attached with a dot sight."
	cost = CARGO_CRATE_VALUE * 100
	contains = list(
		/obj/item/gun/ballistic/automatic/cmg,
		/obj/item/ammo_box/magazine/multi_sprite/cmg = 2,
	)

/datum/supply_pack/centcom/armory/saber_smg
	name = "Nanotrasen Saber SMG"
	desc = "A prototype full-auto 9mm submachine gun, designated 'SABR'."
	cost = CARGO_CRATE_VALUE * 175
	contains = list(
		/obj/item/gun/ballistic/automatic/proto,
		/obj/item/ammo_box/magazine/smgm9mm = 2,
	)

//pistols
/datum/supply_pack/centcom/armory/m96_pistol
	name = "\improper NT M-96 gunset"
	desc = "A prototype mauser type pistol gunset."
	cost = CARGO_CRATE_VALUE * 15
	contains = list(
		/obj/item/storage/toolbox/guncase/nova/ntspecial/pistol/c96,
	)

/datum/supply_pack/centcom/armory/c38_detective
	name = "\improper Colt Detective Special Revolver"
	desc = "A classic, if not outdated, law enforcement firearm. Uses .38 Special rounds."
	cost = CARGO_CRATE_VALUE * 10
	contains = list(
		/obj/item/gun/ballistic/revolver/c38/detective,
		/obj/item/ammo_box/speedloader/c38 = 2,
	)

/datum/supply_pack/centcom/armory/c38_super
	name = "\improper NT/E Laevateinn Revolver"
	desc = "A new spin on a classic. Features both a magnified sight and a magnetic charge-shot assembly built into the barrel for precision fire."
	cost = CARGO_CRATE_VALUE * 25
	contains = list(
		/obj/item/gun/ballistic/revolver/c38/super,
		/obj/item/ammo_box/speedloader/c38/hicap = 2,
		/obj/item/crafting_conversion_kit/c38_speedloader_plus,
	)

/datum/supply_pack/centcom/armory/em1911
	name = "\improper NT E-M1911"
	desc = "A special laser pistol, designed to look like the M1911. Specially made for NanoTasen Officials."
	cost = CARGO_CRATE_VALUE * 100
	contains = list(
		/obj/item/storage/toolbox/guncase/nova/ntspecial/pistol/ntc,
	)
	access = ACCESS_CENT_OFFICIAL
	access_view = ACCESS_CENT_OFFICIAL

/datum/supply_pack/centcom/armory/gyrojet
	name = "gyrojet pistol"
	desc = "A prototype pistol designed to fire self propelled rockets."
	cost = CARGO_CRATE_VALUE * 250
	contains = list(
		/obj/item/gun/ballistic/automatic/gyropistol,
		/obj/item/ammo_box/magazine/m75 = 2,
	)
	access = ACCESS_CENT_OFFICER

//rifles
/datum/supply_pack/centcom/armory/battle_rifle
	name = "NT BR-38 battle rifle"
	desc = "A latest prototype designated marksman rifle used by NanoTrasen private security forces."
	cost = CARGO_CRATE_VALUE * 75
	contains = list(/obj/item/gun/ballistic/automatic/battle_rifle)

/datum/supply_pack/centcom/armory/ar
	name = "NT-ARG 'Boarder'"
	desc = "A robust assault rifle used by NanoTrasen fighting forces."
	cost = CARGO_CRATE_VALUE * 150
	contains = list(/obj/item/gun/ballistic/automatic/ar)

/datum/supply_pack/centcom/armory/ar/ert
	name = "NT-ARG-63 'Boarder'"
	desc = "A robust assault rifle used by NanoTrasen fighting forces, this one was specially made for ERT."
	cost = CARGO_CRATE_VALUE * 200
	contains = list(/obj/item/gun/ballistic/automatic/ar/modular)
	access = ACCESS_CENT_SPECOPS_LEADER
	access_view = ACCESS_CENT_SPECOPS

/datum/supply_pack/centcom/armory/ar/ert/military
	name = "NT M44A Pulse Rifle"
	desc = "A specialized NanoTrasen-produced ballistic pulse rifle that uses compressed magazines to output absurd firepower in a compact package. Only for NanoTrasen military teams."
	cost = CARGO_CRATE_VALUE * 250
	contains = list(/obj/item/gun/ballistic/automatic/ar/modular/m44a)

/datum/supply_pack/centcom/armory/ar/ert/military/scoped
	name = "NT M44AS Pulse Rifle"
	desc = "A specialized NanoTrasen-produced ballistic pulse rifle that uses compressed magazines to output absurd firepower in a compact package. Only for NanoTrasen military teams. This one have a scope."
	cost = CARGO_CRATE_VALUE * 275
	contains = list(/obj/item/gun/ballistic/automatic/ar/modular/m44a/scoped)

/datum/supply_pack/centcom/armory/ar/ert/military/shotgun
	name = "NT M44ASG Pulse Rifle"
	desc = "A specialized NanoTrasen-produced ballistic pulse rifle that uses compressed magazines to output absurd firepower in a compact package. Only for NanoTrasen military teams. This one have a underbarrel 12g shotgun."
	cost = CARGO_CRATE_VALUE * 275
	contains = list(/obj/item/gun/ballistic/automatic/ar/modular/m44a/shotgun)

/datum/supply_pack/centcom/armory/ar/ert/military/grenadelauncher
	name = "NT M44AGL Pulse Rifle"
	desc = "A specialized NanoTrasen-produced ballistic pulse rifle that uses compressed magazines to output absurd firepower in a compact package. Only for NanoTrasen military teams. This one have a underbarrel 40mm grenade launcher."
	cost = CARGO_CRATE_VALUE * 275
	contains = list(/obj/item/gun/ballistic/automatic/ar/modular/m44a/grenadelauncher)

/datum/supply_pack/centcom/armory/pulse_rifle
	name = "Pulse rifle"
	desc = "A heavy-duty, multifaceted energy rifle with three modes. Preferred by front-line combat personnel."
	cost = CARGO_CRATE_VALUE * 300
	contains = list(/obj/item/gun/energy/pulse)
	access_view = ACCESS_CENT_OFFICER

//armour
//ert mods
/datum/supply_pack/centcom/armory/mod_responsory
	name = "MOD suit -ERT- Responsory"
	desc = "A high-speed rescue suit by Nanotrasen, intended for its emergency response teams."
	cost = CARGO_CRATE_VALUE * 250
	contains = list(/obj/item/mod/control/pre_equipped/responsory)
	access = ACCESS_CENT_SPECOPS

/datum/supply_pack/centcom/armory/mod_marine
	name = "MOD suit -ERT- Marine"
	desc = "Advanced Military MOD suit. Developed by Nanotrasen in collaboration with multiple high-profile contractors, this specialized suit is made for high-intensity combat."
	cost = CARGO_CRATE_VALUE * 500
	contains = list(/obj/item/mod/control/pre_equipped/responsory)
	access = ACCESS_CENT_OFFICER
	access_view = ACCESS_CENT_OFFICER

/datum/supply_pack/centcom/armory/mod_apocryphal
	name = "MOD suit -ERT- Apocryphal"
	desc = "A high-tech, only technically legal, armored suit created by a collaboration effort between Nanotrasen and Apadyne Technologies."
	cost = CARGO_CRATE_VALUE * 800
	contains = list(/obj/item/mod/control/pre_equipped/apocryphal)
	access = ACCESS_CENT_SPECOPS_OFFICER
	access_view = ACCESS_CENT_SPECOPS_OFFICER

//heads mods
/datum/supply_pack/centcom/armory/mod_research
	name = "MOD suit -special- Research"
	desc = "A private military EOD suit by Aussec Armory, intended for explosive research. Bulky, but expansive."
	cost = CARGO_CRATE_VALUE * 200
	contains = list(/obj/item/mod/control/pre_equipped/research)

/datum/supply_pack/centcom/armory/mod_advanced
	name = "MOD suit -special- Advanced"
	desc = "An advanced version of Nakamura Engineering's classic suit, shining with a white, acid and fire resistant polish."
	cost = CARGO_CRATE_VALUE * 200
	contains = list(/obj/item/mod/control/pre_equipped/advanced)

/datum/supply_pack/centcom/armory/mod_rescue
	name = "MOD suit -special- Rescue"
	desc = "An advanced version of DeForest Medical Corporation's medical suit, designed for quick rescue of bodies from the most dangerous environments."
	cost = CARGO_CRATE_VALUE * 200
	contains = list(/obj/item/mod/control/pre_equipped/rescue)

/datum/supply_pack/centcom/armory/mod_safeguard
	name = "MOD suit -special- Safeguard"
	desc = "An Apadyne Technologies advanced security suit, offering greater speed and fire protection than the standard security model."
	cost = CARGO_CRATE_VALUE * 200
	contains = list(/obj/item/mod/control/pre_equipped/safeguard)

//higher ups mods
/datum/supply_pack/centcom/armory/mod_nt_rep
	name = "MOD suit -expensive- Corporate Official"
	desc = "A fancy, high-tech suit for Nanotrasen's high ranking officials."
	cost = CARGO_CRATE_VALUE * 250
	contains = list(/obj/item/mod/control/pre_equipped/corporate_official)
	access = ACCESS_CENT_OFFICIAL

/datum/supply_pack/centcom/armory/mod_blueshield
	name = "MOD suit -expensive- Praetorian"
	desc = "A prototype of the Magnate-class suit issued to station Blueshields, still boasting exceptional protection worthy of an honor guard."
	cost = CARGO_CRATE_VALUE * 300
	contains = list(/obj/item/mod/control/pre_equipped/blueshield)

/datum/supply_pack/centcom/armory/mod_magnate
	name = "MOD suit -expensive- Magnate"
	desc = "A fancy, very protective suit for Nanotrasen's captains."
	cost = CARGO_CRATE_VALUE * 400
	contains = list(/obj/item/mod/control/pre_equipped/magnate)
	access = ACCESS_CENT_OFFICER

/datum/supply_pack/centcom/armory/mod_centcom
	name = "MOD suit -expensive- Corporate Officer"
	desc = "A fancy, high-tech suit for Nanotrasen's high ranking officers."
	cost = CARGO_CRATE_VALUE * 1000
	contains = list(/obj/item/mod/control/pre_equipped/corporate)
	access = ACCESS_CENT_OFFICER

//armory overrides
/datum/supply_pack/centcom/misc
	group = "Miscellaneous Supplies"
	access = ACCESS_CENT_SUPPLY

/datum/supply_pack/centcom/misc/door_remote
	name = "Door remote - Service"
	desc = "Door remote for service departments."
	cost = CARGO_CRATE_VALUE * 25
	contains = list(/obj/item/door_remote/head_of_personnel)

/datum/supply_pack/centcom/misc/door_remote/medbay
	name = "Door remote - Medical"
	desc = "Door remote for medbay department."
	contains = list(/obj/item/door_remote/chief_medical_officer)

/datum/supply_pack/centcom/misc/door_remote/cargo
	name = "Door remote - Cargo"
	desc = "Door remote for cargo department."
	contains = list(/obj/item/door_remote/quartermaster)

/datum/supply_pack/centcom/misc/door_remote/security
	name = "Door remote - Security"
	desc = "Door remote for security department."
	contains = list(/obj/item/door_remote/head_of_security)

/datum/supply_pack/centcom/misc/door_remote/rnd
	name = "Door remote - Research"
	desc = "Door remote for research department."
	contains = list(/obj/item/door_remote/research_director)

/datum/supply_pack/centcom/misc/door_remote/engineering
	name = "Door remote - Engineering "
	desc = "Door remote for engineering department."
	contains = list(/obj/item/door_remote/chief_engineer)

/datum/supply_pack/centcom/misc/door_remote/captain
	name = "Door remote - Command"
	desc = "Door remote for command department."
	contains = list(/obj/item/door_remote/captain)

/datum/supply_pack/centcom/misc/door_remote/nt
	name = "Door remote - NanoTrasen"
	desc = "Door remote for NanoTrasen Officials."
	cost = CARGO_CRATE_VALUE * 50
	contains = list(/obj/item/door_remote/nanotrasen_consultant)

/datum/supply_pack/centcom/misc/door_remote/omni
	name = "Door remote - Omni"
	desc = "Door remote for entire NanoTrasen station."
	cost = CARGO_CRATE_VALUE * 75
	contains = list(/obj/item/door_remote/omni)

/datum/supply_pack/centcom/misc/protolathe_engineering
	name = "Protolathe - Engineering"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/engineering)

/datum/supply_pack/centcom/misc/protolathe_medical
	name = "Protolathe - Medical"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/medical)

/datum/supply_pack/centcom/misc/protolathe_service
	name = "Protolathe - Service"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/service)

/datum/supply_pack/centcom/misc/protolathe_cargo
	name = "Protolathe - Cargo"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/cargo)

/datum/supply_pack/centcom/misc/protolathe_science
	name = "Protolathe - Science"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/science)

/datum/supply_pack/centcom/misc/protolathe_security
	name = "Protolathe - Security"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/security)

/datum/supply_pack/centcom/misc/techfab_engineering
	name = "Techfab - Engineering"
	desc = "Techfab circuitboard."
	cost = 8000
	contains = list(/obj/item/circuitboard/machine/techfab/department/engineering)

/datum/supply_pack/centcom/misc/techfab_medical
	name = "Techfab - Medical"
	desc = "Techfab circuitboard."
	cost = 8000
	contains = list(/obj/item/circuitboard/machine/techfab/department/medical)

/datum/supply_pack/centcom/misc/techfab_service
	name = "Techfab - Service"
	desc = "Techfab circuitboard."
	cost = 8000
	contains = list(/obj/item/circuitboard/machine/techfab/department/service)

/datum/supply_pack/centcom/misc/techfab_cargo
	name = "Techfab - Cargo"
	desc = "Techfab circuitboard."
	cost = 8000
	contains = list(/obj/item/circuitboard/machine/techfab/department/cargo)

/datum/supply_pack/centcom/misc/techfab_science
	name = "Techfab - Science"
	desc = "Techfab circuitboard."
	cost = 8000
	contains = list(/obj/item/circuitboard/machine/techfab/department/science)

/datum/supply_pack/centcom/misc/techfab_security
	name = "Techfab - Security"
	desc = "Techfab circuitboard."
	cost = 8000
	contains = list(/obj/item/circuitboard/machine/techfab/department/security)

/datum/supply_pack/centcom/misc/circuit_imprinter
	name = "Circuit Imprinter"
	desc = "Circuit Imprinter circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/circuit_imprinter)
