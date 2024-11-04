require 'json'
require 'sinatra'
require 'sinatra/json'
require_relative 'marsrover.rb' 

get '/' do
  'Sinatra app is running!'
end

before do
    content_type 'application/json'
end

#Test "Create Plateau" using http://localhost:4567/create_plateau
#Payload {"x" : 25, "y" : 25}
post '/create_plateau' do
    request_payload = JSON.parse(request.body.read)
 
    begin
        result = create_plateau(request_payload)
        json(result)
        #how to respond with a success message?

    rescue StandardError => e
        #How to understand, which error has occurred?
        status 500
        json(error: e.message)
    end
end

#Test "Read Plateau" using http://localhost:4567/read_plateau
get '/read_plateau' do
    begin
        result = read_plateau()
        json(result)
    rescue StandardError => e
        status 500
        json(error: e.message)
    end
end

#Test "Create Plateau/Rover" using http://localhost:4567/plateau/rover
#payload {"id": 1, "x": 1, "y": 2, "direction": "N"}
post '/plateau/rover' do
    request_payload = JSON.parse(request.body.read)

    begin
        result = create_rover(request_payload)
        json(result)
    rescue StandardError => e
        status 500
        json(error: e.message)
    end
end

#Test "Get Rover" using http://localhost:4567/get_rover
get '/get_rover' do
    begin
        result = get_rover()
        json(result)
    rescue StandardError => e
        status 500
        json(error: e.message)
    end
end

#Test this function using http://localhost:4567/move_rover
get '/move_rover' do
    begin
        result = move_rover()
        json(result)
    rescue StandardError => e
        status 500
        json(error: e.message)
    end
end

#Test this function using http://localhost:4567/turn_left
get '/turn_left' do
    result = turn_left()
    json(result)
end

#Test this function using http://localhost:4567/turn_right
get '/turn_right' do
    result = turn_right()
    json(result)
end

#Test this function using http://localhost:4567/move_rover_in_all_directions
get '/move_rover_in_all_directions' do
    result = move_rover_in_all_directions()
    json(result)
end

#/plateau/rovers/{roverid}/instructions/M

#Test this function using http://localhost:4567/move_rover_anywhere/LMLMLMLMM
post '/move_rover_anywhere/:instructions' do
    request_payload = JSON.parse(request.body.read)

    result = move_rover_anywhere(request_payload)
    json(result)
end

#API JSON body text for APIs up until this point.
=begin
{
    "x" : 1,
    "y" : 1,
    "direction" : "N",
    "instructions": "LMLMLM"
}
=end

#Test this function using http://localhost:4567/move_rover_on_plateau/rover
post '/move_rover_on_plateau/:rover' do

    request_payload = JSON.parse(request.body.read)

    plateau = request_payload["plateau"]
    rover = request_payload["plateau"]["rover"]

#    result = move_rover_on_plateau(rover,plateau)
#    json(result)

    puts rover.inspect
    puts plateau.inspect

    begin
        result = move_rover_on_plateau(rover,plateau)
        json(result)
    rescue StandardError => e
        status 500
        json(error: e.message)
    end
end