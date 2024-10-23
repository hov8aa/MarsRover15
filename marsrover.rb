# Defining the array to hold rovers
rovers = []

# Initializing a rover
rovers << { id: "rover1", x: 0, y: 0, direction: "N", instructions: "LMLMLMLMM"}
rovers << { id: "rover2", x: 0, y: 0, direction: "E", instructions: "LMLMLMLMM"}

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