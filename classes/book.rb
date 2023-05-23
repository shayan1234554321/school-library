require_relative 'rental'
require 'json'
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rentals(person, date)
    Rental.new(date, self, person)
  end

  # the method converts the book object into hash representation
  def to_h
    { title: @title,
      author: @author,
      rentals: @rentals.map(&:to_h) }
  end
end
