require 'sinatra'

class Hexit < Sinatra::Base
  set :sessions, true
  set :root, File.dirname(__FILE__)

  get '/' do
    'Hello'
  end
  
  get '/hex' do
    params[:data]
  end
end

