/datum/action/cooldown/spell/vamp_claws
	name = "Когти"
	desc = "Вы используете магию крови, чтобы выковать смертоносные вампирские когти, которые высасывают кровь и наносят стремительные удары. Их нельзя использовать, если вы держите что-то, что нельзя уронить."
	cooldown_time = 15 SECONDS
	button_icon_state = "vampire_claws"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	overlay_icon_state = null
	school = "vampire"
	spell_requirements = SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/vamp_claws/create_new_handler()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 20
	return H

/datum/action/cooldown/spell/vamp_claws/before_cast(atom/cast_on)
	return ..() | SPELL_NO_FEEDBACK | SPELL_NO_IMMEDIATE_COOLDOWN

/datum/action/cooldown/spell/vamp_claws/cast(mob/user)
	. = ..()
	to_chat(user, span_notice("Вы роняете то, что было у вас в руках, и из ваших пальцев вылетают огромные лезвия!"))
	user.drop_all_held_items()
	var/obj/item/vamp_claws/claws = new /obj/item/vamp_claws(user.loc, src)
	RegisterSignal(user, COMSIG_MOB_DROPPING_ITEM, PROC_REF(dispel))
	user.put_in_hands(claws)


/datum/action/cooldown/spell/vamp_claws/proc/dispel()
	SIGNAL_HANDLER

	var/mob/living/carbon/human/user = owner
	if(!user.mind.has_antag_datum(/datum/antagonist/vampire))
		return

	for(var/obj/item/vamp_claws/claws in user.held_items)
		StartCooldown()
		qdel(claws)
	to_chat(user, span_notice("Вы рассеиваете когти!"))


/datum/action/cooldown/spell/vamp_claws/can_cast_spell(feedback)
	var/mob/living/L = owner
	if(L.canUnEquip(L.get_item_for_held_index(LEFT_HANDS)) && L.canUnEquip(L.get_item_for_held_index(RIGHT_HANDS)))
		return ..()


/obj/item/vamp_claws
	name = "vampiric claws"
	desc = "Пара древних когтей из живой крови, они кажутся текучими и в то же время твердыми."
	icon = 'modular_ss220/modules/vampire/icons/effects/vampire_effects.dmi'
	icon_state = "vamp_claws"
	w_class = WEIGHT_CLASS_BULKY
	item_flags = ABSTRACT|DROPDEL
	force = 15
	armour_penetration = 40
	sharpness = SHARP_EDGED
	attack_speed = 0.4 SECONDS
	hitsound = 'sound/items/weapons/bladeslice.ogg'
	attack_verb_continuous = list("attacks", "tears", "lacerates", "cuts")
	attack_verb_simple = list("attack", "tear", "lacerate", "cut")
	var/durability = 15
	var/blood_drain_amount = 15
	var/blood_absorbed_amount = 5
	var/datum/action/cooldown/spell/vamp_claws/parent_spell
	var/force_wielded = 15
	var/force_unwielded = 5


/obj/item/vamp_claws/Initialize(mapload, new_parent_spell)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, ABSTRACT_ITEM_TRAIT)
	parent_spell = new_parent_spell
	AddComponent(/datum/component/two_handed, require_twohands=TRUE, force_unwielded=force_unwielded, force_wielded=force_wielded, icon_wielded="[icon_state]")


/obj/item/vamp_claws/Destroy()
	if(parent_spell)
		parent_spell.UnregisterSignal(parent_spell.owner, COMSIG_MOB_DROPPING_ITEM)
		parent_spell.StartCooldown()
		parent_spell = null
	return ..()


/obj/item/vamp_claws/afterattack(atom/target, mob/user, proximity, params)
	if(!proximity)
		return

	var/datum/antagonist/vampire/V = user.mind?.has_antag_datum(/datum/antagonist/vampire)
	var/mob/living/attacker = user

	if(!V)
		return

	if(iscarbon(target))
		var/mob/living/carbon/C = target
		// no parameter in [affects_vampire()] so holy always protects
		if(C.ckey && C.stat != DEAD && C.affects_vampire() && !HAS_TRAIT(C, TRAIT_NOBLOOD))
			C.bleed(blood_drain_amount)
			attacker.adjustStaminaLoss(-20) // security is dead
			attacker.heal_overall_damage(4, 4) // the station is full
			attacker.AdjustKnockdown(-1 SECONDS) // blood is fuel
			V.adjust_blood(C, blood_absorbed_amount)

	if(!V.get_ability(/datum/vampire_passive/blood_spill))
		durability--
		if(durability <= 0)
			parent_spell.StartCooldown()
			qdel(src)
			to_chat(user, span_warning("Ваши когти сломаны!"))


/obj/item/vamp_claws/attack_self(mob/user)
	parent_spell.StartCooldown()
	qdel(src)
	to_chat(user, span_notice("Вы рассеиваете когти!"))


/datum/action/cooldown/spell/pointed/blood_tendrils
	name = "Кровавые щупальца"
	desc = "Используя силу блюспейса, после небольшой задержки вы призываете кровавые щупальца, которые опутывают цели в зоне действия, замедляя их и нанося умеренный токсичный урон."
	cooldown_time = 10 SECONDS
	button_icon_state = "blood_tendrils"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	overlay_icon_state = null
	school = "vampire"
	sound = 'sound/effects/magic/enter_blood.ogg'
	var/area_of_affect = 1
	active_msg		= span_notice("Вы используете магию крови, чтобы ослабить завесу блюспейса.")
	deactive_msg	= span_notice("Ваша магия ослабевает.")
	spell_requirements = SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/pointed/blood_tendrils/create_new_handler()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 10
	return H

/datum/action/cooldown/spell/pointed/blood_tendrils/cast(atom/cast_on)
	. = ..()
	var/turf/T = get_turf(cast_on) // there should only ever be one entry in targets for this spell

	for(var/turf/blood_turf in view(area_of_affect, T))
		if(blood_turf.density)
			continue
		new /obj/effect/temp_visual/blood_tendril(blood_turf)

	addtimer(CALLBACK(src, PROC_REF(apply_slowdown), T, area_of_affect, 6 SECONDS), 1 SECONDS)


/datum/action/cooldown/spell/pointed/blood_tendrils/proc/apply_slowdown(turf/T, distance, slowed_amount)
	for(var/mob/living/carbon/human/L in range(distance, T))
		if(L.affects_vampire(owner))
			L.adjust_staggered(slowed_amount)
			L.apply_damage(33, TOX)
			L.visible_message(span_warning("[L] опутывается кровавыми щупальцами, которые ограничивают его движение!"))
			var/turf/target_turf = get_turf(L)
			playsound(target_turf, 'sound/effects/magic/tail_swing.ogg', 50, TRUE)
			new /obj/effect/decal/cleanable/blood(target_turf, null, GET_ATOM_BLOOD_DNA(L))
			new /obj/effect/temp_visual/blood_tendril/long(target_turf)


/obj/effect/temp_visual/blood_tendril
	icon = 'modular_ss220/modules/vampire/icons/effects/vampire_effects.dmi'
	icon_state = "blood_tendril"
	duration = 1 SECONDS


/obj/effect/temp_visual/blood_tendril/long
	duration = 2 SECONDS


/datum/action/cooldown/spell/pointed/blood_barrier
	name = "Кровавый барьер"
	desc = "Создает барьер из кристаллизованной крови вокруг выбранной цели."
	button_icon_state = "blood_barrier"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	overlay_icon_state = null
	school = "vampire"
	cooldown_time = 30 SECONDS
	spell_requirements = SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/pointed/blood_barrier/create_new_handler()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 30
	return H


/datum/action/cooldown/spell/pointed/blood_barrier/is_valid_target(atom/cast_on)
	if(!isturf(cast_on) && !ismob(cast_on))
		owner.balloon_alert(owner, "Можно выбрать только пол или существо!")
		return FALSE
	return TRUE

/datum/action/cooldown/spell/pointed/blood_barrier/cast(atom/cast_on)
	. = ..()
	var/turf/center_turf = get_turf(cast_on)
	if(!center_turf)
		return

	for(var/turf/nearby_turf in orange(1, center_turf))
		if(nearby_turf.density)
			continue
		if(nearby_turf == center_turf)
			continue

		new /obj/structure/blood_barrier(nearby_turf)


/obj/structure/blood_barrier
	name = "blood barrier"
	desc = "Гротескная структура из кристаллизованной крови. Она медленно тает..."
	max_integrity = 100
	icon_state = "blood_barrier"
	icon = 'modular_ss220/modules/vampire/icons/effects/vampire_effects.dmi'
	density = TRUE
	anchored = TRUE
	opacity = FALSE


/obj/structure/blood_barrier/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)


/obj/structure/blood_barrier/Destroy()
	new /obj/effect/decal/cleanable/blood(loc)
	STOP_PROCESSING(SSobj, src)
	return ..()


/obj/structure/blood_barrier/process()
	take_damage(8, sound_effect = FALSE)


/obj/structure/blood_barrier/CanPass(atom/movable/mover, border_dir)
	. = ..()

	if(!isliving(mover))
		return FALSE

	var/mob/living/L = mover
	if(!L.mind)
		return FALSE

	var/datum/antagonist/vampire/V = L.mind.has_antag_datum(/datum/antagonist/vampire)
	if(!V)
		return FALSE

	if(is_type_in_list(V.subclass, list(SUBCLASS_HEMOMANCER, SUBCLASS_ANCIENT)))
		return TRUE


/datum/action/cooldown/spell/jaunt/ethereal_jaunt/blood_pool
	name = "Погружение в кровь"
	desc = "Вы превращаете свою форму в лужу крови, делая ее неуязвимой и способной перемещаться сквозь всё, что не является стеной или космосом. После этого за вами остаётся кровавый след."
	jaunt_duration = 8 SECONDS
	school = "vampire"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	button_icon_state = "blood_pool"
	overlay_icon_state = null
	school = "vampire"
	cooldown_time = 25 SECONDS
	jaunt_type = /obj/effect/dummy/phased_mob/spell_jaunt/blood_pool
	jaunt_out_type = /obj/effect/temp_visual/dir_setting/cult/phase/out
	jaunt_in_type = /obj/effect/temp_visual/dir_setting/cult/phase
	jaunt_in_time = 2.5 SECONDS
	sound = 'sound/effects/magic/enter_blood.ogg'
	exit_jaunt_sound = 'sound/effects/magic/exit_blood.ogg'
	spell_requirements = SPELL_REQUIRES_HUMAN


/datum/action/cooldown/spell/jaunt/ethereal_jaunt/blood_pool/build_button_icon(atom/movable/screen/movable/action_button/button, update_flags, force)
	. = ..()
	update_vampire_spell_name()

/datum/action/cooldown/spell/jaunt/ethereal_jaunt/blood_pool/do_steam_effects(turf/loc)
	return

/datum/action/cooldown/spell/jaunt/ethereal_jaunt/blood_pool/create_new_handler()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 30
	return H

/obj/effect/dummy/phased_mob/spell_jaunt/blood_pool
	name = "sanguine pool"
	desc = "a pool of living blood."
	phased_mob_icon_state = null
	movespeed = 1.5

/obj/effect/dummy/phased_mob/spell_jaunt/blood_pool/relaymove(mob/living/user, direction)
	..()
	var/obj/effect/decal/cleanable/blood/blood = new /obj/effect/decal/cleanable/blood/trail(loc, null, GET_ATOM_BLOOD_DNA(user))
	blood.setDir(direction)

	var/turf/target_turf = phased_check(user, direction)
	if(!target_turf)
		return FALSE


/obj/effect/dummy/phased_mob/spell_jaunt/blood_pool/phased_check(mob/living/user, direction)
	. = ..()
	var/turf/target_turf = get_step_multiz(src,direction)
	if(isspaceturf(target_turf) || target_turf.density)
		return null


/datum/action/cooldown/spell/list_target/predator_senses
	name = "Чутьё хищника"
	desc = "Выслеживайте свою добычу, здесь ей негде спрятаться... На короткое время оглушает её, если она окажется в вашем поле зрения."
	button_icon_state = "predator_sense"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	overlay_icon_state = null
	school = "vampire"
	cooldown_time = 10 SECONDS
	target_radius = 255
	choose_target_message = "Лицо для поиска"
	spell_requirements = SPELL_REQUIRES_HUMAN
	var/datum/weakref/last_target_ref
	var/blocked = FALSE

/datum/action/cooldown/spell/list_target/predator_senses/Trigger(trigger_flags, atom/target)
	if(trigger_flags & TRIGGER_SECONDARY_ACTION)
		var/mob/living/last_target = last_target_ref?.resolve()
		if(isnull(last_target))
			owner.balloon_alert(owner, "нет предыдущей цели!")
			return FALSE
		if(!is_valid_target(last_target))
			owner.balloon_alert(owner, "цель недоступна!")
			return FALSE
		if(!can_cast_spell(feedback = TRUE))
			return FALSE
		apply_effects(last_target)
		StartCooldown()
		return TRUE
	return ..()

/datum/action/cooldown/spell/list_target/predator_senses/get_list_targets(atom/center, target_radius)
	var/list/possible_targets = list()
	for(var/mob/living/carbon/human/possible_target in GLOB.human_list)
		if(possible_target == owner)
			continue
		if(possible_target.z != owner.z)
			continue
		possible_targets += possible_target
	return possible_targets

/datum/action/cooldown/spell/list_target/predator_senses/is_valid_target(mob/living/carbon/cast_on)
	return ..() || cast_on.affects_vampire(owner)

/datum/action/cooldown/spell/list_target/predator_senses/cast(mob/living/carbon/cast_on)
	. = ..()

	if(!istype(cast_on, /mob/living/carbon/human))
		to_chat(owner, span_warning("Неверная цель!"))
		return

	last_target_ref = WEAKREF(cast_on)
	apply_effects(cast_on)

/datum/action/cooldown/spell/list_target/predator_senses/proc/apply_effects(mob/living/carbon/human/target)
	var/message = "[target.real_name] находится в локации [get_area(target)], на [dir2text(get_dir(owner, target))] от вас."

	if(target.getBruteLoss() >= 40 || target.get_bleed_rate())
		message += "<i> Цель ранена...</i>"

	to_chat(owner, span_cult_bold("[message]"))

	if(target in view(7, owner))
		target.Knockdown(4 SECONDS)
		var/turf/target_turf = get_turf(target)
		playsound(target_turf, 'sound/effects/splat.ogg', 50, TRUE)
		new /obj/effect/decal/cleanable/blood(target_turf)


/datum/action/cooldown/spell/aoe/blood_eruption
	name = "Извержение крови"
	desc = "Каждая лужа крови в 4 тайлах от вас извергается шипом живой крови, нанося урон всем, кто стоит на ней."
	cooldown_time = 1 MINUTES
	button_icon_state = "blood_spikes"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	overlay_icon_state = null
	school = "vampire"
	aoe_radius = 4
	spell_requirements = SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/aoe/blood_eruption/create_new_handler()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 50
	return H


/datum/action/cooldown/spell/aoe/blood_eruption/get_things_to_cast_on(atom/center)
	var/list/things = list()
	for(var/mob/living/nearby_mob in range(aoe_radius, center))
		if(nearby_mob == owner || nearby_mob == center)
			continue
		if(!locate(/obj/effect/decal/cleanable/blood) in get_turf(nearby_mob))
			continue

		things += nearby_mob

	return things


/datum/action/cooldown/spell/aoe/blood_eruption/is_valid_target(mob/living/carbon/cast_on)
	return ..() || cast_on.affects_vampire(owner)


/datum/action/cooldown/spell/aoe/blood_eruption/cast_on_thing_in_aoe(atom/victim, atom/caster)
	for(var/mob/living/L in get_things_to_cast_on(caster))
		var/turf/T = get_turf(L)
		var/obj/effect/decal/cleanable/blood/B = locate(/obj/effect/decal/cleanable/blood) in T
		var/obj/effect/temp_visual/blood_spike/spike = new /obj/effect/temp_visual/blood_spike(T)
		spike.color = B.color
		playsound(L, 'sound/effects/magic/demon_attack1.ogg', 50, TRUE)
		L.apply_damage(50, BRUTE, BODY_ZONE_CHEST)
		L.Stun(3 SECONDS)
		L.visible_message(span_warning("<b>[L] пронзен шипом живой крови!</b>"))


/obj/effect/temp_visual/blood_spike
	icon = 'modular_ss220/modules/vampire/icons/effects/vampire_effects.dmi'
	icon_state = "bloodspike_white"
	duration = 0.3 SECONDS


/datum/action/cooldown/spell/blood_spill
	name = "Кровавый обряд"
	desc = "При переключении все вокруг начнут обильно кровоточить. Вы будете поглощать их кровь и напитываться силой."
	cooldown_time = 10 SECONDS
	button_icon_state = "blood_bringers_rite"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	overlay_icon_state = null
	school = "vampire"
	spell_requirements = SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/blood_spill/create_new_handler()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 10
	return H

/datum/action/cooldown/spell/blood_spill/cast(atom/cast_on)
	. = ..()
	var/mob/living/user = cast_on
	var/datum/antagonist/vampire/V = user.mind.has_antag_datum(/datum/antagonist/vampire)
	if(!V.get_ability(/datum/vampire_passive/blood_spill))
		V.force_add_ability(/datum/vampire_passive/blood_spill)
	else
		for(var/datum/vampire_passive/blood_spill/B in V.powers)
			V.remove_ability(B)


/datum/vampire_passive/blood_spill
	var/max_beams = 10


/datum/vampire_passive/blood_spill/New()
	..()
	START_PROCESSING(SSobj, src)


/datum/vampire_passive/blood_spill/Destroy(force)
	STOP_PROCESSING(SSobj, src)
	return ..()


/datum/vampire_passive/blood_spill/process()
	var/beam_number = 0
	var/datum/antagonist/vampire/V = owner.mind.has_antag_datum(/datum/antagonist/vampire)
	for(var/mob/living/carbon/human/H in view(7, owner))
		if(HAS_TRAIT(H, TRAIT_NOBLOOD))
			continue

		if(!H.affects_vampire(owner) || H.stat)
			continue

		var/drain_amount = rand(5, 10)
		beam_number++
		H.bleed(drain_amount)
		H.Beam(owner, icon_state = "drainbeam", time = 2 SECONDS)
		H.adjustBruteLoss(5)
		var/update = NONE
		update |= owner.heal_overall_damage(8, 2, updating_health = FALSE)
		update |= owner.heal_damage_type(15, STAMINA)
		if(update)
			owner.updatehealth()
		owner.AdjustStun(-2 SECONDS)
		owner.AdjustKnockdown(-2 SECONDS)
		if(drain_amount == 10)
			to_chat(H, span_warning("<b>Вы чувствуете, как из вас утекает жизненная сила!</b>"))

		if(beam_number >= max_beams)
			break

	V.bloodusable = max(V.bloodusable - 10, 0)

	if(!V.bloodusable || owner.stat == DEAD)
		V.remove_ability(src)

