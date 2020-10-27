class Person
  attr_accessor :birthday, :name, :title

  def initialize(new_behavior: false, slow_down: false)
    self.new_behavior = new_behavior
    self.slow_down = slow_down
  end

  def full_name
    if new_behavior?
      "#{name} (#{title})"
    else
      "#{title} #{name}"
    end
  end

  def age
    if slow_down?
      sleep 1
    end

    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  private

  attr_accessor :new_behavior, :slow_down

  def new_behavior?
    new_behavior == true
  end

  def slow_down?
    slow_down == true
  end
end
