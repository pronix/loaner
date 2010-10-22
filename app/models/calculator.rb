class Calculator
  include ActiveModel::Validations
  include ActiveModel::Conversion  
  extend ActiveModel::Naming  

  attr_accessor :loan_type, :amount, :rate_interest, :percent_per, :no_of_terms, :terms_units
  attr_accessor :result

  validates_presence_of :loan_type, :amount, :rate_interest, :percent_per, :no_of_terms, :terms_units
  validates_numericality_of :amount, :greater_than => 10
  validates_numericality_of :rate_interest, :greater_than => 1, :less_than => 1000
  validates_numericality_of :no_of_terms,   :greater_than => 1

  def initialize params = {}
    loan_type, terms_units = "simple", "Months"
    loan_amount = 0.0
    @result = {}
    [:loan_type, :terms_units, :amount, :rate_interest, :percent_per, :no_of_terms].each do |param|
      self.send "#{param}=", params[param] unless params[param].blank?
      Rails.logger.debug "#{param}: #{self.send(param)}"
    end
  end

  def calculate
    if loan_type
      @result[:no_of_terms] = no_of_terms
      self.send loan_type if self.respond_to? loan_type
      Rails.logger.debug "result: #{result.inspect}"
      @result
    end
  end

  def simple
    @result[:total_payable_interest] = (amount.to_f * rate_interest.to_f / 100.0) * (no_of_terms.to_f / 12)
    @result[:installment] = (@result[:total_payable_interest] + amount.to_f) / no_of_terms.to_f
  end

  def monthly_cum_daily
    not_implemented
  end

  def daily
    not_implemented
  end

  def late
    not_implemented
  end

  def not_implemented
    @result[:total_payable_interest] = "Not Implemented"
    @result[:installment] = "Not Implemented"
  end

  
  def persisted?  
    false  
  end  

end
