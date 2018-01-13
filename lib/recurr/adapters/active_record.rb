require 'active_support/concern'
module Recurr
  module Adapters
    module ActiveRecord
      extend ActiveSupport::Concern

      class_methods do
        def recurr(scope, **options)
          validate_arguments(scope, options)

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

          def event
            Recurr::RecurringEvent.find_by(name: to_s)
          end

          private

          def validate_arguments(scope, options)
            raise ArgumentError, 'You must supply a :scope option' unless scope
            unless [options[:on], options[:at]].any?(&:present?)
              raise ArgumentError, 'You must supply :on or :at options'
            end
          end
        end
      end
    end
  end
