module Recurr
  class Calculator

    class << self
      def call(recurring_event)
        new(recurring_event).calculate
      end
    end

    attr_reader :recurring_event

    def initialize(recurring_event)
      @recurring_event = recurring_event
    end

    def calculate
      case recurring_event.scope
      when :daily

      when :weekly

      when :monthly

      end
    end
  end
end
