require_relative 'calculator'
module Recurr
  # Persistense class to store the events information
  class RecurringEvent < Recurr::INHERIT_FROM
    self.table_name = Recurr.config.event_table_name || :recurring_events

    WEEK_DAYS = {
      1 => 'Monday',
      2 => 'Tuesday',
      3 => 'Wednesday',
      4 => 'Thursday',
      5 => 'Friday',
      6 => 'Saturday',
      7 => 'Sunday'
    }.freeze

    validates :scope, inclusion: { in: Recurr::FREQUENCY }

    scope :future, -> { where("created_at > #{Time.now}") }
    scope :past, -> { where("created_at < #{Time.now}") }

    def calculate
      Recurr::Calculator.call(self)
    end

    def current
      recurring_event.current
    end

    def passed?(time)
      time > current
    end

    def next
      recurring_event.next
    end

    def previous

    end

    private

    def recurring_event
      options = { on: on, at: at }
      klass = "Recurr::Events::#{scope.to_s.capitalize}"
      if Module.const_defined?(klass)
        Module.const_get(klass).new(options)
      end
    end
  end
end
