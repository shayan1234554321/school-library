require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  def initialize(type, age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @type = type
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :rentals, :name, :age
  attr_reader :id

  def to_h
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      type: @type,
      rentals: @rentals.map(&:to_h)
    }
  end

  def can_use_services?
    return unless @age && @parent_permission

    true
  end

  def correct_name
    @name
  end

  def add_rentals(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
