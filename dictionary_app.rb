require "http"
require "launchy"
system "clear"
puts "welcome to my dictionary app"

loop do
  
  puts "enter one word"
  word  = gets.chomp.strip.downcase

  text_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=NEEDSKEY")

  request_text_data = text_response.parse(:json)

  puts "The definition of #{word}, #{request_text_data[0]["attributionText"]}, is '#{request_text_data[0]["text"]}'"


  audio_response =  HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/audio?useCanonical=false&limit=50&api_key=NEEDSKEY")

  puts "if you would like to hear the audio in your default browser, tap your space bar"

  request_audio_data = audio_response.parse(:json)

  audiourl = request_audio_data[0]["fileUrl"]

  x = gets.chomp

  if x = " "
    Launchy.open(audiourl)
  end

  #   # puts "If you are done, press 'q', otherwise, press enter to continue"
#   # q = gets.chomp
#   # if q = "q"
#   #   break
#   # end
 
end 



