require 'sinatra'
require 'json'
require 'sequel'
DB = Sequel.connect('postgres://localhost/benchmark_compare_dev')


get '/' do 
  content_type :json
  { message: 'Hello, World!' }.to_json
end

get '/api/v1/olympians' do
  content_type :json
  result = DB.from(:olympians).all
  { olympians: result }.to_json
end