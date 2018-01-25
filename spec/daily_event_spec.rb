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

    it 'gets the current recurring event if a custom start date is given' do
      Timecop.freeze(Time.local(2018, 1, 1, 10)) do
        event = described_class.new({ starts: Date.today.next_day, at: 13 })
        expected_time = Time.new(2018, 1, 2, event.options[:at])

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

    it 'gets the current recurring event for a new month' do
      Timecop.freeze(Time.local(2018, 1, 31, 20)) do
        event = described_class.new({ at: 13 })
        expected_time = Time.new(2018, 2, 1, event.options[:at])

        expect(event.current).to eq(expected_time)
      end
    end

    it 'gets the current recurring event for february' do
      Timecop.freeze(Time.local(2018, 2, 28, 20)) do
        event = described_class.new({ at: 13 })
        expected_time = Time.new(2018, 3, 1, event.options[:at])

        expect(event.current).to eq(expected_time)
      end
    end

    it 'gets the current recurring event for a new year' do
      Timecop.freeze(Time.local(2018, 12, 31, 20)) do
        event = described_class.new({ at: 13 })
        expected_time = Time.new(2019, 1, 1, event.options[:at])

        expect(event.current).to eq(expected_time)
      end
    end
  end

  describe '#next' do
    it 'gets the next recurring event' do
      Timecop.freeze(Time.local(2018, 1, 1, 15)) do
        event = described_class.new({ at: 20 })
        expected_time = Time.new(2018, 1, 2, event.options[:at])

        expect(event.next).to eq(expected_time)
      end
    end
  end
end
