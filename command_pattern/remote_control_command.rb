module Command
    def run
        raise "Not Implemented Error"
    end
end
class Light
    def turn_on
        puts "Light is on."
    end

    def turn_off
        puts "Light is off."
    end
end

class Fan
    def turn_on
        puts "Fan is on."
    end

    def turn_off
        puts "Fan is off."
    end
end

module LightCommand
    class LightOnCommand
        include Command
        attr_reader :light
        def initialize(light)
            @light = light
        end

        def run
            @light.turn_on
        end
    end

    class LightOffCommand
        include Command
        attr_reader :light
        def initialize(light)
            @light = light
        end

        def run
            @light.turn_off
        end
    end
end

module FanCommand
    class FanOnCommand
        include Command
        attr_reader :fan
        def initialize(fan)
            @fan = fan
        end

        def run
            @fan.turn_on
        end
    end

    class FanOffCommand
        include Command
        attr_reader :fan
        def initialize(fan)
            @fan = fan
        end

        def run
            @fan.turn_off
        end
    end
end

class Remote
    attr_reader :fan_on_command, :light_on_command, :fan_off_command, :light_off_command
    DYNAMIC_METHOD = {
        turn_off_light: 'light_off_command',
        turn_on_light: 'light_on_command',
        turn_off_fan: 'fan_off_command',
        turn_on_fan: 'fan_on_command'
    }.freeze

    %i[fan_on fan_off light_on light_off].each do |method|
        define_method("set_#{method}_command") do |command|
            instance_variable_set("@#{method}_command", command)
        end
    end

    %i[turn_off_light turn_on_light turn_on_fan turn_off_fan].each do |method|
        define_method(method) do
            instance_variable_get("@#{DYNAMIC_METHOD[method]}").run
        end
    end
end

remote = Remote.new
fan = Fan.new
fan_on_command = FanCommand::FanOnCommand.new(fan)
fan_off_command = FanCommand::FanOffCommand.new(fan)
light = Light.new
light_on_command = LightCommand::LightOnCommand.new(light)
light_off_command = LightCommand::LightOffCommand.new(light)

remote.set_fan_on_command(fan_on_command)
remote.set_fan_off_command(fan_off_command)
remote.set_light_on_command(light_on_command)
remote.set_light_off_command(light_off_command)
remote.turn_off_light
remote.turn_on_light
remote.turn_off_fan
remote.turn_on_fan