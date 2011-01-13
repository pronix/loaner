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
  # Money default formatting
  def m amount
    c
  end

  def quarter_months start
    [start, start + 1.month, start + 2.month]
  end

  def quarter_periods start, options = {:total => false}
    result = quarter_months(start).map{|date| {:from => date, :to => date + 1.month}}
    result << {:from => start, :to => start + 3.months} if options[:total]
    #logger.debug "result: #{result.inspect}"
    result
  end

  # Date default formatting
  def d date
    l date, :format => "%d-%m-%Y" if date
  end

  #def quarter_select object_name, method
  #  quarters = (Time.now.year-10..Time.now.year.map{|y| (1..4).map{|q| Quarter.new q, y}})
  #  current = ""
  #  select(object_name, method, options_for_select(.flatten))
  #end
end
