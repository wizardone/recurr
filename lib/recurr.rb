require 'recurr/version'
require 'active_record'

module Recurr
  # Your code goes here...
  INHERIT_FROM = if defined?(::Rails) && ::Rails::VERSION > 5
                  ::ApplicationRecord
                else
                  ::ActiveRecord::Base
                end
end

require 'recurr/active_record/event'
require 'recurr/recurring_event'
