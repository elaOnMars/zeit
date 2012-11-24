require 'zeit'
require 'spec_helper'

describe 'Zeit::Resources::Author' do
  describe '.new' do
    it 'should require a connection object to be initalized' do
      expect { Zeit::Resources::Author.new }.to raise_error
    end
  end
end
