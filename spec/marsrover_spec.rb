require 'rspec'
require_relative '../marsrover'

RSpec.describe "Validate Rovers & their movements" do

    context "validate if the rover1 is working" do
        it "should test if the rover can move" do
            # Initializing a rover1
            rover = { id: "rover1", x: 0, y: 0, direction: "N" }

            move_rover(rover)
            expect(rover[:y]).to eq(1)
        end
    end

    context "validate if the rover2 is also working for validating basic array " do
        it "should test if the code works for both rovers as exepcted" do
            # Initializing a rover2
            rover = { id: "rover2", x: 0, y: 0, direction: "N" }

            move_rover(rover)
            expect(rover[:y]).to eq(1)
        end
    end

    context "validate rover sideways movements" do
        it "should validate if the rover can move left" do
            rover = { id: "rover1", x: 0, y: 0, direction: "N" }
            turn_left(rover)
            expect(rover[:direction]).to eq('W')
        end

        it "should validate if the rover can move right" do
            rover = { id: "rover1", x: 0, y: 0, direction: "N" }
            turn_right(rover)
            expect(rover[:direction]).to eq('E')
        end
    end

=begin
    context "validate " do
        it "" do
            expect().to eq()
        end
    end
=end
end