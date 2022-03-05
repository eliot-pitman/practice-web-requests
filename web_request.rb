require "http"
system "clear"
puts "welcome to my dictionary app"

response =  HTTP.get(url)


request_data = response.parse(:json)
