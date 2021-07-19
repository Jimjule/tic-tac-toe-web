require 'sinatra'
require 'sinatra/json'

get '/' do
  
end

get '/health-check' do
  json :health => 'System Health: true'
end
