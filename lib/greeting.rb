class Greeting
  def initialize(person:)
    self.person = person
  end

  def to_s
    if person.birthday
      "Hello, #{person.full_name}. You are #{person.age} years old!"
    else
      "Hello, #{person.full_name}"
    end
  end

  private

  attr_accessor :person
end
