/**
 * Picks multiple unique elements from the suplied list.
 * If the given list has a length less than the amount given then it will return a list with an equal amount
 *
 * Arguments:
 * * listfrom - The list where to pick from
 * * amount - The amount of elements it tries to pick.
 */
/proc/pick_multiple_unique(list/listfrom, amount)
	var/list/result = list()
	var/list/copy = listfrom.Copy() // Ensure the original ain't modified
	while(length(copy) && length(result) < amount)
		var/picked = pick(copy)
		result += picked
		copy -= picked
	return result
