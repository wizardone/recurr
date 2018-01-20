module Recurr
  module Events
    class Base

      attr_reader :options, :starts

      def initialize(options)
        @options = options
        @starts = options[:starts]&.to_time || Time.current
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
