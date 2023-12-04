class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.integer :director_id
      t.integer :year
      t.float :imdb_rating
      t.string :imdb_id
      t.string :title
      t.integer :runtime
      t.string :poster_link

      t.timestamps
    end
  end
end
