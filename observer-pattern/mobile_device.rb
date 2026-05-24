require_relative 'observer'
class MobileDevice
    include Observer

    def update(temperature)
        puts "Showing the mobile temperature: #{temperature}"
    end
end