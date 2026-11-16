/proc/test_rustg_celadon(input as message)
	var/result = RUSTG_CALL(RUST_G_CELADON, "test_rust_stuff")(input)
	message_admins(result)
	log_runtime(result)
