class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      #t.integer :lender_id,               :null => false
      t.integer :book_id,                 :null => false
      t.integer :account_no

      t.date    :application
      t.string  :loan_type
      t.string  :state,                   :null => false

      t.float   :amount,                  :null => false, :default => 0.0
      t.float   :interest,                :null => false, :default => 0.0
      t.integer :no_of_terms,                             :default => 1

      t.string  :interest_type,           :null => false, :default => "simple"
      t.string  :simple_interest_method

      # payments
      t.string  :schedule_type
      t.integer :grace_period,            :default => 0
      t.date    :first_payment_at
      t.date    :maturity_at

      # fees
      t.float  :acceptance_fees
      t.float  :revolving_credit_approval
      t.float  :late_repayment
      t.float  :terms_of_contract_variation
      t.float  :cheque_dishonour
      t.float  :preclousure_termination_fees
      t.float  :legal_fees

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
