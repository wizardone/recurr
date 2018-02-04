module Recurr
  module Events
    class Weekly < Base

      def current
        at, on = options[:at], options[:on]
        start_week_day = starts.wday
        #if next_month?(start_year, start_month, start_day)
        #  @start_month += 1
        #  @start_day = Time.new(@start_year, @start_month, on).day
        #end

        #@start_day = if start_week_day > on
        #              # Move to next week
        #              @diff = start_week_day - on
        #              @start_day + 7 - diff
        #            else
        #              @diff = on - start_week_day
        #              @start_day + diff
        #            end
        new_start_day = if start_week_day < on
                          diff = on - start_week_day
                          start_day + diff
                        else
                          diff = 7 - start_week_day
                          start_day - diff + 7
                        end
        #Time.new(@start_year, @start_month, @start_day, at)
        Time.new(start_year, start_month, new_start_day, at)
      end

      def next
        at, on = options[:at], options[:on]
        next_day = on + 7
        current_time = Time.new

        Time.new(current_time.year, current_time.month, next_day, at)
      end

      private

      def next_month?(year, month, day)
        MonthCalculation.new(year, month, day).next_month?
      end
    end
  end
end
