#ifndef RUST_G_CELADON
/var/__rust_g_celadon

/proc/__detect_rust_g_celadon()
	if (world.system_type == UNIX)
		if (fexists("./librust_celadon.so"))
			return __rust_g_celadon = "./librust_celadon.so"
		return __rust_g_celadon = "librust_celadon.so"
	else
		return __rust_g_celadon = "rust_celadon.dll"

#define RUST_G_CELADON (__rust_g_celadon || __detect_rust_g_celadon())
#endif
