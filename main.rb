require "dry/monads"

class User
  attr_accessor :name, :status
  include Dry::Monads[:maybe]

  def valid_name?
    Maybe(name)
  end

  def valid_status?
    Maybe(status)
  end
end

user = User.new

# Return None
result = user.valid_name?
puts result

user.name = "S-117"

# Return Some
result = user.valid_name?
puts result
puts result.value!
