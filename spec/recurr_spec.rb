require 'spec_helper'

RSpec.describe Recurr do

  subject { Payment.new }

  before { Recurr::RecurringEvent.destroy_all }

  it 'has a version number' do
    expect(Recurr::VERSION).not_to be nil
  end

  it 'has FREQUENCY' do
    expect(Recurr::FREQUENCY).to match_array(%w(daily weekly monthly))
  end

  it 'has INHERIT_FROM' do
    #Rails = Object.const_set('Rails', Object)
    expect(Recurr::INHERIT_FROM).to eq ::ActiveRecord::Base

    #Rails.const_set('VERSION', 5.1)
    #expect(Recurr::INHERIT_FROM).to eq ::ApplicationRecord
  end

  context 'included from recurr' do
    it 'raises an error if not scope option is provided' do
      expect {
        Payment.recurr
      }.to raise_error(ArgumentError)
    end

    it 'creates a new recurring event' do
      expect {
        Payment.recurr(:daily, at: 13)
      }.to change(Recurr::RecurringEvent, :count).by(1)
    end

    it 'create a new recurring event with default options' do
      Payment.recurr(:daily, at: 13)
      event = Recurr::RecurringEvent.last

      expect(event.name).to eq('Payment')
      expect(event.scope).to eq('daily')
      expect(event.on).to eq(1)
      expect(event.at).to eq(13)
      expect(event.reminder).to be false
    end

    it 'creates a new recurring event with custom options' do
      Payment.recurr(:daily, on: 2, at: 12, reminder: true)
      event = Recurr::RecurringEvent.last

      expect(event.name).to eq('Payment')
      expect(event.scope).to eq('daily')
      expect(event.on).to eq(2)
      expect(event.at).to eq(12)
      expect(event.reminder).to be true
    end

    it 'creates a new recurring event if the guard clause passes' do
      expect {
        Payment.recurr(:daily, on: 2, at: 12, reminder: true, if: -> { false })
      }.to_not change(Recurr::RecurringEvent, :count)
    end

    describe '.event' do
      it 'retrieves the current event object' do
        Payment.recurr(:daily, at: 13)
        event = Recurr::RecurringEvent.last

        expect(Payment.event).to eq(event)
        expect(Payment.event.name).to eq('Payment')
      end
    end
  end
end
