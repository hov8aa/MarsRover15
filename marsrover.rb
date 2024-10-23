# Defining the array to hold rovers
rovers = []

# Initializing a rover
#rovers << { id: "rover1", x: 0, y: 0, direction: "N", instructions: "LMLMLMLMM"}
#rovers << { id: "rover2", x: 0, y: 0, direction: "E", instructions: "LMLMLMLMM"}

# Function to move a rover 1 step forward & test it's basic functioning
def move_rover(rover)
    rover[:y] += 1
end

def turn_left(rover)
    if rover[:direction] == 'N'
        rover[:direction] = 'W'
    elsif rover[:direction] == 'W'
        rover[:direction] = 'S'
    elsif rover[:direction] == 'S'
        rover[:direction] = 'E'
    elsif rover[:direction] == 'E'
        rover[:direction] = 'N'
    end
end

def turn_right(rover)
    if rover[:direction] == 'N'
        rover[:direction] = 'E'
    elsif rover[:direction] == 'E'
        rover[:direction] = 'S'
    elsif rover[:direction] == 'S'
        rover[:direction] = 'W'
    elsif rover[:direction] == 'W'
        rover[:direction] = 'N'
    end
end

def move_rover_in_all_directions(rover)
    if rover[:direction] == 'N'
        rover[:y] += 1
    elsif rover[:direction] == 'E'
        rover[:x] += 1
    elsif rover[:direction] == 'S'
        rover[:y] -= 1
    elsif rover[:direction] == 'W'
        rover[:x] -= 1
    end
end

def move_rover_anywhere(rover)
    rover[:instructions].each_char do |char|
        if char == 'L'
            turn_left(rover)
        elsif char == 'R'
            turn_right(rover)
        elsif char == 'M'
            move_rover_in_all_directions(rover)
        end
    end
end

def move_rover_on_plateau(rover,plateau)

    move_rover_anywhere(rover)

    if rover[:x] <= plateau[:x] && rover[:y] <= plateau[:y] && rover[:x] >=0 && rover[:y] >= 0
        true
    else
        false
    end 
end

# UI Layer
def ui_turn_left()
    puts "Let's turn the rover to LEFT, hit enter to continue"
    input = gets.chomp
  
    puts "Enter the initial direction of the rover (N, E, S, W):"
    direction = gets.chomp
  
    # Initialize the rover hash with user inputs
    rover = { id: "rover1", direction: direction }
    
    puts "Processing rover with ID: #{rover[:id]} facing #{rover[:direction]}"
    turn_left(rover)
  
    puts "Rover's direction after turning left is #{rover[:direction]}"
end

def ui_turn_right()
    puts "Let's turn the rover to RIGHT, hit enter to continue"
    input = gets.chomp
  
    puts "Enter the initial direction of the rover (N, E, S, W):"
    direction = gets.chomp
  
    # Initialize the rover hash with user inputs
    rover = { id: "rover1", direction: direction }
    
    puts "Processing rover with ID: #{rover[:id]} facing #{rover[:direction]}"
    turn_right(rover)
  
    puts "Rover's direction after turning right is #{rover[:direction]}"
end

def ui_move_rover_in_all_directions()
    puts "Let's test if the rover can move in all the directions, hit enter to continue"
    input = gets.chomp

    puts "Enter the X coordinate of the initial position of rover:"
    x = gets.chomp.to_i

    puts "Enter the Y coordinate of the initial position of rover:"
    y = gets.chomp.to_i

    puts "Enter the initial direction of the rover (N, E, S, W):"
    direction = gets.chomp

    rover = { id: "rover1", x: x, y: y, direction: direction }

    puts "Processing rover with ID: #{rover[:id]} at coordinates #{rover[:x]},#{rover[:y]} facing #{rover[:direction]}"
    move_rover_in_all_directions(rover)

    puts "Rover's final position after movement is #{rover[:x]},#{rover[:y]} facing #{rover[:direction]}"
end

def ui_move_rover_anywhere()
    puts "Let's test if the rover can move ANYWHERE with a series of instructions, hit enter to continue"
    input = gets.chomp

    puts "Enter the X coordinate of the initial position of rover:"
    x = gets.chomp.to_i

    puts "Enter the Y coordinate of the initial position of rover:"
    y = gets.chomp.to_i

    puts "Enter the initial direction of the face of the rover (N, E, S, W):"
    direction = gets.chomp

    puts "Final step, Enter the instructions to move the rover in the form of 'L for Left','R for Right' & 'M for one step forward movement:"
    instructions = gets.chomp

    rover = { id: "rover1", x: x, y: y, direction: direction, instructions: instructions }

    puts "Processing rover with ID: #{rover[:id]} at coordinates #{rover[:x]},#{rover[:y]} facing #{rover[:direction]}"
    move_rover_anywhere(rover)

    puts "Rover's final position after movement is #{rover[:x]},#{rover[:y]} facing #{rover[:direction]}"
end

def ui_move_rover_on_plateau()
    puts "Let's test if the rover moves within PLATEAU range with a series of instructions, hit enter to continue"
    input = gets.chomp

    puts "Please enter the right top corner (X) coordinate of the plateau"
    plateau_x = gets.chomp.to_i

    puts "Now, Please enter the right top corner (Y) coordinate of the plateau"
    plateau_y = gets.chomp.to_i

    puts "Enter the X coordinate of the initial position of rover:"
    x = gets.chomp.to_i

    puts "Enter the Y coordinate of the initial position of rover:"
    y = gets.chomp.to_i

    puts "Enter the initial direction of the face of the rover (N, E, S, W):"
    direction = gets.chomp

    puts "Final step, Enter the instructions to move the rover in the form of 'L for Left','R for Right' & 'M for one step forward movement:"
    instructions = gets.chomp

    rover = { id: "rover1", x: x, y: y, direction: direction, instructions: instructions }
    plateau = { x: plateau_x, y: plateau_y }

    puts "Processing rover with ID: #{rover[:id]} at coordinates #{rover[:x]},#{rover[:y]} facing #{rover[:direction]}"
    result = move_rover_on_plateau(rover, plateau)

    if result == true
        puts "Rover's final position after movement is #{rover[:x]},#{rover[:y]} facing #{rover[:direction]}"
        puts "This position is WITHIN plateau dimensions"
    elsif result == false
        puts "Rover's final position after movement is #{rover[:x]},#{rover[:y]} facing #{rover[:direction]}"
        puts "This position is OUTSIDE plateau dimensions"
    end
end

def LetsPlay()

    choice = 1
    puts "Welcome to Mars, You have an option to play with the rovers, here is your menu\n"
    puts "1. Turn Rover left\n"
    puts "2. Turn Rover Right\n"
    puts "3. Move Rover in 1 step forward in any direction"
    puts "4. Move Rover anywhere on mars"
    puts "5. Move Rover within a given plateau"

    menu = gets.chomp.to_i

    while choice !=0
        if menu == 1
            ui_turn_left()
        elsif menu == 2
            ui_turn_right()
        elsif menu == 3
            ui_move_rover_in_all_directions()
        elsif menu == 4
            ui_move_rover_anywhere()
        elsif menu == 5
            ui_move_rover_on_plateau()
        end

        puts "\nWould you like to retry? Press 0 to EXIT, 1 to retry"
        choice = gets.chomp.to_i
    end
end