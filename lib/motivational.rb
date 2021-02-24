require 'json'
require 'net/http'

class Phrases
  attr_reader :phrase_sample

  def initialize
    @phrase_sample = make_request
  end

  def random_phrase
    @phrase_sample = @phrase_sample.sample
  end

  def make_request
    uri = URI('https://type.fit/api/quotes')
    JSON.parse(Net::HTTP.get(uri))
  end
end
