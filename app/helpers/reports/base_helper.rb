module Reports::BaseHelper
  # Date default formatting
  def d date
    l date, :format => "%d/%m/%Y"
  end

  # Money default formatting
  def m amount
    amount
  end
end
