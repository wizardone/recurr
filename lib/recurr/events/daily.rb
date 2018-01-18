module Recurr
  module Events
    class Daily < Base

      def current
        on, at = options[:on], options[:at]
        start_day = starts.day
        if starts.hour > at
          start_day += 1
        end
        current_time = Time.new
        Time.new(current_time.year, current_time.month, start_day, at)
      end
    end
  end
end
