class Payment
  include Recurr::Adapters::ActiveRecord

  def perform
    super
  end
end
