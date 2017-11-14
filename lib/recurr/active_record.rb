module Recurr
  module ActiveRecord

    def included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
    end
  end
end
