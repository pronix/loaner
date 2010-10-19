class CreateSuretyLoans < ActiveRecord::Migration
  def self.up
    create_table :surety_loans do |t|
      t.integer :surety_id, :null => false
      t.integer :loan_id,   :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :surety_loans
  end
end
