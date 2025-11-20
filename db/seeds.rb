# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'
require 'json'

puts "Nettoyage de la zone d'atterrissage..."
Movie.destroy_all

# Configuration : Nombre de pages à scrapper (1 page = 20 films)
total_pages = 5 

(1..total_pages).each do |page_number|
  puts "Traitement de la page #{page_number}/#{total_pages}..."
  
  # Injection dynamique du numéro de page dans l'URL
  url = "http://tmdb.lewagon.com/movie/top_rated?page=#{page_number}"
  
  json_data = URI.open(url).read
  movies = JSON.parse(json_data)["results"]

  movies.each do |movie_hash|
    base_poster_url = "https://image.tmdb.org/t/p/original"
    
    # Création (on utilise create! pour voir si une validation échoue)
    Movie.create!(
      title: movie_hash["title"],
      overview: movie_hash["overview"],
      poster_url: "#{base_poster_url}#{movie_hash['poster_path']}",
      rating: movie_hash["vote_average"]
    )
  end
end

puts "Opération terminée. #{Movie.count} films indexés."


Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)