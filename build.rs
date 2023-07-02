use slint_build::CompilerConfiguration;

#[cfg(windows)]
use winres;

fn main() {
    slint_build::compile_with_config(
        "ui/appwindow.slint",
        CompilerConfiguration::new().with_style("fluent".to_string()),
    )
    .unwrap();

    #[cfg(windows)]
    {
        let mut resource = winres::WindowsResource::new();
        resource.set_icon("ui/images/Product.ico");
        resource.compile().unwrap();
    }
}
