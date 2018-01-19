require 'spec_helper'

RSpec.describe Recurr::Events::Daily do

  describe '#current' do
    it 'gets the current recurring event for the same day' do
      Timecop.freeze(Time.local(2018, 1, 1, 10)) do
        event = described_class.new({ at: 13 })
        expected_time = Time.new(2018, 1, 1, event.options[:at])

        expect(event.current).to eq(expected_time)
      end
    end

    it 'gets the current recurring event for the next day' do
      Timecop.freeze(Time.local(2018, 1, 1, 20)) do
        event = described_class.new({ at: 13 })
        expected_time = Time.new(2018, 1, 2, event.options[:at])

        expect(event.current).to eq(expected_time)
      end
    end
  end

  describe '#next' do
    it 'gets the next recurring event' do
      event = described_class.new({ at: 20 })
      expected_time = Time.new

      expect(event.next).to eq(
        Time.new(
          expected_time.year,
          expected_time.month,
          expected_time.day + 1,
          event.options[:at]
        )
      )
    end
  end
end
