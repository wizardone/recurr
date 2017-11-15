module Recurr
  module ActiveRecord
    module Event

      def included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
      end
    end
  end
end
