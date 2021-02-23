require 'uri'
require 'net/http'
require 'openssl'

url = URI('https://dad-jokes.p.rapidapi.com/random/joke')

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request['x-rapidapi-key'] = '7b0d6b3887mshd5b520377187b31p169647jsn6e86263f3722'
request['x-rapidapi-host'] = 'dad-jokes.p.rapidapi.com'

response = http.request(request)
puts response.read_body
