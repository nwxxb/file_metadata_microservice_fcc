require 'sinatra'
require 'sinatra/cors'

set :allow_origin, '*'
set :allow_methods, 'GET,HEAD,POST'
set :allow_headers, 'content-type,if-modified-since'
set :expose_headers, 'location,link'
set :public_folder, 'public'

get '/' do
  erb :index
end

post '/api/fileanalyse' do
  if params['upfile'].nil?
    content_type 'application/json'
    halt 400, { error: 'file not exist' }.to_json
  else
    content_type 'application/json'
    {
      name: params['upfile']['filename'],
      type: params['upfile']['type'],
      size: File.size(params['upfile']['tempfile'])
    }.to_json
  end
end
