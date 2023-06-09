class Teacher < Person
  attr_accessor :classroom

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super('Teacher', age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
