class Movie < ApplicationRecord
  
  has_many  :movieratings, class_name: "MovieRating", foreign_key: "movie_id", dependent: :destroy
  has_many  :movie_genre_tags, class_name: "MovieGenreTag", foreign_key: "movie_id", dependent: :destroy
  belongs_to :director, class_name: "Director", foreign_key: "director_id", counter_cache: true

  has_many :user_ratings, through: :movieratings, source: :user
  
end
