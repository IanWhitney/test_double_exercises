require_relative "../spec_helper"
require 'person'
require 'greeting'

RSpec.describe "When testing a collaborator" do
  describe Greeting, "you can use a RSpec stub to stand in for the collaborator" do
    describe "there are benefits to using a stub as a stand in" do
      it "it is not hard" do
        double_person = instance_double(Person, full_name: "Wizened Tester Testerface")

        subject = described_class.new(person: double_person)

        expect(subject.to_s).to eq(_placeholder), "Look at the Greeting class and replace _placeholder with what this test needs to pass"
      end

      it "replicates the behavior of your collaborator" do
        real_person = Person.new
        real_person.name = "Tester Testerface"
        real_person.title = "Wizened"
        subject_with_real_person = described_class.new(person: real_person)

        double_person = instance_double(Person, full_name: _placeholder)
        subject_with_double_person = described_class.new(person: double_person)

        expect(subject_with_real_person.to_s).to eq(subject_with_double_person.to_s), "Update the `full_name` we set in our standin_person with what this test needs to pass"
      end

      it "requires less setup than using the real collaborator" do
        real_person = Person.new
        real_person.name = "Tester Testerface"
        real_person.title = "Wizened"
        subject_with_real_person = described_class.new(person: real_person)

        double_person = instance_double(Person, full_name: _placeholder)
        subject_with_double_person = described_class.new(person: double_person)

        # Replace 0 with the correct values
        number_of_lines_configuring_real_person = 0
        number_of_lines_configuring_double_person = 0

        # this test shows that our Greeting works the same with a real person and a standin person
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

        double_person = instance_double(Person, full_name: _placeholder)
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
        double_person = instance_double(Person, full_name: "Wizened Tester Testerface")
        subject_with_double_person = described_class.new(person: double_person)
        expect(subject_with_double_person.to_s).to eq "Hello, Wizened Tester Testerface"
        end_of_double_person = Time.now
        time_elapsed_testing_double_person = (end_of_double_person - start_of_double_person).to_f

        # Replace __ with the correct operator, >, <, ==, etc
        expect(time_elapsed_testing_double_person).to be __(time_elapsed_testing_real_person)
      end

      it "won't let you call methods that don't exist on the real object" do
        expect { instance_double(Person, minnesota: "ope!") }
          .to raise_error(
            an_instance_of(PlaceholderError)
            .and having_attributes(message: "_placeholder")
        )
      end
    end

    describe "and there are downsides to using a RSpec stub as a double" do
      it "you are now required to define how it responds to any method you call" do
        double_person = instance_double(Person, name: "Tester Testerson", title: "Wizened")

        expect(double_person.name).to eq("Tester Testerson")
        expect(double_person.title).to eq("Wizened")

        expect { double_person.full_name }.to raise_error(
          an_instance_of(RSpec::Mocks::MockExpectationError)
          .and having_attributes(
            message: a_string_matching(/received unexpected message :full_name/)
        )
        )

        # Uncomment this line and replace `_placeholder` with
        # the method you want to call on `double_person`
        # The methond name can be a symbol (:method_name) or string ('method_name')
        # allow(double_person).to receive(_placeholder)

        expect { double_person.full_name }.not_to raise_error, "
        Replace _placeholder with the method you want to call on `double_person`.
        The method name can be a symbol (:method_name) or string 'method_name')"
      end
    end
  end
end
