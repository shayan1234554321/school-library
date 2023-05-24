class Rental
  attr_accessor :date, :person
  attr_reader :book

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def to_h
    {
      date: @date,
      book: {
        title: @book.title,
        author: @book.author
      },
      person: {
        id: @person.id,
        name: @person.name,
        age: @person.age
      }
    }
  end
end
