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
          @every = options[:every] || :day
          @at = options[:at] || 20
          @on = options[:on] || 13
          @if = options[:if] || true

          recurring_events.create(name: self.class.to_s)
        end
      end
    end
  end
end
