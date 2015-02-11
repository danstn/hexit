require 'sinatra'

class Hexit < Sinatra::Base
  set :sessions, true
  set :root, File.dirname(__FILE__)

  get '/' do
    'HELLO FROM HEXIT!'
  end
end

