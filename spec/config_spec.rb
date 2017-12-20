require 'spec_helper'

RSpec.describe Recurr::Configuration do
  subject { described_class }

  it 'has all the attributes' do
    configuration = subject.new

    expect(configuration.adapter).not_to be_nil
    expect(configuration.event_table_name).not_to be_nil
    expect(configuration.background_adapter).not_to be_nil
  end
end
