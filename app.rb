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

#Test this function using http://localhost:4567/move_rover/N
post '/move_rover/:direction' do
    direction = params['direction'].upcase
    request_payload = JSON.parse(request.body.read)

    begin
        result = move_rover(direction,request_payload)
        json(result)
    rescue StandardError => e
        status 500
        json(error: e.message)
    end
end

#Test this function using http://localhost:4567/turn_left/N
post '/turn_left/:direction' do
    direction = params['direction'].upcase
    request_payload = JSON.parse(request.body.read)

    result = turn_left(request_payload)
    json(result)
end

#Test this function using http://localhost:4567/turn_right/N
post '/turn_right/:direction' do
    direction = params['direction'].upcase
    request_payload = JSON.parse(request.body.read)

    result = turn_right(request_payload)
    json(result)
end

#Test this function using http://localhost:4567/move_rover_in_all_directions/N
post '/move_rover_in_all_directions/:direction' do
    direction = params['direction'].upcase
    request_payload = JSON.parse(request.body.read)

    result = move_rover_in_all_directions(request_payload)
    json(result)
end

#Test this function using http://localhost:4567/move_rover_anywhere/LMLMLMLMM
post '/move_rover_anywhere/:instructions' do
    request_payload = JSON.parse(request.body.read)

    result = move_rover_anywhere(request_payload)
    json(result)
end

#Test this function using http://localhost:4567/move_rover_on_plateau/LMLMLMLMM
post '/move_rover_on_plateau/:instructions' do
    request_payload = JSON.parse(request.body.read)

    plateau["x"] = request_payload["plateau_x"]
    plateau["y"] = request_payload["plateau_y"]

    rover["rover_x"] = request_payload["rover_x"]
    rover["rover_y"] = request_payload["rover_y"]
    rover["direction"] = request_payload["direction"]
    rover["instructions"] = request_payload["instructions"]
    result = move_rover_on_plateau(rover,plateau)
    json(result)
end