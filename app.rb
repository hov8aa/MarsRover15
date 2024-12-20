require 'json'
require 'sinatra'
require 'sinatra/json'
require_relative 'marsrover.rb' 

get '/' do
    content_type :html
    erb :index
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

#Display the playteau using http://localhost:4567/plateau
get '/plateau' do
    content_type :html
    var2 = Array.new($mars_plateau["y"]) {|j|"<tr>#{Array.new($mars_plateau["x"]) {|i| i==$mars_plateau["rover"]["x"] && j==$mars_plateau["rover"]["y"] ? "<td>ROVER</td>" : "<td>OOOO</td>"}.join}</tr>"}
    "<html>
    <head>
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    </head>
    <body>

        <table border='1' id='plateau'>
                #{var2.join}
        </table>

        <div align='center'>
        <button><a href='/turn_left'>Turn Left</a></button>
        <button><a href='/turn_right'>Turn Right</a></button>
        <button><a href='/move_rover_in_all_directions'>Move Forward</a></button>
        </div>
    </body>
    </html>"
end

#Test "Read Plateau" using http://localhost:4567/read_plateau
get '/read_plateau' do
    begin
        result = read_plateau()
        json(result)
        #puts "#{result}"
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
    redirect '/plateau'
end

#Test this function using http://localhost:4567/turn_right
get '/turn_right' do
    result = turn_right()
    json(result)
    redirect '/plateau'
end

#Test this function using http://localhost:4567/move_rover_in_all_directions
get '/move_rover_in_all_directions' do
    result = move_rover_in_all_directions()
    json(result)
    redirect '/plateau'
end

#/plateau/rovers/{roverid}/instructions/M

#Test this function using http://localhost:4567/move_rover_anywhere
post '/move_rover_anywhere' do
    request_payload = JSON.parse(request.body.read)

    result = move_rover_anywhere(request_payload)
    json(result)
end

#Test this function using http://localhost:4567/move_rover_on_plateau
post '/move_rover_on_plateau' do
    request_payload = JSON.parse(request.body.read)

    result = move_rover_on_plateau(request_payload)
    json(result)
end