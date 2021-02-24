require 'uri'
require 'net/http'
require 'openssl'

class Jokes
  attr_reader :response

  def initialize
    url = URI('https://dad-jokes.p.rapidapi.com/random/joke')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request['x-rapidapi-key'] = 'a4096796c4mshcbc1c4ad4adb346p1e8bf1jsn75a1cbb9ddff'
    request['x-rapidapi-host'] = 'dad-jokes.p.rapidapi.com'
    @response = http.request(request)
  end
end
