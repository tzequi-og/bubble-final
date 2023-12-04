class CreateMovieGenreTags < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_genre_tags do |t|
      t.integer :genre_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
