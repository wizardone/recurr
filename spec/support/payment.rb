class Payment < ActiveRecord::Base
  include Recurr::ActiveRecord::Event
end
