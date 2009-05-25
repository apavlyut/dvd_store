class AddTrailerToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :trailer, :text
  end

  def self.down
    remove_column :products, :trailer
  end
end
