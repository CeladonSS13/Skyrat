/obj/item/gun/ballistic/bow
	var/auto_load_from_belt = FALSE
	var/auto_load_cooldown = 3 SECONDS
	var/next_auto_load = 0
	var/auto_load_cooldown_mult_player = 1.5

/obj/item/gun/ballistic/bow/try_fire_gun(atom/target, mob/living/user, params)
	if (!auto_load_from_belt || !magazine || drawn || chambered)
		return ..()

	var/obj/item/storage/bag/quiver/found_quiver = user.get_item_by_slot(ITEM_SLOT_BELT)
	if (!found_quiver || !found_quiver.atom_storage)
		return ..()

	if (!isashwalker(user))
		return ..() // lack of skill

	if (world.time < next_auto_load)
		if (user)
			balloon_alert(user, "too quick to load!")
		return ..()

	var/list/removed_arrows = list()
	var/desired_type = magazine.ammo_type
	found_quiver.atom_storage.remove_type(type = desired_type, destination = null, amount = 1, force = TRUE, inserted = removed_arrows)

	if (!removed_arrows || removed_arrows.len < 1)
		return ..()

	next_auto_load = world.time + (user.client ? auto_load_cooldown * auto_load_cooldown_mult_player : auto_load_cooldown)
	magazine.give_round(removed_arrows[1])
	drawn = TRUE
	chamber_round()

	return ..()

/obj/item/gun/ballistic/bow/longbow/ashwalker_autofire
	auto_load_from_belt = TRUE
