class RelationshipProductsCountries < ActiveRecord::Migration
  def self.up
    create_table :countries_products, :id => false do |t|
      t.integer :country_id, :product_id
    end
  end

  def self.down
    drop_table :countries_products
  end
end
