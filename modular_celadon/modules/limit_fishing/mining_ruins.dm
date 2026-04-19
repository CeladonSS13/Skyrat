/datum/fish_source/lavaland/New()
	var/amount = 0

	if (/obj/item/fish/lavaloop in fish_table)
		amount = fish_table[/obj/item/fish/lavaloop]
		fish_table[/obj/item/fish/lavaloop] = ceil(amount / 2)

	if (amount > 0)
		fish_counts[/obj/item/fish/lavaloop] = amount
		fish_count_regen[/obj/item/fish/lavaloop] = 1 MINUTES

	..()
