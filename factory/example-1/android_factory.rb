require_relative 'feature_button/android_button'
require_relative 'ui_factory'
require_relative 'feature_menu/android_menu'
require_relative 'feature_dropdown/android_drop_down'
class AndroidFactory
    include UiFactory
    def create_button
        return AndroidButton.new
    end
    
    def create_menu
        return AndroidMenu.new
    end
    
    def create_dropdown
        return AndroidDropDown.new
    end
end