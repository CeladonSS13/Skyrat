use rust_g::error::*; // THIS IS IMPORTANT AND SHOULD BE IN ALL MODULAR RUST .rs FILES THAT USE byond_fn, otherwise it won't compile

byond_fn!(fn test_rust_stuff(input) {
    test_rust_func(input).ok()
});

fn test_rust_func(input: &str) -> Result<String> {
    let res = format!("{}{}", input, " good");
    Ok(res)
}
