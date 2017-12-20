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
          every = options[:scope] || :daily
          at = options[:at] || 1
          hour = options[:hour] || 13
          _if = options[:if] || true
          reminder = options[:remainder] || false

          Recurr::RecurringEvent.create(name: self.to_s,
                                        description: '',
                                        hour: hour,
                                        occurence: at,
                                        reminder: reminder)
        end
      end
    end
  end
end
