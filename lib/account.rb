class Account
  attr_accessor :username

  def self.create(person:, mailer: NewAccountMailer)
    mailer.create(to: person.email)
    account = self.new
    account.username = person.email
    account.save
  end

  def save
    # Account saved to a dababase
  end
end

class NewAccountMailer
  def self.create(to:)
    # email sending code
  end
end
