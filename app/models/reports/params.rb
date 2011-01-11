class Reports::Params
  include ActiveModel::Validations
  attr_accessor :date_start, :date_end, :book, :loan, :book_id, :loan_id, :borrower, :borrower_id
  attr_accessor :quarter

  def initialize params, current_user
    @date_start = parse_date("date_start", params) || 1.month.ago
    @date_end = parse_date("date_end", params) || Time.now
    @year = [params[:year].to_i, Date.today.year].max
    @quarter = [params[:quarter].to_i, 1].max

    
    @book = current_user.books.find(params[:book_id]) if @book_id = params[:book_id]
    @loan = current_user.loans.find(params[:loan_id]) if @loan_id = params[:loan_id]
    @borrower = current_user.borrowers.find(params[:borrower_id]) if @borrower_id = params[:borrower_id]
  end

  def quarter2months
    map = {1 => 0, 2 => 4, 3 => 7, 4 => 10}
    map[quarter].months
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
