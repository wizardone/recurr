require 'active_job'
class Payment < ActiveJob::Base
  include Recurr::Adapters::ActiveRecord

  def perform
    super
  end
end
