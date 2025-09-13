class Gear
    attr_reader :chainring, :cog

    def initialize(chainring, cog)
        @chainring = chainring
        @cog = cog
    end
    def ratio
        (@chainring / @cog.to_f).round(2)
    end
end

describe Gear do
    it "calculates gear ratio" do
        gear = Gear.new(52,11)
        expect(gear.ratio).to eq(4.73)
    end
end