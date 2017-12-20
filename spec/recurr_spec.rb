require 'spec_helper'

RSpec.describe Recurr do

  subject { Payment.new }

  it "has a version number" do
    expect(Recurr::VERSION).not_to be nil
  end

  context 'included from recurr' do
    it 'includes the recurring events association' do
      expect(subject.recurring_events).to eq([])
    end

    it 'creates a new recurring event' do
      expect {
        Payment.recurr
      }.to change(Recurr::RecurringEvent, :count).by(1)
    end

    it 'create a new recurring event with default options' do
      Payment.recurr
      event = Recurr::RecurringEvent.last

      expect(event.name).to eq('Payment')
      expect(event.occurence).to eq(1)
      expect(event.hour).to eq(13)
      expect(event.reminder).to be false
    end
  end
end
