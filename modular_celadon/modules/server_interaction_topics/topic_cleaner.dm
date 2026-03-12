SUBSYSTEM_DEF(topic_access_cleaner)
	name = "Topic Utility"
	flags = SS_BACKGROUND | SS_NO_INIT
	wait = 5 SECONDS // should be enough to mitigate possible DDOS burst and clear IP from memory
	runlevels = RUNLEVEL_LOBBY | RUNLEVEL_SETUP | RUNLEVEL_GAME | RUNLEVEL_POSTGAME

/datum/controller/subsystem/topic_access_cleaner/fire()
	var/alist/cooldown_alist = GLOB.topic_ip_cooldown
	if (cooldown_alist)
		cooldown_alist.len = 0 // cleanup IPs at world.dm topics
