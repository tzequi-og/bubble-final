class CreateMovieGenreAssociations < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_genre_associations do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :status

      t.timestamps
    end
  end
end
