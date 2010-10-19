class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      t.integer :lender_id,           :null => false
      t.integer :account_no

      t.date    :application
      t.string  :type,                :null => false
      t.string  :state,               :null => false
      t.float   :amount 
      t.text    :remarks

      # payments
      t.integer :schedule_type,       :default => 0
      t.integer :grace_period,        :default => 0
      t.date    :first_payment_at
      t.date    :maturity_at

      t.timestamps
    end
  end

  def self.down
    drop_table :loans
  end
end
