class CreateFilmStudios < ActiveRecord::Migration
  def self.up
    create_table :film_studios do |t|
      t.string :title, :logo_url
      t.timestamps
    end
  end

  def self.down
    drop_table :film_studios
  end
end
