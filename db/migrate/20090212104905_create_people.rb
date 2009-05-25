class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :full_name, :type
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
