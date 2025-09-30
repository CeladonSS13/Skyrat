/datum/ai_controller/PossessPawn(atom/new_pawn)
	. = ..()
	// Unregister is done at middle of /datum/ai_controller/proc/UnpossessPawn(destroy)
	RegisterSignal(pawn, COMSIG_MOB_GHOSTIZED, PROC_REF(on_pawn_ghostized_1984))

/datum/ai_controller/proc/on_pawn_ghostized_1984()
	SIGNAL_HANDLER
	reset_ai_status()
