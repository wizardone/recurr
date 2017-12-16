module Recurr
  class RecurringEvent < Recurr::INHERIT_FROM
    self.table_name = Recurr.config.event_table_name || :recurring_events

    def passed?

    end

    def next

    end

    def previous

    end
  end
end
