module Recurr
  module Events
    class Weekly < Base
      def current
        at, on = options[:at], options[:on]
        day = Time.new.wday
        on += 7 if on < day
        current_time = Time.new

        Time.new(current_time.year, current_time.month, on, at)
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
