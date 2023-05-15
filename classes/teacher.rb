require_relative 'person'

# This class represents a Teacher, inheriting from the Person class.
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
