class MovieGenreAssociation < ApplicationRecord

  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :genre, required: true, class_name: "MovieGenre", foreign_key: "genre_id"
  
end
