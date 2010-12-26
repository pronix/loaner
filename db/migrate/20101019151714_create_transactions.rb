class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :book_id,           :null => false
      t.integer :loan_id
      t.integer :receipt_no
      t.date    :date,              :null => false

      t.string  :transaction_type,  :null => false
      t.string  :payment_type,      :null => false

      t.float   :amount,            :null => false,     :default => 0.0
      t.float   :regular,           :null => false,     :default => 0.0 # ?
      t.float   :principal,         :null => false,     :default => 0.0
      t.float   :interest,          :null => false,     :default => 0.0
      t.float   :late_interest,     :null => false,     :default => 0.0
      t.float   :permitted_fee,     :null => false,     :default => 0.0

      t.string  :description
      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
