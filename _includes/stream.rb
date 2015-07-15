

require 'rubygems'
require 'oauth'
require 'json'

baseurl = "https://api.twitter.com"
path    = "/1.1/statuses/user_timeline.json"
query = URI.encodewwwform(
"screen_name" => "twitterapi",
"count" => 10,
)
address = URI("#{baseurl}#{path}?#{query}")
request = Net::HTTP::Get.new address.requesturi

def print_timeline(tweets)
tweets.each do |tweet|
puts tweet["text"]
end

end

http             = Net::HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

consumer_key ||= OAuth::Consumer.new "ENTER IN EXERCISE 1", ""
access_token ||= OAuth::Token.new "ENTER IN EXERCISE 1", ""

request.oauth! http, consumer_key, access_token
http.start
response = http.request request

tweets = nil
if response.code == '200' then
  tweets = JSON.parse(response.body)
  print_timeline(tweets)
end
nil