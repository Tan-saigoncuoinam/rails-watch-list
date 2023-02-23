# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
list = List.new(name: "romance")
list.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
list.save

def create_random_movie(number_of_movies)
  number_of_movies.times do
    title = Faker::Movie.title
    overview = Faker::Movie.quote
    rating = rand(1..5)
    poster_url = Faker::LoremFlickr.image(size: "300x300", search_terms: ['movie'])
    Movie.create(title: title, overview: overview, rating: rating, poster_url: poster_url)
  end
end
MOVIES = create_random_movie(50)
