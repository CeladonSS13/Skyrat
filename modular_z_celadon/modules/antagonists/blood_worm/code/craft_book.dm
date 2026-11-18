//basic recipe with meat, spawn in IP Vault
/obj/item/book/granter/crafting_recipe/blood_worm_recipe
	name = "blood research book"
	desc = "Documents detailing how to make some blood related things."
	special_desc_requirement = EXAMINE_CHECK_SYNDICATE
	special_desc = "Creating of prototype bloodworm injector, also make sure to not stand near turrets in case to not get killed, do not fall in lava. Properly of the Syndicate."
	crafting_recipe_types = list(
		/datum/crafting_recipe/blood_worm_mutator,
	)
	icon_state = "book1"
	uses = INFINITY
	remarks = list(
		"It's written in medical font...",
		"Decyphering...",
		"Studying...",
		"Do not bleed or burn...",
	)

/datum/crafting_recipe/blood_worm_mutator
	time = 15 SECONDS
	name = "ominous injector"
	reqs = list(
		/obj/item/blood_worm_tester = 1,
		/obj/item/food/meat/slab/blood_worm = 3,
		/obj/item/organ/monster_core/regenerative_core/legion = 1,
		/obj/item/mining_stabilizer = 1,
		/obj/item/lazarus_injector = 1
	)
	result = /obj/item/blood_worm_mutator
	category = CAT_MISC
	crafting_flags = parent_type::crafting_flags | CRAFT_MUST_BE_LEARNED

//version which doesn't use meat but can fail in craft, admin
/obj/item/book/granter/crafting_recipe/blood_worm_recipe/nomeat
	special_desc = "Creating of injector is not completed, also make sure to not stand near turrets in case to not get killed, do not fall in lava. Property of the Syndicate."
	crafting_recipe_types = list(
		/datum/crafting_recipe/blood_worm_mutator/nomeat,
	)

/datum/crafting_recipe/blood_worm_mutator/nomeat
	reqs = list(
		/obj/item/blood_worm_tester = 1,
		/obj/item/food/monkeycube = 1,
		/obj/item/organ/monster_core/regenerative_core/legion = 3,
		/obj/item/mining_stabilizer = 3,
		/obj/item/lazarus_injector = 3
	)
	result = /obj/effect/spawner/random/blood_worm_mutator

/obj/effect/spawner/random/blood_worm_mutator
	name = "ominous injector"
	spawn_all_loot = FALSE
	spawn_loot_count = 1
	icon = 'icons/obj/antags/blood_worm.dmi'
	icon_state = "tester"
	loot = list(/obj/item/blood_worm_mutator, /obj/effect/gibspawner/human/bodypartless)
