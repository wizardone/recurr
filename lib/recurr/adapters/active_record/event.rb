require 'active_support/concern'
module Recurr
  module Adapters
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
            raise ArgumentError, 'You must supply a :scope option' unless options[:scope]

            scope = options[:scope] || :daily
            day = options[:day] || 1
            hour = options[:hour] || 13
            on = options[:on] || 1
            reminder = options[:reminder] || false

            if options[:if].nil? || (options.key?(:if) && options[:if].call)
              Recurr::RecurringEvent.create(name: to_s,
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
  end
end
