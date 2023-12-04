class MovieGenre < ApplicationRecord

  has_many  :movie_genre_tags, class_name: "MovieGenreTag", foreign_key: "genre_id", dependent: :destroy
  has_many  :movie_genre_associations, class_name: "MovieGenreAssociation", foreign_key: "genre_id", dependent: :destroy

  has_many :users_related, through: :movie_genre_associations, source: :user
  
end
