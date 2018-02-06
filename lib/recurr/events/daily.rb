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
        current + 24 * 3600
      end
    end
  end
end
