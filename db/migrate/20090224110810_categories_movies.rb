class CategoriesMovies < ActiveRecord::Migration
  def self.up
    create_table :categories_movies, :id => false do |t|
      t.integer :category_id, :movie_id
    end
  end

  def self.down
    drop_table :categories_movies
  end
end
