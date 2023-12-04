class Director < ApplicationRecord

  has_many  :movies, class_name: "Movie", foreign_key: "director_id", dependent: :nullify
  
end
