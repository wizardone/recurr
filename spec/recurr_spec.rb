require 'spec_helper'

RSpec.describe Recurr do

  subject { Event.new }

  it "has a version number" do
    expect(Recurr::VERSION).not_to be nil
  end

  context 'included from recurr' do
    it 'includes the recurring events association' do
      expect(subject.recurring_events).to eq([])
    end
  end
end
