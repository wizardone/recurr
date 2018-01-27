require 'spec_helper'

RSpec.describe Recurr::Events::Weekly do

  describe '#current' do
    it 'gets the current recurring event for the same week' do
      Timecop.freeze(Time.local(2018, 1, 1)) do
        event = described_class.new({ on: 3, at: 13 })
        expected = Time.new(2018, 1, 3, 13)

        expect(event.current).to eq(expected)
      end
    end

    it 'gets the current recurring event for the next week' do
      Timecop.freeze(Time.local(2018, 1, 5)) do
        event = described_class.new({ on: 2, at: 13 })
        expected = Time.new(2018, 1, 5 + 7, 13)

        expect(event.current).to eq(expected)
      end
    end
  end

  describe '#next' do
    it 'gets the next recurring event' do
      #event = described_class.new({ on: 5, at: 20 })
      #expected_time = Time.new

      #expect(event.next).to eq(
      #  Time.new(
      #    expected_time.year,
      #    expected_time.month,
      #    event.options[:on] + 7,
      #    event.options[:at]
      #  )
      #)
    end
  end
end
