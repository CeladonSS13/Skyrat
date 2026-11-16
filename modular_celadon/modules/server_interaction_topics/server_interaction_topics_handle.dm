#define CODE_INVALID 0
#define CODE_TEST 1
#define CODE_LISTEN_FOR_GUESTS 2

GLOBAL_VAR_INIT(LISTEN_FOR_GUEST_INTERACTION, FALSE)
GLOBAL_PROTECT(LISTEN_FOR_GUEST_INTERACTION)

/world/handle_custom_server_to_server_topic(code_received, list/args_received)
	if (IsAdminAdvancedProcCall())
		return

	var/result_msg = handle_custom_command(code_received, args_received)
	if (!result_msg)
		return "Ok"
	return result_msg

/world/proc/handle_custom_command(cmd, list/arguments)
	if (IsAdminAdvancedProcCall())
		return

	switch (cmd)
		if (CODE_INVALID) // aka invalid
			return "Invalid, yet received"
		if (CODE_TEST) // aka test
			log_topic("test")
			return
		if (CODE_LISTEN_FOR_GUESTS)
			return handle_guests_interaction(arguments)
		else
			return "Invalid code"

/world/proc/handle_guests_interaction(list/arguments)
	if (IsAdminAdvancedProcCall())
		return
	if (GLOB.LISTEN_FOR_GUEST_INTERACTION)
		return "Already transferring"
	GLOB.LISTEN_FOR_GUEST_INTERACTION = TRUE
	return "Will transfer for all guest interactions from now"

