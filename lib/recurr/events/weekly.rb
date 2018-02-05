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

        Time.new(start_year, start_month, start_day, at) + diff * 24 * 3600
      end

      def next
        at, on = options[:at], options[:on]
        next_day = on + 7
        current_time = Time.new

        Time.new(current_time.year, current_time.month, next_day, at)
      end
    end
  end
end
