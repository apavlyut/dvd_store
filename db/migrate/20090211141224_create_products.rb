class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title, :image_url, :type
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.boolean :is_aviable
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
