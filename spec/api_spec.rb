require 'zeit'
require 'spec_helper'

describe 'Zeit::API' do
  describe '.inititalize' do
    it 'should be able to initialized with an api_key' do
      zeit = Zeit::API.new api_key: 'something'
      zeit.should be_instance_of(Zeit::API)
    end

    it 'should initialize a faraday  connection object' do
      zeit = Zeit::API.new api_key: 'something'
      zeit.connection.should be_instance_of(Faraday::Connection)
    end
  end

  describe '.author' do
    subject { Zeit::API.new api_key: 'something' }
    its(:author) { should be_instance_of(Zeit::Resources::Author) }
  end

  describe '.client' do
    subject { Zeit::API.new api_key: 'something' }
    its(:client) { should be_instance_of(Zeit::Resources::Client) }
  end

end
