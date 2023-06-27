slint::include_modules!();

fn main() -> Result<(), slint::PlatformError> {
    let ui = AppWindow::new()?;

    ui.set_scale(ui.window().scale_factor());

    ui.run()
}
