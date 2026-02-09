/world/Topic(T, addr, master, key)
	if (IsAdminAdvancedProcCall()) // imagine someone will actually try to exploit it that way and spoof ip
		return
	// So it's basically to silent continue execution in ALL cases when our requirements are not satisfied
	if (!T || !addr)
		return ..(T, addr, master, key)

	if (!CONFIG_GET(flag/compatible_to_server_interaction))
		return ..(T, addr, master, key)

	var/required_ip = CONFIG_GET(string/accept_commands_from_server_ip)
	if (!required_ip || required_ip != addr)
		return ..(T, addr, master, key)

	var/required_key = CONFIG_GET(string/commanding_server_password)
	if (!required_key)
		return ..(T, addr, master, key)

	// Ok so at this point we actually need to decode what we received
	var/list/params = params2list(T)
	if (!params)
		return ..(T, addr, master, key)

	var/json = params["topic"] // should match at client app
	if (!json)
		return ..(T, addr, master, key)

	var/list/topic_parameters = json_decode(json)
	if(!topic_parameters)
		return ..(T, addr, master, key)

	var/key_received = topic_parameters["key"]
	if (!key_received || key_received != required_key)
		return ..(T, addr, master, key)

	var/code_received = topic_parameters["code"]
	if (!code_received)
		return ..(T, addr, master, key)

	var/list/args_received = topic_parameters["arguments"] // could be null

	// Ok it seems that its valid topic, or at least we assume it at that point
	// First lets go the original way
	. = ..(T, addr, master, key)

	var/response = handle_custom_server_to_server_topic(code_received, args_received)
	if (.) // Give original return value priority if it's not null
		return .
	return response

/world/proc/handle_custom_server_to_server_topic(code_received, list/args_received) // to be overriden by other modules
	log_topic("Please override handle_custom_server_to_server_topic proc with your logic if you use that system. Don't call base method")
