require 'spec_helper'

RSpec.describe Recurr do

  subject { Payment.new }

  it 'has a version number' do
    expect(Recurr::VERSION).not_to be nil
  end

  it 'has frequence' do
    expect(Recurr::FREQUENCY).to match_array(%w(daily weekly monthly))
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
      expect(event.day).to eq(1)
      expect(event.hour).to eq(13)
      expect(event.reminder).to be false
    end

    it 'creates a new recurring event with custom options' do
      Payment.recurr(scope: :daily, day: 2, hour: 12, reminder: true)
      event = Recurr::RecurringEvent.last

      expect(event.name).to eq('Payment')
      expect(event.day).to eq(2)
      expect(event.hour).to eq(12)
      expect(event.reminder).to be true
    end
  end
end
