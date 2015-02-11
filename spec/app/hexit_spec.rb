require_relative '../spec_helper'

describe Hexit do

  describe 'get /' do
    subject { get '/' }

    it 'returns 200' do
      expect(subject.status).to eq 200
    end

    it 'says hello' do
      expect(subject.status).to eq 200
      expect(subject.body).to eq('Hello')
    end
  end

  describe 'get /hex' do
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

end
