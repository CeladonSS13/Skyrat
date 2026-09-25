/mob/living/basic/blackmesa/xen/bullsquid
	name = "bullsquid"
	desc = "Some highly aggressive alien creature. Thrives in toxic environments."
	icon = 'modular_celadon/modules/return_prs/black_mesa/icons/mobs.dmi'
	icon_state = "bullsquid"
	icon_living = "bullsquid"
	icon_dead = "bullsquid_dead"
	icon_gib = null
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	speak_emote = list("growls", "snarls", "grumbles")
	maxHealth = 110
	health = 110
	obj_damage = 50
	melee_damage_lower = 15
	melee_damage_upper = 18
	projectiletype = /obj/projectile/bullsquid
	projectilesound = 'modular_celadon/modules/return_prs/black_mesa/sound/mobs/bullsquid/goo_attack3.ogg'
	attack_sound = 'modular_celadon/modules/return_prs/black_mesa/sound/mobs/bullsquid/attack1.ogg'
	gold_core_spawnable = HOSTILE_SPAWN
	alert_sounds = list(
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/bullsquid/detect1.ogg',
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/bullsquid/detect2.ogg',
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/bullsquid/detect3.ogg'
	)
	ai_controller = /datum/ai_controller/basic_controller/blackmesa/bullsquid

/mob/living/basic/blackmesa/xen/bullsquid/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/ranged_attacks, projectile_type = projectiletype, projectile_sound = projectilesound, cooldown_time = 3 SECONDS)

/datum/ai_behavior/move_to_cardinal/bullsquid
	minimum_distance = 5
	maximum_distance = 5

/datum/ai_planning_subtree/move_to_cardinal/bullsquid
	move_behaviour = /datum/ai_behavior/move_to_cardinal/bullsquid

/datum/ai_behavior/blackmesa_combo_skirmish/bullsquid
	action_cooldown = 4 SECONDS

/datum/ai_behavior/basic_melee_attack/bullsquid
	action_cooldown = 2 SECONDS
	terminate_after_action = TRUE
	behavior_flags = AI_BEHAVIOR_CAN_PLAN_DURING_EXECUTION

/datum/ai_planning_subtree/blackmesa_combo_skirmish/bullsquid
	ranged_attack_behavior = /datum/ai_behavior/blackmesa_combo_skirmish/bullsquid
	melee_attack_behavior = /datum/ai_behavior/basic_melee_attack/bullsquid

/datum/ai_controller/basic_controller/blackmesa/bullsquid
	planning_subtrees = list(
		/datum/ai_planning_subtree/escape_captivity,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/blackmesa_combo_skirmish/bullsquid,
		/datum/ai_planning_subtree/move_to_cardinal/bullsquid,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
	)

/obj/projectile/bullsquid
	name = "nasty ball of ooze"
	icon_state = "neurotoxin"
	damage = 5
	damage_type = BURN
	knockdown = 20
	armor_flag = BIO
	impact_effect_type = /obj/effect/temp_visual/impact_effect/neurotoxin
	hitsound = 'modular_celadon/modules/return_prs/black_mesa/sound/mobs/bullsquid/splat1.ogg'
	hitsound_wall = 'modular_celadon/modules/return_prs/black_mesa/sound/mobs/bullsquid/splat1.ogg'

/obj/projectile/bullsquid/on_hit(atom/target, blocked, pierce_hit)
	new /obj/effect/decal/cleanable/greenglow(target.loc)
	return ..()
