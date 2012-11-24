require 'zeit'
require 'spec_helper'

describe 'Zeit::Resources::Client' do
  describe '.new' do
    it 'should require a connection object to be initalized' do
      expect { Zeit::Resources::Client.new }.to raise_error
    end
  end

  describe '#client' do
    let(:api) { Zeit::API.new api_key: 'whatever' }
    subject { Zeit::Resources::Client.new api.connection }

    it 'should return information about the api usage of the current account' do
      #subject.client
    end
  end
end
