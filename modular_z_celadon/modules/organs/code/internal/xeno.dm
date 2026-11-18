
//xeno stomach
/obj/item/organ/stomach/alien/stomach_acid_power(atom/movable/nomnom)
	if (isliving(nomnom)) //mid damage, not almost permanent death for humans without armour
		return 15
	return 75

/obj/item/organ/stomach/alien/content_died(atom/movable/source) // no body delete
	return


