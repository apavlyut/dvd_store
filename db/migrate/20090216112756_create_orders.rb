class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.string :full_name, :phone, :metro, :address
      t.text :comment
      t.string :pay_type, :limit => 10
      t.string :delivery_type, :limit => 10
      t.boolean :is_captured
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
