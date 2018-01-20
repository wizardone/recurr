require 'spec_helper'

RSpec.describe Recurr::RecurringEvent do

  subject { described_class.new }

  describe "validations" do
    it 'validates the scope of execution' do
      subject.save

      expect(subject.errors).to_not be_empty
    end
  end

  describe "#calculate" do

    subject { described_class.new(scope: :daily, at: 13) }

    it 'invokes the calculator' do
      expect(Recurr::Calculator).to receive(:call).with(subject)

      subject.calculate
    end
    it 'calculates the next daily event' do
      expect(subject.calculate).to be_nil
    end
  end

  describe "#current" do

    subject { described_class.new(scope: :daily, at: 13) }

    it 'gets the current event execution date' do
      #event = instance_double(Recurr::Events::Daily)
      #expect(event).to receive(:current)
      expect(Recurr::Events::Daily).to receive(:new)

      subject.current
    end
  end

  describe "#next" do
    it "gets the next occurence of the event" do
      expect(subject.next).to be_nil
    end
  end

  describe "#previous" do
    it "gets the previous occurence of the event" do
      expect(subject.previous).to be_nil
    end
  end

  describe "#passed?" do
    it "checks" do
      expect(subject.passed?).to be_nil
    end
  end
end
