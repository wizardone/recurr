YearCalculation = Struct.new(:time) do
  def end?
    time.yday == 365 || time.yday == 366
  end
end

MonthCalculation = Struct.new(:time) do
  def end?
    day_of_month = time.mday
    month_of_year = time.month

    return true if day_of_month == 31 && big_months.include?(month_of_year)
    return true if day_of_month == 30 && small_months.include?(month_of_year)
    return true if (day_of_month == 28 || day_of_month == 29) && month_of_year == february
    false
  end

  private

  def big_months
    [1, 3, 5, 7, 8, 10, 12]
  end

  def small_months
    [4, 6, 9, 11]
  end

  def february
    2
  end
end
