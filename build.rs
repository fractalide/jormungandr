fn main() {
    let cli_name = option_env!("CLI_NAME").unwrap_or("jcli");
    println!("cargo:rustc-env=CLI_NAME={}", cli_name);
}
