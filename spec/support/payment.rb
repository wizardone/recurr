class Payment < ActiveRecord::Base
  include Recurr::Adapters::ActiveRecord::Event
end
