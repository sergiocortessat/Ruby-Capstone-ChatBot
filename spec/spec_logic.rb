require_relative '../lib/motivational'
require_relative '../lib/bot_logic'
require_relative '../lib/jokes'

describe Phrases do
  let(:phrases) { Phrases.new }
  let(:random_phrase) { phrases.random_phrase }
  let(:json) { phrases.make_request }

  describe '#random_phrase' do
    it 'should return a a type object hash' do
      expect(random_phrase.class).to eql(Hash)
    end

    it 'should return a hash object' do
      expect(random_phrase.class).not_to eql(String)
    end
  end

  describe '#make_request' do
    it 'returns a non nill element of JSON object as the json should be filled' do
      expect(json[0]).not_to eql(nil)
    end

    it 'returns true as there is one element inside the json object array' do
      expect(json.length >= 1).to eql(true)
    end
    it 'should return a JSON object' do
      expect(json.instance_of?(Array)).to be true
    end

    it 'should not return a JSON hash' do
      expect(json.class).not_to eql(Hash)
    end
  end
end
