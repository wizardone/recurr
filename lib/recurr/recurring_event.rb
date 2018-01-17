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
      recurring_event
    end

    def passed?

    end

    def next

    end

    def previous

    end

    def occurences(start:, end:) # or range?

    end

    private

    def recurring_event
      options = { on: on, at: at }
      case scope.to_sym
      when :daily
        Recurr::Events::Daily.new(options)
      when :weekly
        Recurr::Events::Weekly.new(options)
      when :monthly
        Recurr::Events::Monthly.new(options)
      end
    end

  end
end
