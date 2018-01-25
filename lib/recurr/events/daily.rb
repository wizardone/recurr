module Recurr
  module Events
    class Daily < Base

      def current
        at = options[:at]
        start_time = Time.new(starts.year, starts.month, starts.day)
        start_day = starts.wday
        start_month = starts.month
        start_day = calculate_next_week_day(start_day) if starts.hour > at

        if month_end?(start_time)
          start_month += 1
          start_day = 1
        end

        Time.new(start_time.year, start_month, start_day, at)
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
        day_of_month = start_time.mday
        month_of_year = start_time.month

        return true if day_of_month == 31 && %w[1 3 5 7 8 10 12].map(&:to_i).include?(month_of_year)
        return true if day_of_month == 30 && %w[4 6 9 11].map(&:to_i).include?(month_of_year)
        return true if (day_of_month == 28 || day_of_month == 29) && month_of_year == 2
        false
      end
    end
  end
end
