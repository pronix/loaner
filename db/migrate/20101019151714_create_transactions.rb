class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :loan_id,       :null => false
      t.integer :type,          :null => false, :default => 0
      t.float   :amount,        :null => false
      t.string  :description

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
