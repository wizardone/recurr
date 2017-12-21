require 'active_support/concern'
module Recurr
  module ActiveRecord
    module Event
      extend ActiveSupport::Concern

      included do
        has_many :recurring_events,
                  class_name: 'Recurr::RecurringEvent',
                  dependent: :delete_all
      end

      class_methods do
        def recurr(**options)
          scope = options[:scope] || :daily
          day = options[:day] || 1
          hour = options[:hour] || 13
          on = options[:on] || 1
          _if = options[:if] || true
          reminder = options[:reminder] || false

          Recurr::RecurringEvent.create(name: self.to_s,
                                        description: '',
                                        scope: scope,
                                        day: day,
                                        hour: hour,
                                        on: on,
                                        reminder: reminder)
        end
      end
    end
  end
end
