use slint_build::CompilerConfiguration;

#[cfg(windows)]
use winres;

fn main() {
    #[cfg(windows)]
    {
        slint_build::compile_with_config(
            "ui/appwindow.slint",
            CompilerConfiguration::new().with_style("fluent".to_string()),
        )
        .unwrap();
        let mut resource = winres::WindowsResource::new();
        resource.set_icon("ui/images/Product.ico");
        resource.compile().unwrap();
    }
    #[cfg(unix)]
    {
        slint_build::compile_with_config(
            "ui/appwindow.slint",
            CompilerConfiguration::new().with_style("native".to_string()),
        )
        .unwrap();
    }
}
