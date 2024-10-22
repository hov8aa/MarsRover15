# Defining the array to hold rovers
rovers = []

# Initializing a rover
rovers << { id: "rover1", x: 0, y: 0, direction: "N" }
rovers << { id: "rover2", x: 0, y: 0, direction: "E" }

# Function to move a rover 1 step forward & test it's basic functioning
def move_rover(rover)
    rover[:y] += 1
end

