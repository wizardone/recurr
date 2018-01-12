require 'active_support/concern'
module Recurr
  module Adapters
    module ActiveRecord
      extend ActiveSupport::Concern

      class_methods do
        def recurr(scope, **options)
          raise ArgumentError, 'You must supply a :scope option' unless scope

          day = options[:day] || 1
          at = options[:at] || 13
          on = options[:on] || 1
          reminder = options[:reminder] || false

          if options[:if].nil? || (options.key?(:if) && options[:if].call)
            Recurr::RecurringEvent.create(name: to_s,
              description: '',
              scope: scope,
              at: at,
              on: on,
              reminder: reminder)
            end
          end

          def retrieve_events
            Recurr::RecurringEvent.where(name: to_s)
          end
        end
      end
    end
  end
