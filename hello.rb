require 'sinatra'

get '/' do
  erb :index
end

not_found do
erb :error
end
