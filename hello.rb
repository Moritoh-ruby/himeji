require 'sinatra'

get '/' do
  erb :index
end

not_found do
  erb :error
end

get '/setting' do
  erb :setting
end
