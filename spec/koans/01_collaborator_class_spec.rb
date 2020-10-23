require_relative "../spec_helper"
require 'person'
require 'greeting'
require 'date'

RSpec.describe "When testing a collaborator" do
  describe "you can use the actual collaborator class" do
    describe Greeting, "uses a Person as a collaborator" do
      describe "there are benefits to setting up a Person instance directly" do
        it "it is not hard" do
          person = Person.new
          person.name = "Tester Testerson"
          person.title = "Doctor"

          subject = described_class.new(person: person)

          expect(subject.to_s).to eq(_placeholder), "Look at the Greeting class and replace _placeholder with what this test needs to pass"
        end

        it "and you can't use person methods that don't exist" do
          person = Person.new

          expect{ person.minnesota }.to raise_error(PlaceHolderError)
        end
      end

      describe "but there are downsides" do
        it "your tests fail when the collaborator changes" do
          # The new_behavior param changes the internals of the collaborator
          person = Person.new(new_behavior: true)
          person.name = "Testo Testerface"
          person.title = "Lawyer"

          subject = described_class.new(person: person)

          expect(subject.to_s).to eq("Hello, Lawyer Testo Testerface"), "
          Oh no!
          The behavior of Person has changed your test failed.
          You expected 'Hello, Lawyer Testo Testerface',
          but you got #{subject.to_s}.
          Update your test and wonder 'Why am I updating a Greeting test because Person changed?'"
        end

        it "and it is hard to see what is under test" do
          # How much of this test configures a Person?
          # And how much configures the class under test?
          # Reading this test which class seems most important?
          person = Person.new
          person.birthday = Date.new(2004,2,29)
          person.name = "Frederic Penzance"
          person.title = "Pirate"
          current_age = person.age

          subject = described_class.new(person: person)

          number_of_lines_configuring_person = _placeholder
          number_of_lines_configuring_greeting = _placeholder

          expect(number_of_lines_configuring_person).to be > number_of_lines_configuring_greeting
          expect(subject.to_s).to eq("Hello, Pirate Frederic Penzance. You are #{current_age} years old!")
        end

        it "and your tests are slow if your collaborator is slow" do
          # The slow_down param slows down your collaborator
          person = Person.new(slow_down: true)
          person.birthday = Date.new(2004,2,29)
          person.name = "Frederic Penzance"
          person.title = "Pirate"
          current_age = person.age

          subject = described_class.new(person: person)

          expect(subject.to_s).to eq("Hello, Pirate Frederic Penzance. You are #{current_age} years old!")
        end
      end
    end
  end
end
