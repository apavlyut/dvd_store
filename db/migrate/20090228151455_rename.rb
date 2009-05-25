class Rename < ActiveRecord::Migration
  def self.up
    rename_column :people, :type, :kind
  end

  def self.down
    rename_column :people, :kind, :type
  end
end
