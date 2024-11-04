require 'rspec'
require_relative '../marsrover'

RSpec.describe "Validate Rovers & their movements" do
    
    before(:each) do 
        plateau = {
            x: 25, 
            y: 25,
            rover: {
                x: 0, 
                y: 0, 
                direction: "N" 
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
            expect(move_rover()).to be true
        end
    end

=begin #Will Update & Activate this spec when we add a functionality to add & manage multiple rovers
    context "validate if the rover2 is also working for validating basic array " do
        it "should test if the code works for both rovers as exepcted" do
            expect(move_rover()).to be true
        end
    end
=end

    context "validate rover sideways movements" do
        it "should validate if the rover can move left" do
            expect(turn_left()).to be true
        end

        it "should validate if the rover can move right" do
            expect(turn_right()).to be true
        end
    end

    context "vaildate if the rover moves as expected in all the directions" do        
        it "should validate if the rover can move in all the directions" do
            expect(move_rover_in_all_directions()).to include("x" => 1, "y" => 3, "direction" => 'N')
        end
    end

    context "vaildate if the rover moves as expected in all the directions when there are a series of instructions " do        
        it "should validate if the rover can move with a series of instructions" do
            rover = { "id" => "rover1", "x" => 1, "y" => 2, "direction" => "N", "instructions" => 'LMLMLMLMM'}
            move_rover_anywhere(rover)
            expect(rover).to include("x" => 1, "y" => 3, "direction" => 'N')

            rover = { "id" => "rover1", "x" => 3, "y" => 3, "direction" => "E", "instructions" => 'MMRMMRMRRM'}
            move_rover_anywhere(rover)
            expect(rover).to include("x" => 5, "y" => 1, "direction" => 'E')
        end
    end

    context "vaildate if the rover moves within plateau boundaries" do        
        plateau = {"x" => 5, "y" => 5}
        it "should validate if the rover within plateau boundaries" do
            rover = { "id" => "rover1", "x" => 1, "y" => 2, "direction" => "N", "instructions" => 'LMLMLMLMM'}
            result = move_rover_on_plateau(rover, plateau)
            expect(result).to be true
        end

        it "should validate if the rover within plateau boundaries" do
            rover = { "id" => "rover1", "x" => 3, "y" => 3, "direction" => "E", "instructions" => 'MMRMMRMRRM'}
            result = move_rover_on_plateau(rover, plateau)
            expect(result).to be true
        end

        it "should validate if the rover within plateau boundaries" do
            rover = { "id" => "rover1", "x" => 3, "y" => 3, "direction" => "E", "instructions" => 'MMRMMRMRRMMMMMMMMMMMM'}
            result = move_rover_on_plateau(rover, plateau)
            expect(result).to be false
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