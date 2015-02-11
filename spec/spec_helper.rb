# spec/spec_helper.rb
ENV['RACK_ENV'] = 'test'

require 'rack/test'

require_relative File.join('..', 'app/hexit')

RSpec.configure do |config|
  include Rack::Test::Methods

  def app
    Hexit
  end
end
