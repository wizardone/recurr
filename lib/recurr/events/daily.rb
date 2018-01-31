module Recurr
  module Events
    class Daily < Base

      def current
        at = options[:at]
        @start_day = calculate_next_week_day(@start_day) if starts.hour > at

        if month_end?(starts)
          @start_month += 1
          @start_day = 1
        end

        if year_end?(starts)
          @start_year += 1
          @start_month = 1
          @start_day = 1
        end

        Time.new(@start_year, @start_month, @start_day, at)
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
        MonthCalculation.new(
          start_time.year,
          start_time.month,
          start_time.day
        ).end?
      end

      def year_end?(start_time)
        YearCalculation.new(start_time).end?
      end
    end
  end
end
