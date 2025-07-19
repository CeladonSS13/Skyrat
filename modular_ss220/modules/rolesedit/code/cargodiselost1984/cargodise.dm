// job code
/datum/job/freighter_crew
	title = ROLE_FREIGHTER_CREW
	policy_index = ROLE_FREIGHTER_CREW
	paycheck = PAYCHECK_LOWER

/datum/job/freighter_command
	title = ROLE_FREIGHTER_COMMAND
	policy_index = ROLE_FREIGHTER_CREW
	paycheck = PAYCHECK_COMMAND

//HEADSETS+override
/obj/item/radio/headset/headset_frontier_colonist/cargodise
	name = "Freight Crew radio headset"
	keyslot = /obj/item/encryptionkey/headset_mining

/obj/item/radio/headset/headset_frontier_colonist/cargodise/qm
	name = "Freight Chief radio headset"
	keyslot2 = /obj/item/encryptionkey/headset_com
	command = TRUE

/datum/outfit/freighter_crew
	accessory = /obj/item/clothing/accessory/armband/cargo/nonsec
	head = /obj/item/clothing/head/soft
	ears = /obj/item/radio/headset/headset_frontier_colonist/cargodise
	glasses = /obj/item/clothing/glasses/hud/gun_permit
	mask = /obj/item/clothing/mask/neck_gaiter
	suit = /obj/item/clothing/suit/toggle/cargo_tech
	gloves = /obj/item/clothing/gloves/fingerless
	role_job = /datum/job/freighter_crew
	paycheck_name = "Freighter staff: Salary"
	backpack_contents = list(
		/obj/item/boxcutter=1,
		/obj/item/universal_scanner=1,
		/obj/item/clothing/gloves/cargo_gauntlet=1,
		)

/datum/outfit/freighter_excavator
	accessory = /obj/item/clothing/accessory/armband/cargo/nonsec
	head = /obj/item/clothing/head/beret/cargo
	ears = /obj/item/radio/headset/headset_frontier_colonist/cargodise
	glasses = /obj/item/clothing/glasses/hud/gun_permit
	mask = /obj/item/clothing/mask/neck_gaiter
	gloves = /obj/item/clothing/gloves/color/black
	role_job = /datum/job/freighter_crew
	paycheck_name = "Freighter staff: Salary"
	backpack_contents = list(/obj/item/flashlight/seclite=1,\
		/obj/item/knife/combat/survival=1,
		/obj/item/mining_voucher=1,
		/obj/item/t_scanner/adv_mining_scanner/lesser=1,
		/obj/item/gun/energy/recharge/kinetic_accelerator=1,\
		/obj/item/stack/marker_beacon/ten=1,
		)

/datum/outfit/freighter_boss
	head = /obj/item/clothing/head/beret/sec/cargo
	ears = /obj/item/radio/headset/headset_frontier_colonist/cargodise/qm
	glasses = /obj/item/clothing/glasses/hud/gun_permit/sunglasses
	mask = /obj/item/clothing/mask/neck_gaiter
	suit = /obj/item/clothing/suit/jacket/quartermaster
	uniform = /obj/item/clothing/under/rank/cargo/qm/nova/turtleneck
	accessory = /obj/item/clothing/accessory/armband/cargo/nonsec
	belt = /obj/item/melee/baton/telescopic/bronze
	l_pocket = /obj/item/clipboard
	r_pocket = /obj/item/stamp/head/qm
	role_job = /datum/job/freighter_command
	paycheck_name = "Accrual from private business: 'Salary'"
	backpack_contents = list(
		/obj/item/megaphone/cargo=1,
		/obj/item/clothing/gloves/cargo_gauntlet=1,
		/obj/item/universal_scanner=1,
		)

/obj/effect/mob_spawn/ghost_role/human/lostcargoqm
	spawner_job_path = /datum/job/freighter_command

//armory
/obj/structure/closet/freighterammo
	name = "Ammo Storage"

/obj/structure/closet/freighterammo/PopulateContents()
	new /obj/item/ammo_box/magazine/c40sol_rifle(src)
	new /obj/item/ammo_box/magazine/c40sol_rifle(src)
	new /obj/item/ammo_box/magazine/c40sol_rifle(src)
	new /obj/item/ammo_box/magazine/lanca(src)
	new /obj/item/ammo_box/magazine/lanca(src)
	new /obj/item/ammo_box/magazine/lanca(src)
	new /obj/item/ammo_box/magazine/lanca(src)
	new /obj/item/ammo_box/magazine/c35sol_pistol(src)
	new /obj/item/ammo_box/magazine/c35sol_pistol(src)
	new /obj/item/ammo_box/strilka310(src)
	new /obj/item/ammo_box/strilka310(src)
	new /obj/item/ammo_box/strilka310(src)
	new /obj/item/ammo_box/strilka310(src)

//QM's gear locker
/obj/structure/closet/secure_closet/personal/cabinet/freighterboss
	name = "Personal Closet"

/obj/structure/closet/secure_closet/personal/cabinet/freighterboss/PopulateContents()
	new /obj/item/radio/headset/headset_frontier_colonist/cargodise/qm(src)
	new /obj/item/storage/backpack/satchel/leather/withwallet(src)
	new /obj/item/instrument/piano_synth(src)
	new /obj/item/gun/ballistic/automatic/cfa_rifle(src)
	new /obj/item/storage/pouch/ammo(src)
	new /obj/item/clothing/suit/armor/bulletproof(src)
	new /obj/item/storage/belt/utility/syndicate(src)
	new /obj/item/gps/mining(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/storage/backpack/duffelbag/syndie(src)
	new /obj/item/radio(src)
	new /obj/item/wrench/bolter(src)
	new /obj/item/ammo_box/magazine/cm68(src)
	new /obj/item/ammo_box/magazine/cm68(src)
	new /obj/item/ammo_box/magazine/cm68(src)

//map code
/datum/map_template/ruin/space/nova/cargodiselost1984
	id = "CargodiseLost1984"
	suffix = "cargodiselost1984.dmm"
	name = "Space-Ruin Cargodise Lost (ss1984 edit)"
	description = "A small crew of freight-haulers are marooned in space after pirates knock out their engines. They must survive off of the cargo on board their ship and fend off the pirate boarders on their ship.(ss1984 edit)"
