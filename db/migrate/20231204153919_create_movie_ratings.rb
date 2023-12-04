class CreateMovieRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_ratings do |t|
      t.integer :user_id
      t.integer :movie_id
      t.float :rating

      t.timestamps
    end
  end
end
