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
    it 'gets the current event execution date' do
      recurring_event = described_class.new(scope: :daily, at: 13, on: 1)
      daily_event = instance_double(
        Recurr::Events::Daily,
        current: Recurr::Events::Daily.new(at: 13, on: 1)
      )
      expect(Recurr::Events::Daily).to receive(:new) { daily_event }
      expect(daily_event).to receive(:current)

      recurring_event.current
    end
  end

  describe "#next" do
    it "gets the next occurence of the event" do
      recurring_event = described_class.new(scope: :daily, at: 13, on: 1)
      daily_event = instance_double(
        Recurr::Events::Daily,
        next: Recurr::Events::Daily.new(at: 13, on: 1)
      )
      expect(Recurr::Events::Daily).to receive(:new) { daily_event }
      expect(daily_event).to receive(:next)

      recurring_event.next
    end
  end

  describe "#previous" do
    it "gets the previous occurence of the event" do
      expect(subject.previous).to be_nil
    end
  end

  describe "#passed?" do
    let(:recurring_event) { described_class.new(scope: :daily, at: 13) }
    it "returns true - if a time is pass the current event time" do
      desired_time = Time.new + (3600 * 24)
      expect(recurring_event.passed?(desired_time)).to be true
    end

    it "returns false - if a time is not pass the current event time" do
      desired_time = Time.new - (3600 * 24)
      expect(recurring_event.passed?(desired_time)).to be false
    end

    it "accepts a regular date object" do
      desired_time = Date.yesterday
      expect(recurring_event.passed?(desired_time)).to be false
    end
  end
end
