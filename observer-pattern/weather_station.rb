require_relative 'display_device'
require_relative 'subject'
class WeatherStation
    attr_reader :temperature, :display_device, :observers
    
    def initialize
        @observers = []
    end

    def add_observer(obj)
      @observers << obj
    end

    def remove_observer(obj)
      @observers.delete(obj)
    end

    def notify_observers
      @observers.each {|obj| obj.update(temperature)}
    end

     def set_temperature(temp)
        @temperature = temp
        notify_observers
     end
end