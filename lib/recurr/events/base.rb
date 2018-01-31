module Recurr
  module Events
    class Base

      attr_reader :options, :starts
      attr_accessor :start_year,
                    :start_month,
                    :start_day

      def initialize(options)
        @options = options
        @starts = options[:starts]&.to_time || Time.current
        @start_year = starts.year
        @start_month = starts.month
        @start_day = starts.day
      end

      def current
        raise NotImplementedError
      end

      def next
        raise NotImplementedError
      end
    end
  end
end
