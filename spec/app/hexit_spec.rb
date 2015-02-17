require_relative '../spec_helper'

describe Hexit do

  describe 'GET /' do
    subject { get '/' }

    it 'returns 200' do
      expect(subject.status).to eq 200
    end

    it 'says hello' do
      expect(subject.status).to eq 200
      expect(subject.body).to eq('Hello')
    end
  end


  describe 'GET /hex' do
    subject { get '/hex', query }

    let(:query) { { :data => 'test' } }
    let(:query_orig) { 'test' }
    let(:query_hex) { '74657374' }
    let(:hex_response) { { :original => 'test' }.to_json }

    it 'returns 200' do
      expect(subject.status).to eq 200
    end

    it 'returns data as json' do
      expect(subject.content_type).to eq('application/json')
    end

    it 'returns original and hex verions of the quiery' do
      response = JSON.parse subject.body
      expect(response['original']).to eq query_orig
      expect(response['hex']).to eq query_hex
    end
  end


  describe 'GET /secret' do

    subject(:response) { get '/secret' }

    context 'when the auth is successful' do
      before do
        authorize 'test', 'test'
      end

      it 'returns 200' do
        expect(response.status).to eq 200
      end
    end

    context 'when the auth is not successful' do
      it 'returns 401' do
        expect(response.status).to eq 401
      end
    end

  end

end
