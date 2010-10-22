class Calculator
  include ActiveModel::Validations

  attr_accessor :loan_type, :amount, :rate_interest, :percent_per, :no_of_terms, :terms_units
  attr_accessor :result

  def initialize params = {}
    loan_type, terms_units = "simple", "Months"
    @result = {}
    [:loan_type, :terms_units, :amount, :rate_interest, :percent_per, :no_of_terms].each do |param|
      self.send "#{param}=", params[param] unless params[param].blank?
      Rails.logger.debug "#{param}: #{self.send(param)}"
    end
  end

  def calculate
    if loan_type
      self.send loan_type if self.respond_to? loan_type
      Rails.logger.debug "result: #{result.inspect}"
      @result
    end
  end

  def simple
    @result[:total_payable_interest] = (amount.to_f * rate_interest.to_f / 100.0) * (no_of_terms.to_f / 12)
    @result[:installment] = (@result[:total_payable_interest] + amount.to_f) / no_of_terms.to_f
    @result[:no_of_terms] = no_of_terms
  end

  def monthly_cum_daily

  end

  def daily

  end

  def late

  end

end
