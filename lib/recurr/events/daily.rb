module Recurr
  module Events

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

    class Daily < Base

      def current
        at = options[:at]
        start_time = Time.new(starts.year, starts.month, starts.day)
        start_year, start_month, start_day = starts.year, starts.month, starts.wday
        start_day = calculate_next_week_day(start_day) if starts.hour > at

        if month_end?(start_time)
          start_month += 1
          start_day = 1
        end

        if year_end?(start_time)
          start_year += 1
          start_month = 1
          start_day = 1
        end

        Time.new(start_year, start_month, start_day, at)
      end

      def next
        at = options[:at]
        next_day = calculate_next_week_day(current.wday)
        current_time = Time.new

        Time.new(current_time.year, current_time.month, next_day, at)
      end

      private

      def calculate_next_week_day(day)
        return 1 if day == 6
        day + 1
      end

      def month_end?(start_time)
        MonthCalculation.new(start_time).end?
      end

      def year_end?(start_time)
        YearCalculation.new(start_time).end?
      end
    end
  end
end
