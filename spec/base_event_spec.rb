require 'spec_helper'

RSpec.describe Recurr::Events::Base do

  let(:options) { { on: 5, at: 13, starts: '2018-01-20' } }

  describe '#initialize' do
    it 'accepts options' do
      base_event = described_class.new(options)

      expect(base_event.options).to eq(options)
      expect(base_event.starts).to eq(options[:starts])
    end
  end

  describe '#current' do
    it 'raises a not implemented error' do
      expect {
        described_class.new(options).current
      }.to raise_error(NotImplementedError)
    end
  end

  describe '#next' do
    it 'raises a not implemented error' do
      expect {
        described_class.new(options).next
      }.to raise_error(NotImplementedError)
    end
  end
end
