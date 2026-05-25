require_relative 'observer'
class DisplayDevice
    include Observer
    def update(temp)
        puts "Current Temperature on Display Device: #{temp} C"
    end
end

