class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :bubbles, class_name: "Bubble", foreign_key: "user1_id", dependent: :destroy
  has_many  :similarities, class_name: "Bubble", foreign_key: "user2_id", dependent: :destroy
  has_many  :movieratings, class_name: "MovieRating", foreign_key: "user_id", dependent: :destroy
  has_many  :movie_genre_associations, class_name: "MovieGenreAssociation", foreign_key: "user_id", dependent: :destroy

  has_many :bros, through: :bubbles, source: :user2
  has_many :similars, through: :similarities, source: :user1
  has_many :movie_rtgs, through: :movieratings, source: :movie
  has_many :movie_genre_opinions, through: :movie_genre_associations, source: :genre

end
