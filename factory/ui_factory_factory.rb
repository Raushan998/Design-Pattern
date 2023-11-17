require_relative 'android_factory'
require_relative 'ios_factory'
class PlatformConstant
    ANDROID = :android
    IOS = :ios
end

class UiFactoryFactory
    def self.get_device(platform)
        case platform
        when PlatformConstant::ANDROID
            return AndroidFactory.new
        when PlatformConstant::IOS
            return IosFactory.new
        else
            raise "Unknown Platform"
        end
    end
end