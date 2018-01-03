module Recurr
  # Persistense class to store the events information
  class RecurringEvent < Recurr::INHERIT_FROM
    self.table_name = Recurr.config.event_table_name || :recurring_events

    validates :scope, inclusion: { in: Recurr::FREQUENCY }

    def passed?

    end

    def next

    end

    def previous

    end

    def occurences(start:, end:) # or range?

    end

  end
end
