module Recurr
  module Events
    class Monthly < Base

      def current
        at, on = options[:at], options[:on]

        diff = if start_day < on
                 on - start_day
               else
                 # number of days in the month - start_day
                 raw_diff = days_in_month - start_day
                 raw_diff + on
               end

        Time.new(start_year, start_month, start_day, at) + diff * DAY_REPRESENTATION
      end

      def next
        _current = current
        diff = days_in_month - _current.day

        _current + (diff + options[:on]) * DAY_REPRESENTATION
      end

      private

      def days_in_month
        Date.new(start_year, start_month, -1).day
      end
    end
  end
end
