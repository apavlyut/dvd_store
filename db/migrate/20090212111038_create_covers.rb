class CreateCovers < ActiveRecord::Migration
  def self.up
    create_table :covers do |t|
      t.integer :product_id, :parent_id, :size, :width, :height 
      t.string :content_type, :filename, :thumbnail
      t.timestamps
    end
  end

  def self.down
    drop_table :covers
  end
end
