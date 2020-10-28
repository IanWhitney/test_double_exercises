require_relative "../spec_helper"
require "person"
require "date"

RSpec.describe "When testing a class" do
  describe "Rspec offers some helpers" do
    describe "like described_class" do
      describe Person do
        it "returns the class named in your describe block" do
          expect(described_class).to be(_placeholder), "Replace the _placeholder with Person"
        end
      end
    end

    describe "and subject" do
      describe Person do
        it "returns an instance of the described class by calling described_class.new()" do
          expect(subject).to be_instance_of(_placeholder), "Replace the _placeholder with Person"
          # How could you write this test to use the `described_class` helper?
        end
      end
    end

    describe "subject can be overwritten" do
      subject { String.new("") }
      it "is set to the result of the code block" do
        expect(subject).to be_instance_of(_placeholder), "Replace the _placeholder with the subject's Class"
      end
    end
  end

  describe "test the class's methods by calling them directly" do
    describe Person do
      subject do
        twenty_years_ago = Date.today - (365.25 * 20)
        person = described_class.new
        person.birthday = twenty_years_ago
        person
      end

      it "returns the age in whole years" do
        expect(subject.age).to eq(_placeholder), "Replace the _placeholder with the value you expect the method to return"
      end
    end
  end

  describe "when testing methods that do not exist" do
    describe Person do
      it "will fail" do
        expect { subject.minnesota }.to raise_error(PlaceholderError), "Update the PlaceHolderError with the type of error that is raised"
      end
    end
  end
end
