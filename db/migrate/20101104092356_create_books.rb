class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.integer :lender_id,     :null => false
      t.string  :name
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
