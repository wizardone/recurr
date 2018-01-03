require 'spec_helper'

RSpec.describe Recurr::RecurringEvent do
  subject { described_class.new }

  describe "validations" do
    it 'validates the scope of execution' do
      subject.save

      expect(subject.errors).to_not be_empty
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
