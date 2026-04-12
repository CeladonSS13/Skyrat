/mob/living/simple_animal/hostile/megafauna/robothare
	name = "robot hare"
	desc = "An aggressive robot."
	health = 1500
	maxHealth = 1500
	attack_verb_continuous = "drills"
	attack_verb_simple = "drills"
	attack_sound = 'sound/items/weapons/bladeslice.ogg'
	icon_state = "robothare_folded"
	icon_living = "robothare"
	health_doll_icon = "robothare"
	friendly_verb_continuous = "stares down"
	friendly_verb_simple = "stare down"
	icon = 'modular_celadon/modules/robot_hare_boss/icons/robot_hare.dmi'
	faction = list(FACTION_BOSS) //asteroid mobs? get that shit out of my beautiful square house
	speak_emote = list("beeps")
	armour_penetration = 50
	melee_damage_lower = 15
	melee_damage_upper = 15
	mob_biotypes = MOB_ROBOTIC|MOB_SPECIAL
	speed = 10
	move_to_delay = 5
	ranged = TRUE
	ranged_cooldown_time = 4 SECONDS
	aggro_vision_range = 21 //so it can see to one side of the arena to the other
	loot = list(/obj/item/hierophant_club)
	//crusher_loot = /obj/item/crusher_trophy/vortex_talisman
	wander = FALSE
	icon_dead = "robothare_dead"
	gps_name = "Carrot Signal"
	//achievement_type = /datum/award/achievement/boss/hierophant_kill
	//crusher_achievement_type = /datum/award/achievement/boss/hierophant_crusher
	SET_BASE_PIXEL(-32, -16)
	//score_achievement_type = /datum/award/score/hierophant_score
	del_on_death = FALSE
	death_sound = 'sound/effects/magic/repulse.ogg'
	// attack_action_types = list(/datum/action/innate/megafauna_attack/blink,
	// 						   /datum/action/innate/megafauna_attack/chaser_swarm,
	// 						   /datum/action/innate/megafauna_attack/cross_blasts,
	// 						   /datum/action/innate/megafauna_attack/blink_spam)
	initial_language_holder = /datum/language_holder/machine


	/// folded state, do not auto-agressive
	var/folded = TRUE

/mob/living/simple_animal/hostile/megafauna/robothare/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NO_FLOATING_ANIM, INNATE_TRAIT)


/mob/living/simple_animal/hostile/megafauna/robothare/AttackingTarget(atom/attacked_target)
	if(!folded)
		return ..()

/mob/living/simple_animal/hostile/megafauna/robothare/Move()
	if(!folded)
		..()

/mob/living/simple_animal/hostile/megafauna/robothare/DestroySurroundings()
	if(!folded)
		..()

/mob/living/simple_animal/hostile/megafauna/robothare/Goto(target, delay, minimum_distance)
	if(!folded)
		..()

/mob/living/simple_animal/hostile/megafauna/robothare/multitool_act(mob/living/user, obj/item/multitool/tool)
	if(user.combat_mode)
		return
	if(!folded)
		return
	balloon_alert(user, "activate machine...")
	tool.play_tool_sound(src)
	if(tool.use_tool(src, user, 6 SECONDS))
		playsound(loc, 'sound/items/robofafafoggy.ogg', 50, vary = TRUE)
	robot_unfold()

/mob/living/simple_animal/hostile/megafauna/robothare/proc/robot_unfold()
	icon_state = "robothare"
	flick("[icon_living]_unpacking", src)
	folded = FALSE
	return
