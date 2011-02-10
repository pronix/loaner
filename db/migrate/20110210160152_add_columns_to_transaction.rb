class AddColumnsToTransaction < ActiveRecord::Migration
  def self.up
    add_column :transactions, :acceptance_fees,             :float, :default => 0.0
    add_column :transactions, :revolving_renewal_fees,      :float, :default => 0.0
    add_column :transactions, :late_repayment,              :float, :default => 0.0
    add_column :transactions, :terms_of_contract_variation, :float, :default => 0.0
    add_column :transactions, :cheque_dishonour,            :float, :default => 0.0
    add_column :transactions, :preclosure_termination_fees, :float, :default => 0.0
    add_column :transactions, :legal_fees,                  :float, :default => 0.0
  end

  def self.down
    remove_column :transactions, :acceptance_fees
    remove_column :transactions, :revolving_renewal_fees
    remove_column :transactions, :late_repayment
    remove_column :transactions, :terms_of_contract_variation
    remove_column :transactions, :cheque_dishonour
    remove_column :transactions, :preclosure_termination_fees
    remove_column :transactions, :legal_fees
  end
end
