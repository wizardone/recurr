require 'recurr/version'
require 'active_record'

module Recurr

  class Configuration
    attr_reader :store, :event_table_name
  end

  def self.configure
    #memoize
    yield Configuration.new
  end

  INHERIT_FROM = if defined?(::Rails) && ::Rails::VERSION > 5
                  ::ApplicationRecord
                else
                  ::ActiveRecord::Base
                end
end

require 'recurr/active_record/event'
require 'recurr/recurring_event'
