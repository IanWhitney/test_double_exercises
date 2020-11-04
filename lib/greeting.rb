class Greeting
  def initialize(person:)
    self.person = person
  end

  def to_s
    "Hello, #{person.full_name}"
  end

  private

  attr_accessor :person
end
