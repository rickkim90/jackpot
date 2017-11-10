require 'httparty'
require 'json'

uri = "http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo="
response = HTTParty.get(uri)
#string_to_parse = "{\"drwtNo3\":\"19\",\"drwtNo2\":\"12\",\"drwtNo1\":\"6\",\"drwtNo6\":\"41\",\"drwtNo5\":\"34\",\"drwtNo4\":\"24\"}"
result = JSON.parse(response.body)

arr = Array.new
# 6 times.do |i|
# 
# arr[0] = a["drwtNo1"]
# arr[1] = a["drwtNo2"]
# arr[2] = a["drwtNo3"]
# arr[3] = a["drwtNo4"]
# arr[4] = a["drwtNo5"]
# arr[5] = a["drwtNo6"]

result.each do |key,value|
    arr << value if key.include? "drwtNo"
end

puts arr.sort




# require 'httparty'
# require 'json'

# uri = "http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo="
# response = HTTParty.get(uri)
# string_to_parse = "{\"drwtNo3\":\"19\",\"drwtNo2\":\"12\",\"drwtNo1\":\"6\",\"drwtNo6\":\"41\",\"drwtNo5\":\"34\",\"drwtNo4\":\"24\"}"
# a = JSON.parse(string_to_parse)
# puts a