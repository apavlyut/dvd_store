class AddGamesAndMusicFields < ActiveRecord::Migration
  def self.up
    add_column :products, :movie_duration, :string
    add_column :products, :game_platform_id, :integer
    
    remove_column :products, :image_url
    add_column :products, :cover_id, :integer
    
    remove_column :products, :producer
    add_column :products, :producer_id, :integer
    
    remove_column :products, :country
    add_column :products, :country_id, :integer
    
    remove_column :products, :film_studio
    add_column :products, :film_studio_id, :integer
  end

  def self.down
    remove_column :products, :film_studio_id
    add_column :products, :film_studio, :string
    
    remove_column :products, :country_id
    add_column :products, :country, :string
    
    remove_column :products, :producer_id
    add_column :products, :producer, :string
    
    remove_column :products, :cover_id
    add_column :products, :image_url, :string
    
    remove_column :products, :game_platform_id    
    remove_column :products, :movie_duration
  end
end
