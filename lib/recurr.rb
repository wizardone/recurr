require 'recurr/version'
require 'active_record'
require 'byebug'

module Recurr

  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield config
  end

  class Configuration
    attr_accessor :store, :event_table_name
  end

  INHERIT_FROM = if defined?(::Rails) && ::Rails::VERSION > 5
                  ::ApplicationRecord
                else
                  ::ActiveRecord::Base
                end
end

require 'recurr/active_record/event'
require 'recurr/recurring_event'
