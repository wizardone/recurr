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

    it 'gets the current recurring event for the same week' do
      Timecop.freeze(Time.local(2018, 1, 10)) do
        event = described_class.new({ on: 5, at: 13 })
        expected = Time.new(2018, 1, 12, 13)

        expect(event.current).to eq(expected)
      end
    end

    it 'gets the current recurring event for the next week' do
      Timecop.freeze(Time.local(2018, 1, 5)) do
        event = described_class.new({ on: 3, at: 13 })
        expected = Time.new(2018, 1, 10, 13)

        expect(event.current).to eq(expected)
      end
    end

    it 'gets the current recurring event if next week is in next month' do
      Timecop.freeze(Time.local(2018, 1, 30)) do
        event = described_class.new({ on: 1, at: 13 })
        expected = Time.new(2018, 2, 5, 13)

        expect(event.current).to eq(expected)
      end
    end
  end

  describe '#next' do
    it 'gets the next recurring event' do
      Timecop.freeze(Time.local(2018, 1, 4)) do
        event = described_class.new({ on: 5, at: 20 })
        expected_time = Time.new(2018, 1, 12, 20)

        expect(event.next).to eq(expected_time)
      end
    end
  end
end
