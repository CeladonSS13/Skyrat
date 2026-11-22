/// Take a value in seconds and makes it display like a clock. Hours are stripped. (mm:ss)
/proc/seconds_to_clock(seconds as num)
	return "[add_zero(num2text((seconds / 60) % 60), 2)]:[add_zero(num2text(seconds % 60), 2)]"

//Adds 'u' number of zeros ahead of the text 't'
/proc/add_zero(t, u)
	while(length(t) < u)
		t = "0[t]"
	return t

//Take a value in seconds and returns a string of minutes and seconds in the format X minute(s) and X seconds.
/proc/seconds_to_time(seconds as num)
	var/numSeconds = seconds % 60
	var/numMinutes = (seconds - numSeconds) / 60
	return "[numMinutes] [numMinutes > 1 ? "minutes" : "minute"] and [numSeconds] seconds"
