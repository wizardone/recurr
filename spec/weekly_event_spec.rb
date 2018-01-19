require 'spec_helper'

RSpec.describe Recurr::Events::Weekly do

  describe '#current' do
    it 'gets the current recurring event for the same day' do
      Timecop.freeze(Time.local(2018, 1, 1, 10)) do
        event = described_class.new({ on: 5, at: 13 })
        expected = Time.new(2018, 1, event.options[:on], event.options[:at])

        expect(event.current).to eq(expected)
      end
    end

    it 'gets the current recurring event for the next day' do
      Timecop.freeze(Time.local(2018, 1, 6, 20)) do
        event = described_class.new({ on: 5, at: 13 })
        expected = Time.new(2018, 1, event.options[:on] + 7, event.options[:at])

        expect(event.current).to eq(expected)
      end
    end
  end

  describe '#next' do
    it 'gets the next recurring event' do
      event = described_class.new({ on: 5, at: 20 })
      expected_time = Time.new

      expect(event.next).to eq(
        Time.new(
          expected_time.year,
          expected_time.month,
          event.options[:on] + 7,
          event.options[:at]
        )
      )
    end
  end
end
