require 'active_job'
class Payment < ActiveJob::Base
  include Recurr::Adapters::ActiveRecord::Event

  def perform
    super
  end
end
