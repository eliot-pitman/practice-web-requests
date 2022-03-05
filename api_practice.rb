require "http"
require "launchy"

puts "write in your favorite drink!"

drink = gets.chomp

url = HTTP.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{drink}")

url_drink = url.parse(:json)

puts ""

puts "The instructions: '#{url_drink["drinks"][0]["strInstructions"]}'"
puts "if you would like the instructions in German, type DE and then press enter"
puts "if you would like the instructions in Itlaian, type IT and then press enter"
x = gets.chomp
if x == "DE"
  puts "Hier sind die Anweisungen: '#{url_drink["drinks"][0]["strInstructionsDE"]}'"
elsif x == "IT"
  puts "Hcco le istruzioni: '#{url_drink["drinks"][0]["strInstructionsIT"]}'"
end
