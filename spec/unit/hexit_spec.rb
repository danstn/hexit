require_relative '../spec_helper'

describe Hexit do

  describe 'get /' do
    before do
      get '/'
    end

    it 'says hello' do
      expect(last_response.status).to eq 200
      expect(last_response.body).to eq('Hello')
    end
  end

  describe 'get /hex' do
    before do
      get '/hex', { data: 'test' }
    end

    it 'returns the original payload' do
      expect(last_response.body).to eq('test')
    end

  end

end
