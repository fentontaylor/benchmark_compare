require 'sinatra'
require 'json'

get '/' do 
  content_type :json
  { message: 'Hello, World!' }.to_json
end