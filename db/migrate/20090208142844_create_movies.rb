class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :title, :image_url
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.timestamps
    end
    
    #add_column :movies, :price, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    drop_table :movies
  end
end
