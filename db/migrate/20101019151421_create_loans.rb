class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      t.integer :lender_id,               :null => false
      t.integer :account_no

      t.date    :application
      t.string  :loan_type,               :null => false, :default => ""
      t.string  :state,                   :null => false

      t.float   :amount,                  :null => false, :default => 0.0
      t.float   :interest,                :null => false, :default => 0.0

      t.string  :interest_type,           :null => false, :default => "simple"
      t.integer :simple_interest_method,  :default => 0

      # payments
      t.integer :payment_schedule,        :default => 0
      t.integer :schedule_type,           :default => 0
      t.integer :grace_period,            :default => 0
      t.date    :first_payment_at
      t.date    :maturity_at

      # fees
      t.string  :acceptance_fees
      t.string  :revolving_credit_approval
      t.string  :late_repayment
      t.string  :terms_of_contract_variation
      t.string  :cheque_dishonour
      t.string  :preclousure_termination_fees
      t.string  :legal_fees

      # misc
      t.text  :terms
      t.string  :language
      t.text    :remarks
      t.string  :bankruptcy_declaration

      t.timestamps
    end
  end

  def self.down
    drop_table :loans
  end
end
