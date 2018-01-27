module Recurr
  module Events
    class Weekly < Base
      def current
        at, on = options[:at], options[:on]
        start_time = Time.new(starts.year, starts.month, starts.wday)
        start_year = start_time.year
        start_month = start_time.month
        start_day = on

        Time.new(start_year, start_month, start_day, at)
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
