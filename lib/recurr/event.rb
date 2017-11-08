module Recurr
  module Event

    def included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

    end
  end
end
