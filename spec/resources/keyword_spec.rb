require 'zeit'
require 'spec_helper'

describe 'Zeit::Resources::Keyword' do
  describe '.new' do
    it 'should require a connection object to be initalized' do
      expect { Zeit::Resources::Keyword.new }.to raise_error
    end
  end
end
