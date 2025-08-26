/proc/test_rustg_1984(input as message)
	var/result = RUSTG_CALL(RUST_G_1984, "test_rust_stuff")(input)
	message_admins(result)
	log_runtime(result)
