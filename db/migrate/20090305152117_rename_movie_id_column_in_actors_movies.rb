class RenameMovieIdColumnInActorsMovies < ActiveRecord::Migration
  def self.up
    rename_column :actors_movies, :movie_id, :product_id
  end

  def self.down
    rename_column :actors_movies, :product_id, :movie_id
  end
end
