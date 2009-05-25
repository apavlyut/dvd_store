class AddProducerAssociation < ActiveRecord::Migration
  def self.up
    create_table :producers_movies, :id => false do |t|
      t.integer :producer_id, :movie_id
    end
  end

  def self.down
    drop_table :producers_movies
  end
end
