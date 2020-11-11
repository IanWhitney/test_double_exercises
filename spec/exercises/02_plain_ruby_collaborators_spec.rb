require_relative "../spec_helper"
require 'config'
require 'person'
require 'greeting'
require 'date'
require 'ostruct'

RSpec.describe "When testing a collaborator" do
  describe "you can use plain Ruby objects as a double" do
    describe Greeting, "using OpenStruct as a collaborator" do
      describe "there are benefits to using a collaborator double" do
        it "it is not hard" do
          double_person = OpenStruct.new
          double_person.full_name = "Wizened Tester Testerface"

          subject = described_class.new(person: double_person)

          expect(subject.to_s).to eq(_placeholder), "Look at the Greeting class and replace _placeholder with what this test needs to pass"
        end

        it "replicates the behavior of your collaborator" do
          real_person = Person.new
          real_person.name = "Tester Testerface"
          real_person.title = "Wizened"
          subject_with_real_person = described_class.new(person: real_person)

          double_person = OpenStruct.new(full_name: _placeholder)
          subject_with_double_person = described_class.new(person: double_person)

          expect(subject_with_real_person.to_s).to eq(subject_with_double_person.to_s), "Update the `full_name` we set in our double_person with what this test needs to pass"
        end

        it "requires less setup than using the real collaborator" do
          real_person = Person.new
          real_person.name = "Tester Testerface"
          real_person.title = "Wizened"
          subject_with_real_person = described_class.new(person: real_person)

          double_person = OpenStruct.new(full_name: "Wizened Tester Testerface")
          subject_with_double_person = described_class.new(person: double_person)

          # Replace 0 with the correct values
          number_of_lines_configuring_real_person = 0
          number_of_lines_configuring_double_person = 0

          # this test shows that our Greeting works the same with a real person and a double person
          expect(subject_with_real_person.to_s).to eq(subject_with_double_person.to_s)

          # Replace __ with the correct operator, >, <, ==, etc
          expect(number_of_lines_configuring_real_person).to be __(number_of_lines_configuring_double_person)
        end

        it "is unaffected by implementation changes in your collaborator" do
          # This changes the behavior of the real person class
          ::Config.person.new_behavior!

          real_person = Person.new
          real_person.name = "Tester Testerface"
          real_person.title = "Wizened"
          subject_with_real_person = described_class.new(person: real_person)

          double_person = OpenStruct.new
          double_person.full_name = "Wizened Tester Testerface"
          subject_with_double_person = described_class.new(person: double_person)

          strings_match = (subject_with_real_person.to_s == subject_with_double_person)
          expect(strings_match).to be(_placeholder), "
            Replace the _placeholder with true or false.
            True if the strings match. False if they don't.
            Remember what happened when the Person behavior changed in an earlier exercise?"
        end

        it "is unaffected by the speed of your collaborator" do
          # This slows down the real person class
          ::Config.person.slow_down!

          start_of_real_person = Time.now
          real_person = Person.new
          real_person.name = "Tester Testerface"
          real_person.title = "Wizened"
          subject_with_real_person = described_class.new(person: real_person)
          expect(subject_with_real_person.to_s).to eq "Hello, Wizened Tester Testerface"
          end_of_real_person = Time.now
          time_elapsed_testing_real_person = (end_of_real_person - start_of_real_person).to_f


          start_of_double_person = Time.now
          double_person = OpenStruct.new
          double_person.full_name = "Wizened Tester Testerface"
          subject_with_double_person = described_class.new(person: double_person)
          expect(subject_with_double_person.to_s).to eq "Hello, Wizened Tester Testerface"
          end_of_double_person = Time.now
          time_elapsed_testing_double_person = (end_of_double_person - start_of_double_person).to_f

          # Replace __ with the correct operator, >, <, ==, etc
          expect(time_elapsed_testing_double_person).to be __(time_elapsed_testing_real_person)
        end
      end

      describe "and there are downsides to using a plain Ruby collaborator double" do
        it "lets you call methods that don't exist on the real object" do
          real_person = Person.new
          double_person = OpenStruct.new(minnesota: "ope!")

          # Replace the _placeholders below to show which person raises an error
          # And which does not
          expect { _placeholder.minnesota }.to raise_error(NoMethodError)

          expect { _placeholder.minnesota }.not_to raise_error
        end

        it "lets you write tests that pass even when the real code would fail" do
          # Imagine someone changes the name of the `full_name` method in the Person class
          # But your code in Greeting still calls `person.full_name`

          # This bit of code removes the `full_name` from Person
          # And replaces it with a new method `new_full_name`
          class Person
            undef :full_name
            def new_full_name
              "#{name} (#{title})"
            end
          end

          real_person = Person.new
          double_person = OpenStruct.new(full_name: "Wizened Tester Testerface")

          # Replace the _placeholders below to show which person raises an error
          # And which does not
          expect { described_class.new(person: _placeholder).to_s }.to raise_error(NoMethodError)

          expect { described_class.new(person: _placeholder).to_s }.not_to raise_error
        end
      end
    end
  end
end
