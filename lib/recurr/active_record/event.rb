module Recurr
  module ActiveRecord
    module Event

      def included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        # setup the association with the event model
        has_many :recurring_events,
                  class_name: 'Recurr::RecurringEvent',
                  dependent: :delete_all
      end
    end
  end
end
