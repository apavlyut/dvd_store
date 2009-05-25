class AddKindColumn < ActiveRecord::Migration
  def self.up
    remove_column :products, :type
    add_column :products, :product_type_id, :integer
  end

  def self.down
    rename_column :products, :product_type_id
    add_column :products, :type, :string
  end
end
