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
    attr_accessor :adapter, :event_table_name
  end

  INHERIT_FROM = case config.adapter
                 when :activerecord
                    defined?(::Rails) && ::Rails::VERSION > 5 ? ::ApplicationRecord :
                                                                ::ActiveRecord::Base
                 when :sequel
                    ::Sequel
                  else
                    ::ActiveRecord::Base
                 end
end

require 'recurr/active_record/event'
require 'recurr/recurring_event'
