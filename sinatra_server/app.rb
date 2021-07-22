require 'sinatra'
require 'sinatra/cross_origin'
require 'sinatra/json'
require 'Game'
require 'Board'

configure do
  enable :sessions unless test?
  enable :cross_origin
  set :session_secret, "secret"
end

before do
  response.headers['Access-Control-Allow-Origin'] = '*'
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

post '/make_move' do
  data = JSON.parse request.body.read
  player_move = data['playerMove']
  session[:tictactoe_game].submit_move(player_move)
  json :board => session[:tictactoe_game].format_board,
    :game_over => session[:tictactoe_game].ended?,
    :victory => session[:tictactoe_game].victory?,
    :current_player => session[:tictactoe_game].current_player
end

options "*" do
  response.headers["Access-Control-Allow-Methods"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Content-Type"
  200
end