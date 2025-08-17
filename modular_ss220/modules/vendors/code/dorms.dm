/obj/machinery/vending/dorms
	name = "CozyMate"
	desc = "A vending machine for sleep clothing."
	icon_state = "clothes"
	icon_deny = "clothes-deny"
	panel_type = "panel15"
	product_slogans = "Success in sleep!;Prepare to sleep comfortable!;Look at all this cozy!;Why leave bed up to fate? Use the CozyMate!"
	vend_reply = "Thank you for using the CozyMate!"
	product_categories = list(
		list(
			"name" = "Head",
			"icon" = "hat-cowboy",
			"products" = list(
				/obj/item/clothing/head/costume/nightcap/blue = 6,
				/obj/item/clothing/head/costume/nightcap/red = 6,
				/obj/item/clothing/head/costume/ushanka = 4,
			),
		),

		list(
			"name" = "Accessories & Bedsheets",
			"icon" = "glasses",
			"products" = list(
				/obj/item/clothing/neck/scarf = 3,
				/obj/item/clothing/neck/large_scarf = 3,
				/obj/item/clothing/neck/large_scarf/red = 3,
				/obj/item/clothing/neck/large_scarf/green = 3,
				/obj/item/clothing/neck/large_scarf/blue = 3,
				/obj/item/clothing/neck/infinity_scarf = 3,
				/obj/item/clothing/gloves/fingerless = 3,
				/obj/item/clothing/glasses/blindfold = 10,
				/obj/item/pillow/random = 20,
				/obj/item/pillow/mime = 5,
				/obj/item/pillow/clown = 5,
				/obj/item/bedsheet = 5,
				/obj/item/bedsheet/double = 5,
				/obj/item/bedsheet/blue = 3,
				/obj/item/bedsheet/blue/double = 3,
				/obj/item/bedsheet/green = 3,
				/obj/item/bedsheet/green/double = 3,
				/obj/item/bedsheet/grey = 3,
				/obj/item/bedsheet/grey/double = 3,
				/obj/item/bedsheet/orange = 3,
				/obj/item/bedsheet/orange/double = 3,
				/obj/item/bedsheet/red = 3,
				/obj/item/bedsheet/red/double = 3,
				/obj/item/bedsheet/yellow = 3,
				/obj/item/bedsheet/yellow/double = 3,
				/obj/item/bedsheet/black = 3,
				/obj/item/bedsheet/black/double = 3,
				/obj/item/bedsheet/brown = 3,
				/obj/item/bedsheet/brown/double = 3,
				/obj/item/bedsheet/mime = 2,
				/obj/item/bedsheet/mime/double = 2,
				/obj/item/bedsheet/clown = 2,
				/obj/item/bedsheet/clown/double = 2,
				/obj/item/bedsheet/ian = 2,
				/obj/item/bedsheet/ian/double = 2,
				/obj/item/bedsheet/runtime = 2,
				/obj/item/bedsheet/runtime/double = 2,
			),
		),

		list(
			"name" = "Under",
			"icon" = "shirt",
			"products" = list(
				/obj/item/clothing/under/misc/pj/blue = 6,
				/obj/item/clothing/under/misc/pj/red = 6,
				/obj/item/clothing/suit/costume/hawaiian = 4,
				/obj/item/clothing/suit/costume/wellworn_shirt = 2,
				/obj/item/clothing/suit/costume/wellworn_shirt/graphic = 2,
				/obj/item/clothing/suit/costume/wellworn_shirt/graphic/ian = 2,
				/obj/item/clothing/under/pants/slacks = 5,
				/obj/item/clothing/under/shorts = 5,
			),
		),

		list(
			"name" = "Warm Suits",
			"icon" = "vest",
			"products" = list(
				/obj/item/clothing/suit/toggle/jacket/sweater = 4,
				/obj/item/clothing/suit/jacket/fancy = 4,
				/obj/item/clothing/suit/hooded/wintercoat/custom = 3,
				/obj/item/clothing/suit/hooded/wintercoat = 3,
				/obj/item/clothing/suit/jacket/puffer/vest = 3,
				/obj/item/clothing/suit/jacket/puffer = 3,
			),
		),

		list(
			"name" = "Shoes",
			"icon" = "socks",
			"products" = list(
				/obj/item/clothing/shoes/sneakers/black = 4,
				/obj/item/clothing/shoes/sneakers/white = 4,
				/obj/item/clothing/shoes/winterboots = 2,
			),
		),

		list(
			"name" = "Bathhouse suits",
			"icon" = "star",
			"products" = list(
				/obj/item/clothing/head/costume/hairpin = 6,
				/obj/item/clothing/under/costume/yukata = 2,
				/obj/item/clothing/under/costume/yukata/green = 2,
				/obj/item/clothing/under/costume/yukata/white = 2,
			),
		),
	)

	contraband = list(
		/obj/item/bedsheet/gondola = 1,
		/obj/item/bedsheet/pirate = 1,
		/obj/item/bedsheet/patriot = 1,
		/obj/item/bedsheet/rev = 1,
		/obj/item/bedsheet/rev/double = 1,
		/obj/item/bedsheet/syndie = 1,
		/obj/item/bedsheet/syndie/double = 1,
		/obj/item/clothing/under/misc/syndicate_souvenir = 3,
		/obj/item/clothing/under/syndicate/bloodred/sleepytime/sensors = 3,
		/obj/item/clothing/under/syndicate/tacticool = 3,
		/obj/item/clothing/under/syndicate/unarmoured = 3,
		/obj/item/clothing/under/rank/prisoner/protcust = 1,
		/obj/item/clothing/under/rank/prisoner/lowsec = 1,
		/obj/item/clothing/under/rank/prisoner = 1,
		/obj/item/clothing/under/rank/prisoner/classic = 1,
		/obj/item/clothing/under/rank/prisoner/highsec = 1,
		/obj/item/clothing/under/rank/prisoner/supermax = 1,
	)
	premium = list(
		/obj/item/clothing/under/rank/centcom/officer/replica = 2,
		/obj/item/bedsheet/nanotrasen = 4,
		/obj/item/bedsheet/nanotrasen/double = 4,
		/obj/item/bedsheet/cosmos = 1,
		/obj/item/bedsheet/cosmos/double = 1,
		/obj/item/instrument/piano_synth/headphones/spacepods = 1,
	)
	refill_canister = /obj/item/vending_refill/dorms
	default_price = PAYCHECK_CREW
	extra_price = PAYCHECK_COMMAND
	payment_department = ACCOUNT_SRV
	light_mask = "wardrobe-light-mask"
	light_color = LIGHT_COLOR_ELECTRIC_GREEN

/obj/item/vending_refill/dorms
	machine_name = "CozyMate"
	icon_state = "refill_clothes"
