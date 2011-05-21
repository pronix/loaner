class AddFieldsToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :identification_type, :string
  end

  def self.down
    remove_column :people, :identification_type
  end
end
