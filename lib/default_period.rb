module DefaultPeriod
  def default_period options = {}
    options[:from] ||= default_from
    options[:to] ||= default_to
    options
  end

  def default_from
    Date.parse("1970-01-01")
  end

  def default_to
    Date.tomorrow
  end
end
