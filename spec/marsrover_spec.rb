require 'rspec'
require_relative '../marsrover'

RSpec.describe "Validate Rovers & their movements" do
    
    before(:each) do 
        $mars_plateau = {
            "x" => 25, 
            "y" => 25,
            "rover" => {
                "x" => 0, 
                "y" => 0, 
                "direction" => "N"
            }
        }
    end

    context "validate plateau creation" do
        it "should validate if the plateau gets created" do
            plateau = {"x": 25, "y": 25}
            expect(create_plateau(plateau)).to be true
        end
    end

    context "validate rover creation on a plateau" do
        it "should validate if the rover gets created on a plateau" do
            rover = {id: 1, x: 1, y: 2, direction: "N"}
            expect(create_rover(rover)).to be true
        end
    end

    context "validate if the rover1 is working" do
        it "should test if the rover can move" do
            move_rover()
            expect($mars_plateau).to include("rover" => { "x" => 1, "y" => 0, "direction" => "N" })
        end
    end

    context "validate rover sideways movements" do
        it "should validate if the rover can move left" do
            turn_left()
            expect($mars_plateau).to include("rover" => { "x" => 0, "y" => 0, "direction" => "W" })
        end

        it "should validate if the rover can move right" do
            turn_right()
            expect($mars_plateau).to include("rover" => { "x" => 0, "y" => 0, "direction" => "E" })
        end
    end

    context "vaildate if the rover moves as expected in all the directions" do
        it "should validate if the rover can move in all the directions" do
            move_rover_in_all_directions()
            expect($mars_plateau).to include("rover" => { "x" => 0, "y" => 1, "direction" => "N" })
        end
    end

    context "vaildate if the rover moves as expected in all the directions when there are a series of instructions " do        
        it "should validate if the rover can move with a series of instructions" do
            instructions = { "instructions" => "LMLMLMLMM"}
            move_rover_anywhere(instructions)
            expect($mars_plateau).to include("rover" => { "x" => 0, "y" => 1, "direction" => "N" })

            instructions = { "instructions" => "MMRMMRMRRM"}
            move_rover_anywhere(instructions)
            expect($mars_plateau).to include("rover" => { "x" => 2, "y" => 3, "direction" => "N" })
        end
    end

    context "vaildate if the rover moves within plateau boundaries" do        
        it "should validate if the rover within plateau boundaries" do
            instructions = { "instructions" => "LMLMLMLMM"}
            result = move_rover_on_plateau(instructions)
            expect(result).to be true
        end

        it "should validate if the rover within plateau boundaries" do
            instructions = { "instructions" => "LMLMLMLMM"}
            result = move_rover_on_plateau(instructions)
            expect(result).to be true
        end

        it "should validate if the rover within plateau boundaries" do
            instructions = { "instructions" => "MMRMMRMRRMMMMMMMMMMMM"}
            result = move_rover_on_plateau(instructions)
            expect(result).to be true
        end
    end    

end