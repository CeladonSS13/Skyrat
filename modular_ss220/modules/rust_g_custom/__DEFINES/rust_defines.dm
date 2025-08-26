#ifndef RUST_G_1984
/var/__rust_g_1984

/proc/__detect_rust_g_1984()
	if (world.system_type == UNIX)
		if (fexists("./librust_1984.so"))
			return __rust_g_1984 = "./librust_1984.so"
		return __rust_g_1984 = "librust_1984.so"
	else
		return __rust_g_1984 = "rust_1984.dll"

#define RUST_G_1984 (__rust_g_1984 || __detect_rust_g_1984())
#endif
