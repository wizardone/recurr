module Recurr
  module Events
    class Daily < Base

      def current
        at = options[:at]
        start_time = Time.new(starts.year, starts.month, starts.wday)
        start_day = starts.wday
        start_day = calculate_next_week_day(start_day) if starts.hour > at

        Time.new(start_time.year, start_time.month, start_day, at)
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
        return day + 1
      end
    end
  end
end
