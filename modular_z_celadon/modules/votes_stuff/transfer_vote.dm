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

/datum/vote/transfer_vote/is_config_enabled()
	return CONFIG_GET(flag/allow_vote_transfer)

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

/datum/controller/subsystem/autotransfer/new_shift(real_round_start_time)
	if(!CONFIG_GET(flag/autotransfer))	// autotransfer enabled?
		return

	return ..()
