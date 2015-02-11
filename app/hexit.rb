require 'sinatra'
require 'json'

class Hexit < Sinatra::Base
  set :sessions, true
  set :root, File.dirname(__FILE__)

  def to_hex(string)
    string.each_byte.map { |b| b.to_s(16) }.join
  end

  get '/' do
    'Hello'
  end

  get '/hex' do
    content_type :json
    {
      :original => params[:data],
      :hex => to_hex(params[:data])
    }.to_json
  end
end

