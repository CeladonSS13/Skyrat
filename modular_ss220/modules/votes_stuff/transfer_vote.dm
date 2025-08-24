#ifndef CHOICE_CONTINUE
	#define CHOICE_CONTINUE "Continue Playing"
#endif

#define EARLY_VOTE_FORBID_BEFORE_THRESHOLD 15 MINUTES
#define EARLY_VOTE_FORBID_AFTER_THRESHOLD 40 MINUTES
#define LATE_VOTE_ALLOW_THRESHOLD 90 MINUTES

#define EARLY_VOTE_FORBID_BEFORE_THRESHOLD_IN_MINS (EARLY_VOTE_FORBID_BEFORE_THRESHOLD) / (1 MINUTES)
#define EARLY_VOTE_FORBID_AFTER_THRESHOLD_IN_MINS (EARLY_VOTE_FORBID_AFTER_THRESHOLD) / (1 MINUTES)
#define LATE_VOTE_ALLOW_THRESHOLD_IN_MINS (LATE_VOTE_ALLOW_THRESHOLD) / (1 MINUTES)

/datum/vote/transfer_vote
	var/any_admin_changed_toggle = FALSE

/datum/vote/transfer_vote/toggle_votable()
	. = ..()
	any_admin_changed_toggle = TRUE

/datum/vote/transfer_vote/can_be_initiated(forced = FALSE)
	. = ..()
	if (. != VOTE_AVAILABLE)
		return . // original message
	var/available_vote = TRUE
	if (!any_admin_changed_toggle)
		available_vote = get_available_at_time() || forced
	if (available_vote)
		return VOTE_AVAILABLE
	return "This vote is only accesible after [EARLY_VOTE_FORBID_BEFORE_THRESHOLD_IN_MINS] minutes round time, however after [EARLY_VOTE_FORBID_AFTER_THRESHOLD_IN_MINS] minutes it will be disabled. But, once [LATE_VOTE_ALLOW_THRESHOLD_IN_MINS] minutes is passed, vote is enabled again."

/datum/vote/transfer_vote/proc/get_available_at_time()
	if (!SSticker || !Master || !Master.current_runlevel != RUNLEVEL_GAME)
		return FALSE
	var/ticks_passed = STATION_TIME_PASSED()
	if (ticks_passed < EARLY_VOTE_FORBID_BEFORE_THRESHOLD)
		return FALSE // someone didn't rolled antag or something like nuke ops mode?
	// so in case station is ruined because of SM and someone really want to transfer early
	// or it's already past 1:30 and don't really want to wait for autotransfer for that round
	return ticks_passed < EARLY_VOTE_FORBID_AFTER_THRESHOLD || ticks_passed > LATE_VOTE_ALLOW_THRESHOLD

/datum/vote/transfer_vote/get_vote_result(list/non_voters)
	if (!choices || length(choices) < 1 || length(GLOB.player_list) < 1)
		return list(CHOICE_CONTINUE)

	var/total_votes = 0
	for(var/option in choices)
		total_votes += choices[option]
	if (total_votes < 1)
		return list(CHOICE_CONTINUE)

	if(!CONFIG_GET(flag/default_no_vote) && choices)
		// Default no votes will add non-voters to "Continue Playing"
		choices[CHOICE_CONTINUE] += length(non_voters)

	return ..()
