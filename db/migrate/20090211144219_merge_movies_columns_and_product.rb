class MergeMoviesColumnsAndProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :title_origin, :string
    add_column :products, :director_id, :integer
    add_column :products, :producer, :string
    add_column :products, :film_studio, :string
    add_column :products, :distributor, :string
    add_column :products, :regional_code, :integer
    add_column :products, :data_medium, :string
    add_column :products, :subtitle, :string
    add_column :products, :audio_track, :string
    add_column :products, :split_screen_format, :string
    add_column :products, :release_date, :date
    add_column :products, :country, :string
    add_column :products, :addons, :text
  end

  def self.down
    remove_column :products, :addons
    remove_column :products, :country
    remove_column :products, :release_date
    remove_column :products, :split_screen_format
    remove_column :products, :audio_track
    remove_column :products, :subtitle
    remove_column :products, :data_medium
    remove_column :products, :regional_code
    remove_column :products, :distributor
    remove_column :products, :film_studio
    remove_column :products, :producer
    remove_column :products, :director_id
    remove_column :products, :title_origin
  end
end
