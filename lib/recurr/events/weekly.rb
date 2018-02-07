module Recurr
  module Events
    class Weekly < Base

      def current
        at, on = options[:at], options[:on]
        start_week_day = starts.wday

        diff = if start_week_day < on
                 on - start_week_day
               else
                 # There must be an easier way to calculate this, revisit
                 raw_diff = start_week_day - on
                 raw_diff = start_week_day + 7 - raw_diff
                 raw_diff - start_week_day
               end

        Time.new(start_year, start_month, start_day, at) + diff * DAY_REPRESENTATION
      end

      def next
        current + 7 * DAY_REPRESENTATION
      end
    end
  end
end
