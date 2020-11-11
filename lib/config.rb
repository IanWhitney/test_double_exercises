require 'singleton'

module Config
  def self.person
    Person.instance
  end

  class Person
    include Singleton

    def slow_down?
      slow_down == true
    end

    def slow_down!
      @slow_down = true
    end

    def slow_down
      @slow_down ||= false
    end

    def new_behavior?
      new_behavior == true
    end

    def new_behavior!
      @new_behavior = true
    end

    def new_behavior
      @new_behavior ||= false
    end

    def default!
      instance_variables.each { |iv| instance_variable_set(iv, nil) }
    end
  end
end
