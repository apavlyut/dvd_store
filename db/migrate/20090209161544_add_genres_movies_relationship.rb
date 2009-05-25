class AddGenresMoviesRelationship < ActiveRecord::Migration
  def self.up
    create_table :genres_movies, :id => false do |t|
      t.integer :genre_id, :movie_id
    end
  end

  def self.down
    drop_table :genres_movies
  end
end
