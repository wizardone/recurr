module Recurr
  module Events
    class Weekly < Base
      def current
        at, on = options[:at], options[:on]
        start_week_day = starts.wday
        @start_day = if start_week_day > on
                      # Move to next week
                      diff = start_week_day - on
                      @start_day + 7 - diff
                    else
                      diff = on - start_week_day
                      @start_day + diff
                    end

        if next_month?(@start_year, @start_month, @start_day)
          # why is this not working with the reader??
          @start_month += 1
        end

        Time.new(@start_year, @start_month, @start_day, at)
      end

      def next
        at, on = options[:at], options[:on]
        next_day = on + 7
        current_time = Time.new

        Time.new(current_time.year, current_time.month, next_day, at)
      end

      private

      def next_month?(year, month, day)
        MonthCalculation.new(year, month, day).next_month?
      end
    end
  end
end
