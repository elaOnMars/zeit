require 'spec_helper'

describe Zeit::Resources::Client, :vcr do
  it_behaves_like 'a resource'

  describe '#get' do
    it_behaves_like 'a resource response' do
      subject { Zeit::Resources::Client.new(api_connection).get }

      context 'when authorized' do
        it_behaves_like 'a successful response'

        it 'should return information about the api usage of the current account' do
         json.has_key? 'requests'
         json.has_key? 'tier'
        end
      end

      context 'when unauthorized' do
        it_behaves_like 'an unauthorized request'
      end
    end
  end
end
