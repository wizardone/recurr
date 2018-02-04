YearCalculation = Struct.new(:time) do
  def end?
    time.yday == 365 || time.yday == 366
  end
end

MonthCalculation = Struct.new(:year, :month, :day) do
  def end?
    return true if day == 31 && big_months.include?(month)
    return true if day == 30 && small_months.include?(month)
    return true if (day == 28 || day == 29) && month == february
    false
  end

  def next_month?
    return true if day >= 31 && big_months.include?(month)
    return true if day > 30 && small_months.include?(month)
    return true if (day > 28 || day > 29) && month == february
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
