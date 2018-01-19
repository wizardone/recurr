module Recurr
  module Events
    class Daily < Base

      def current
        at = options[:at]
        start_day = starts.day
        start_day += 1 if starts.hour > at
        current_time = Time.new

        Time.new(current_time.year, current_time.month, start_day, at)
      end

      def next
        at = options[:at]
        next_day = current.day + 1
        current_time = Time.new

        Time.new(current_time.year, current_time.month, next_day, at)
      end
    end
  end
end
