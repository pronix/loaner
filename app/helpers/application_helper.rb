module ApplicationHelper
  def humanize collection
    if collection.is_a? Array
      collection.map{|s| [s.titleize,s]}
    else
      raise ArgumentError
    end
  end

  # currency
  def c number
    number_to_currency number.abs
  end
end
