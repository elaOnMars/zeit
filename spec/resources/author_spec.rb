require 'spec_helper'

describe Zeit::Resources::Author, :vcr do
  it_behaves_like 'a resource'

  describe '#find' do
    context 'with a simple query' do
      it_behaves_like 'a resource response' do
        subject { Zeit::Resources::Author.new(api_connection).find(query) }
        let(:query) { '*Helmut*Schmidt*' }

        context 'when authorized' do
          it_behaves_like 'a successful response with some matches'
        end

        context 'when unauthorized' do
          it_behaves_like 'an unauthorized request'
        end
      end
    end
  end

  describe '#get' do
    it_behaves_like 'a resource response' do

      context 'with an valid author id' do
        subject { Zeit::Resources::Author.new(api_connection).get(author_id) }
        let(:author_id) { 'Helmut-Schmidt' }

        context 'when authorized' do
          it_behaves_like 'a successful response with some matches'

          it_behaves_like 'all matches have the required keys' do
            let(:keys) { %w(subtitle uuid title href release_date uri supertitle teaser_title) }
          end

          it 'should have the right data type' do
            parsed_json['type'].should eql('author')
          end
        end

        context 'when unauthorized' do
          it_behaves_like 'an unauthorized request'
        end
      end
    end
  end


end

