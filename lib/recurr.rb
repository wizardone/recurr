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

  # Configuration class
  class Configuration
    attr_accessor :adapter,
                  :event_table_name,
                  :background_adapter

    def initialize
      @adapter = :active_record
      @event_table_name = 'recurring_events'
      @background_adapter = :active_job
    end
  end

  INHERIT_FROM = case config.adapter
                 when :active_record
                   defined?(::Rails) && ::Rails::VERSION > 5 ? ::ApplicationRecord :
                                                               ::ActiveRecord::Base
                 when :sequel
                   ::Sequel
                 else
                   ::ActiveRecord::Base
                 end
  FREQUENCY = %w[daily weekly monthly].freeze
end

require 'recurr/adapters/active_record/event'
require 'recurr/recurring_event'
