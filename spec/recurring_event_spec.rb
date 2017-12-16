require 'spec_helper'

RSpec.describe Recurr::RecurringEvent do
  subject { described_class.new }

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
