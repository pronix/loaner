class CreateSuretyLoans < ActiveRecord::Migration
  def self.up
    create_table :surety_loans do |t|
      t.integer :person_id, :null => false
      t.integer :loan_id,   :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :surety_loans
  end
end
