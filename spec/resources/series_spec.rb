require 'spec_helper'

describe Zeit::Resources::Series, :vcr do
  it_behaves_like 'a resource'

  describe '#find' do
    context 'with a simple query' do
      it_behaves_like 'a resource response' do
        let(:query) { '*er*' }
        subject { Zeit::Resources::Series.new(api_connection).find(query) }

        context 'when authorized' do
          it_behaves_like 'a successful response with some matches'

          it_behaves_like 'all matches have the required keys' do
            let(:keys) { %w(uri href) }
          end
        end

        context 'when unauthorized' do
          it_behaves_like 'an unauthorized request'
        end
      end
    end
  end

  describe '#get' do
    # FIXME still broken at api.zeit.de :(
    #
    #
    #it_behaves_like 'a resource response' do
    #  context 'with an valid series id' do
    #    let(:id) { 'ausprobiert' }

    #    subject { Zeit::Resources::Series.new(api_connection).get(id) }

    #    context 'when authorized' do
    #      it_behaves_like 'a successful response with some matches'

    #      it 'should have some important values' do
    #        json.has_key? 'uri'
    #        json.has_key? 'value'
    #        json.has_key? 'href'
    #      end
    #    end

    #    context 'when unauthorized' do
    #      it_behaves_like 'an unauthorized request'
    #    end
    #  end
    #end
  end
end
