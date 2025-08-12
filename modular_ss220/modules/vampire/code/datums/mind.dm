/datum/mind
	var/datum/mindslaves/som //stands for slave or master...hush..

/datum/mind/proc/make_vampire()
	if(!isvampire(src))
		add_antag_datum(/datum/antagonist/vampire)
