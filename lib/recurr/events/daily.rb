module Recurr
  module Events
    class Daily < Base

      def current
        at = options[:at]

        diff = if starts.hour > at
                 raw_diff = starts.hour - at
                 24 - raw_diff
               else
                 at - starts.hour
               end

        Time.new(start_year, start_month, start_day, starts.hour) + diff * 3600
      end

      def next
        at = options[:at]
        next_day = calculate_next_week_day(current.wday)
        current_time = Time.new

        Time.new(current_time.year, current_time.month, next_day, at)
      end
    end
  end
end
