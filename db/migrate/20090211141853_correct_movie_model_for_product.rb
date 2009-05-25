class CorrectMovieModelForProduct < ActiveRecord::Migration
  def self.up
    remove_column :movies, :title
    remove_column :movies, :image_url
    remove_column :movies, :description
    remove_column :movies, :price
    remove_column :movies, :in_stock
  end

  def self.down
    add_column :movies, :in_stock, :integer
    add_column :moveis, :price, :decimal, :precision => 8, :scale => 2
    add_column :movies, :description, :text
    add_column :movies, :image_url, :string
    add_column :moveis, :title, :string
  end
end
