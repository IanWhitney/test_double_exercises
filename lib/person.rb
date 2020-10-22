class Person
  attr_accessor :birthday

  def age
    (Date.today - birthday)/365
  end
end
