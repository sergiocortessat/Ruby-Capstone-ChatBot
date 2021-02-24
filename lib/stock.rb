require 'net/http'
require 'uri'

uri = URI.parse('https://financialmodelingprep.com/api/v3/profile/TSLA?apikey=433fe75a22056f72b4e335b0627761a8')
request = Net::HTTP::Get.new(uri)
request['Upgrade-Insecure-Requests'] = '1'
req_options = {
  use_ssl: uri.scheme == 'https'
}
holder = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end
RESPONSE = holder.read_body.split(',')
