require 'json'

# filepath = 'https://gist.githubusercontent.com/alexandremeunier/49533eebe2ec93b14d32b2333272f9f8/raw/924d89e2236ca6fa2ade7481c91bfbf858c49531/movies.json'
serialized_movies = File.read('/Users/wendiemaestri/code/matthieu-laumet/test-technic/db/movies.json')

movies = JSON.parse(serialized_movies)

movies[0..100].each do |movie|
  Movie.create!(movie)
end

puts 'finished'

User.create!(email: "julia@gmail.com", password: "azerty")
