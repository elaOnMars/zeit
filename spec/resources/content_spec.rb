require 'spec_helper'

describe Zeit::Resources::Content, :vcr do
  it_behaves_like 'a resource'

  describe '#find' do
    context 'with a simple query' do
      it_behaves_like 'a resource response' do
        let(:query) { 'Kim Schmitz' }
        subject { Zeit::Resources::Content.new(api_connection).find(query) }

        context 'when authorized' do
          it_behaves_like 'a successful response with some matches'

          it_behaves_like 'all matches have the required keys' do
            let(:keys) { %w(subtitle uuid title href release_date uri supertitle snippet teaser_title) }
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
      context 'with an valid content id' do
        let(:uuid) { '3GbcIDjwbcH4DZKMZj0Ndd' }

        subject { Zeit::Resources::Content.new(api_connection).get(uuid) }

        context 'when authorized' do
          it 'should have some important values' do
            json.has_key? 'title'

            json['creators'].should   be_instance_of(Array)
            json['relations'].should  be_instance_of(Array)
            json['keywords'].should   be_instance_of(Array)
            json['categories'].should be_instance_of(Array)
          end
        end

        context 'when unauthorized' do
          it_behaves_like 'an unauthorized request'
        end
      end

    end
  end
end

