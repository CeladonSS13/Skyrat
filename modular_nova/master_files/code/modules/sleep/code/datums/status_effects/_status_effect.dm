/datum/status_effect
	/// If pause_expiry is TRUE, the effect will not remove itself when its duration is reached. Can be set to FALSE to unpause expiry at any time.
	var/pause_expiry = FALSE

///Allows expiration of the status effect when its duration reaches 0
/datum/status_effect/proc/enable_expiry()
	SIGNAL_HANDLER

	pause_expiry = FALSE

///Disables expiration of the status effect when its duration reaches 0
/datum/status_effect/proc/disable_expiry()
	SIGNAL_HANDLER

	// SS1984 ADDITION START
	if (owner.lastclienttime == 0) // if wasn't controlled by player ever, then lastclienttime would be 0
		return
	// SS1984 ADDITION END

	pause_expiry = TRUE
