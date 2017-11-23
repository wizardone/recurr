module Recurr
  class RecurringEvent < Recurr::INHERIT_FROM
    self.table_name = Recurr.config.event_table_name
  end
end
