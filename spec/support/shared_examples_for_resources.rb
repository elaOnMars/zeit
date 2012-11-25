shared_examples 'a resource' do
  describe '.new' do
    it 'should require a connection object to be initalized' do
      expect { described_class.new }.to raise_error
    end
  end
end

shared_examples 'a resource response' do
  let(:json) { subject.body }
  let(:api_connection) { authorized_api_client.connection }
  let(:parsed_json) { JSON.parse(json) }
end

shared_examples 'a successful response' do
  its(:success?) { should be_true }
end

shared_examples 'a successful response with some matches' do
  it_behaves_like 'a successful response'

  it 'should return matches' do
    parsed_json['matches'].should have_at_least(10).items
  end
end

shared_examples 'an unauthorized request' do
  let(:api_connection) { unauthorized_api_client.connection }
  its(:status) { should eql(401) } # UNAUTHORIZED

  it_behaves_like 'an error message response'
end

shared_examples 'an error message response' do
  its(:success?) { should be_false }

  it 'should return an error message' do
    parsed_json['description'].should_not be_empty
  end
end

# todo custom matchers
# FIXME allow new keys
shared_examples 'all matches have the required keys' do
  it 'matches should have at least the basic keys' do
    parsed_json['matches'].each do |match|
      keys.each do |required_key|
        match.keys.should include(required_key)
      end
    end
  end
end


