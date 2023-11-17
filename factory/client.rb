require_relative 'ui_factory_factory'
client_app = UiFactoryFactory.get_device(PlatformConstant::ANDROID)
client_app.create_button.print_button
client_app.create_menu.print_menu
client_app.create_dropdown.print_dropdown
puts "==============================================================================="
client_app = UiFactoryFactory.get_device(PlatformConstant::IOS)
client_app.create_button.print_button
client_app.create_menu.print_menu
client_app.create_dropdown.print_dropdown