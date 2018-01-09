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

    end
  end
end
