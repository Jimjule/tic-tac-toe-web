require 'sinatra'
require 'mongoid'
require 'sinatra/cross_origin'
require 'sinatra/json'
require 'Game'
require 'Board'
require_relative 'workers/add_game_worker'
require_relative 'workers/count_games_worker'
require_relative 'workers/delete_games_worker'
require_relative 'workers/echo_worker'
require_relative 'workers/get_games_worker'

client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'tictactoe')

configure do
  enable :sessions unless test?
  enable :cross_origin
  set :session_secret, "secret"
end

get '/game_setup' do
  board = Board.new(3)
  @tictactoe_game = Game.new(board, 'X', 'O')
  session[:tictactoe_game] = @tictactoe_game
  json :board => session[:tictactoe_game].format_board
end

get '/health_check' do
  json :health => 'System Health: true'
end

get '/view_board' do
  json :board => session[:tictactoe_game].format_board
end

get '/make_move' do
  player_move = params['player_move']
  collection = client[:tictactoe_games]
  session[:tictactoe_game].submit_move(player_move)
  AddGameWorker.new.perform(collection, { board: session[:tictactoe_game].format_board }) if session[:tictactoe_game].ended?
  json :board => session[:tictactoe_game].format_board,
    :game_over => session[:tictactoe_game].ended?,
    :victory => session[:tictactoe_game].victory?,
    :current_player => session[:tictactoe_game].current_player
end

post '/make_move' do
  data = JSON.parse request.body.read
  player_move = data['playerMove']
  collection = client[:tictactoe_games]
  session[:tictactoe_game].submit_move(player_move)
  AddGameWorker.new.perform(collection, { board: session[:tictactoe_game].format_board }) if session[:tictactoe_game].ended?
  json :board => session[:tictactoe_game].format_board,
    :game_over => session[:tictactoe_game].ended?,
    :victory => session[:tictactoe_game].victory?,
    :current_player => session[:tictactoe_game].current_player
end

get '/all_games' do
  collection = client[:tictactoe_games]
  GetGamesWorker.new.perform(collection)
end

get '/games_count' do
  collection = client[:tictactoe_games]
  CountGamesWorker.new.perform(collection)
end

get '/add_game' do
  collection = client[:tictactoe_games]
  game = { board: session[:tictactoe_game].format_board }
  AddGameWorker.new.perform(collection, game)
end

get '/delete_games' do
  collection = client[:tictactoe_games]
  DeleteGamesWorker.new.perform(collection)
end

get '/sidekiq_test' do
  echo = params['echo']
  EchoWorker.new.perform(echo)
end


options "*" do
  response.headers["Access-Control-Allow-Methods"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "*"
  200
end
