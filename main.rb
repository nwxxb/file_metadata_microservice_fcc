require 'sinatra'
require 'pry'

set :public_folder, 'public'

get '/' do
  erb :index
end

post '/api/fileanalyse' do
  content_type 'application/json'

  {
    name: params['upfile']['filename'],
    type: params['upfile']['type'],
    size: File.size(params['upfile']['tempfile'])
  }.to_json
end
