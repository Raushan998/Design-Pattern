require_relative 'feature_button/ios_button'
require_relative 'feature_menu/ios_menu'
require_relative 'feature_dropdown/ios_drop_down'
class IosFactory
    include UiFactory
    def create_button
        return IosButton.new
    end
    
    def create_menu
        return IosMenu.new
    end
    
    def create_dropdown
        return IosDropDown.new
    end
end