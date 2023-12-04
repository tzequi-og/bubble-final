class MovieGenreTag < ApplicationRecord

  belongs_to :movie, required: true, class_name: "Movie", foreign_key: "movie_id"
  belongs_to :genre, required: true, class_name: "MovieGenre", foreign_key: "genre_id"
  
end
