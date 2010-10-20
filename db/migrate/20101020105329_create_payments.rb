class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :loan_id,     :null => false
      t.float   :amount,      :null => false,     :default => 0.0
      t.date    :paid_on
      t.string  :remarks

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
