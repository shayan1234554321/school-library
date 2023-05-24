require_relative '../app'

class Menu
  def initialize(books, people, rentals)
    @app = App.new(books, people, rentals)
  end

  def print_menu
    puts "\nPlease choose an option by entering a number:
        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rentals for a given person id
        7 - Exit"
  end

  def result(user_choice)
    case user_choice
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals_by_person_id
    end
  end
end
