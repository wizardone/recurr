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

        end
      end
    end
  end
end
