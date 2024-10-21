require 'rspec'
require_relative '../marsrover'

RSpec.describe "Validate Rovers & their movements" do

    context "validate if the rover is working" do
        it "should test if the rover can move" do
            # Initializing a rover
            rover = { id: "rover1", x: 0, y: 0, direction: "N" }

            move_rover(rover)
            expect(rover[:y]).to eq(1)
        end
    end

end