slint::include_modules!();

fn main() -> Result<(), slint::PlatformError> {
    let ui = AppWindow::new()?;

    ui.set_scale(ui.window().scale_factor());

    let ui_handle = ui.as_weak();

    ui.run()
}
