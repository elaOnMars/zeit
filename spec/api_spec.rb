require 'zeit'
require 'spec_helper'

describe Zeit::API do
  subject { authorized_api_client }

  describe '.new' do
    it 'should be able to initialized with an api_key' do
      subject.should be_instance_of(Zeit::API)
    end

    it 'should initialize a faraday connection object' do
      subject.connection.should be_instance_of(Faraday::Connection)
    end

    it 'should raise an error when :api_key parameter is missing' do
      expect { Zeit::API.new }.to raise_error
    end
  end

  describe '#author' do
    its(:author) { should be_instance_of(Zeit::Resources::Author) }
  end

  describe '#client' do
    its(:client) { should be_instance_of(Zeit::Resources::Client) }
  end

  describe '#content' do
    its(:content) { should be_instance_of(Zeit::Resources::Content) }
  end
end
