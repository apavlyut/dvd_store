class EditProductCategoriesRelations < ActiveRecord::Migration
  def self.up
    rename_table :categories_movies, :categories_products
    rename_column :categories_products, :movie_id, :product_id
  end

  def self.down
    rename_column :categories_products, :product_id, :movie_id
    rename_table :categories_products, :categories_movies
  end
end
