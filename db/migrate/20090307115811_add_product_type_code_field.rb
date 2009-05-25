class AddProductTypeCodeField < ActiveRecord::Migration
  def self.up
    add_column :product_types, :code, :string
  end

  def self.down
    remove_column :product_types, :code
  end
end
