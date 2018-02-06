module Recurr
  module Events
    class Monthly < Base

      def current
        at, on = options[:at], options[:on]

        diff = if start_day < on
                 on - start_day
               else

               end

        Time.new(start_year, start_month, start_day, at) + diff * 24 * 3600
      end

      def next
        current + 7 * 24 * 3600
      end
    end
  end
end
