require 'sinatra'
require 'json'

class Hexit < Sinatra::Base
  set :sessions, true
  set :root, File.dirname(__FILE__)

  helpers do
    def protected!
      return if authorized?
      headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
      halt 401, "Not authorized\n"
    end

    def authorized?
      @auth ||=  Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == ['test', 'test']
    end
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

  get '/secret' do
    protected!
    'This is a secret!'
  end

  private

  def to_hex(string)
    string.each_byte.map { |b| b.to_s(16) }.join
  end
end

