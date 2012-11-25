require 'spec_helper'

describe Zeit::Resources::Keyword, :vcr do
  it_behaves_like 'a resource'

  describe '#find' do
    context 'with a simple query' do
      it_behaves_like 'a resource response' do
        let(:query) { '*rom*' }
        subject { Zeit::Resources::Keyword.new(api_connection).find(query) }

        context 'when authorized' do
          it_behaves_like 'a successful response with some matches'

          it_behaves_like 'all matches have the required keys' do
            let(:keys) { %w(href uri value type) }
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
      context 'with an valid keyword id' do
        let(:id) { 'internet' }

        subject { Zeit::Resources::Keyword.new(api_connection).get(id) }

        context 'when authorized' do
          it_behaves_like 'a successful response with some matches'

          it 'should have some important values' do
            parsed_json.has_key? 'uri'
            parsed_json.has_key? 'value'
            parsed_json.has_key? 'href'
          end
        end

        context 'when unauthorized' do
          it_behaves_like 'an unauthorized request'
        end
      end

    end
  end
end
