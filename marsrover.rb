# Defining the array to hold rovers
rovers = []

# Initializing a rover
#rovers << { id: "rover1", x: 0, y: 0, direction: "N" }

# Function to move a rover forward
def move_rover(rover)
    rover[:y] += 1
end

