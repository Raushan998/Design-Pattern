require_relative 'display_device'
require_relative 'weather_station'
require_relative 'mobile_device'
display_device = DisplayDevice.new
mobile_device = MobileDevice.new
weather_station = WeatherStation.new()
weather_station.add_observer(display_device)
weather_station.add_observer(mobile_device)

weather_station.set_temperature(26)
weather_station.remove_observer(display_device)
weather_station.set_temperature(30)


