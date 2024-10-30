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

#Test this function using http://localhost:4567/move_rover_on_plateau/rover
post '/move_rover_on_plateau/:rover' do
    request_payload = JSON.parse(request.body.read)

    plateau = request_payload.keys
    rover = request_payload["plateau"]["rover"]

#    result = move_rover_on_plateau(rover,plateau)
#    json(result)

    begin
        result = move_rover_on_plateau(rover,plateau)
        json(result)
    rescue StandardError => e
        status 500
        json(error: e.message)
    end
end