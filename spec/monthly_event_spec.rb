require 'spec_helper'

RSpec.describe Recurr::Events::Monthly do

  describe '#current' do
    it 'gets the current recurring event for the same month' do
      Timecop.freeze(Time.local(2018, 1, 10)) do
        event = described_class.new({ on: 13, at: 13 })
        expected = Time.new(2018, 1, 13, 13)

        expect(event.current).to eq(expected)
      end
    end

    it 'gets the current recurring event for the next month' do
      Timecop.freeze(Time.local(2018, 1, 15)) do
        event = described_class.new({ on: 10, at: 13 })
        expected = Time.new(2018, 2, 10, 13)

        expect(event.current).to eq(expected)
      end
    end

    it 'gets the current recurring event if next month is in next year' do
      Timecop.freeze(Time.local(2018, 12, 30)) do
        event = described_class.new({ on: 5, at: 13 })
        expected = Time.new(2019, 1, 5, 13)

        expect(event.current).to eq(expected)
      end
    end
  end

  describe '#next' do
    it 'gets the next recurring event' do
      Timecop.freeze(Time.local(2018, 1, 15)) do
        event = described_class.new({ on: 20, at: 20 })
        expected_time = Time.new(2018, 2, 20, 20)

        expect(event.next).to eq(expected_time)
      end
    end
  end
end
