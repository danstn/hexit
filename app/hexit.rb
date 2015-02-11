require 'sinatra'

class Hexit < Sinatra::Base
  set :root, File.dirname(__FILE__)

  get '/' do
    'Hello from Hexit!'
  end
end

