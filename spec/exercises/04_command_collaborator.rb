require_relative "../spec_helper"
require "account"
require "person"

RSpec.describe "When testing a command collaborator" do
  describe Account, "You need to ensure that the commands are sent correctly" do
    # Take a look at the code in account.rb
    # We want to test that when we Create an account, we send a New Account Email to the person's email address
    it "it is not possible with a stub" do
      double_person = instance_double(Person, email: "test@test.com")
      double_mailer = class_double(NewAccountMailer)

      # This stubs the Mailer's create method.
      # Allowing the test to call it with our person_double's email
      allow(double_mailer).to receive(:create).with(to: double_person.email)

      #fail "Read this test code and follow the directions"

      # First, comment out the `fail` command above this line
      # Second, run this test. Does it pass or fail?
      # Third, comment out the `mailer.create(to: person.email)` line
      #   in `lib/account.rb`
      # Fourth, run this test. Does it pass or fail?
      # Does this test ensure that the email command is being sent?

      described_class.create(person: double_person, mailer: double_mailer)
    end

    it "requires a Mock to test that your command was sent" do
      double_person = instance_double(Person, email: "test@test.com")
      double_mailer = class_double(NewAccountMailer)

      # This Mocks the Mailer's create method.
      # A Mock is different than a Stub.
      # Like a Stub, it allows us to call a method on a double
      # Unlike a Stub, our test will fail if that method is _not_ called
      expect(double_mailer).to receive(:create).with(to: double_person.email)

      #fail "Read this test code and follow the directions"

      # First, make sure the `mailer.create(to: person.email)` line
      #   in `lib/account.rb` is not commented out
      # Second, run this test. Does it pass or fail?
      # Third, comment out the `mailer.create(to: person.email)` line
      #   in `lib/account.rb`
      # Fourth, run this test. Does it pass or fail?
      # Does this test ensure that the email command is being sent?

      described_class.create(person: double_person, mailer: double_mailer)
    end
  end
end
