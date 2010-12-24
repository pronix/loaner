class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :book_id,           :null => false
      t.integer :loan_id
      t.string  :transaction_type,  :null => false
      t.string  :payment_type,      :null => false
      t.float   :amount,            :null => false
      t.date    :date,              :null => false
      t.string  :description

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
