require 'spec_helper'

describe Zeit::Resources::Product, :vcr do
  it_behaves_like 'a resource'

  describe '#find' do
    context 'with a simple query' do
      it_behaves_like 'a resource response' do
        let(:query) { 'ZEIT*' }
        subject { Zeit::Resources::Product.new(api_connection).find(query) }

        context 'when authorized' do
          it_behaves_like 'a successful response with some matches'

          it_behaves_like 'all matches have the required keys' do
            let(:keys) { %w(uri) }
          end
        end

        context 'when unauthorized' do
          it_behaves_like 'an unauthorized request'
        end
      end
    end
  end

  describe '#get' do
    it_behaves_like 'a resource response' do
      context 'with an valid product id' do
        let(:id) { 'zede' }

        subject { Zeit::Resources::Product.new(api_connection).get(id) }

        context 'when authorized' do
          it_behaves_like 'a successful response with some matches'

          it 'should have some important values' do
            json.has_key? 'uri'
            json.has_key? 'value'
            json.has_key? 'href'
          end
        end

        context 'when unauthorized' do
          it_behaves_like 'an unauthorized request'
        end
      end

    end
  end
end
