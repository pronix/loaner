class Reports::Params
  include ActiveModel::Validations
  attr_accessor :date_start, :date_end, :book, :loan, :book_id, :loan_id

  def initialize params
    @date_start = parse_date("date_start", params) || 1.month.ago
    @date_end = parse_date("date_end", params) || Time.now
    @book_id = params[:book_id]
    @loan_id = params[:loan_id]
    @book = Book.find(params[:book_id]) if book_id
    @loan = Loan.find(params[:loan_id]) if loan_id
  end

  def to_key
    nil
  end

  private

  def parse_date name, params
    if params["#{name}(1i)"]
      Time.local params["#{name}(1i)"], params["#{name}(2i)"], params["#{name}(3i)"]
    else
      nil
    end
  end
end
