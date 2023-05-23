require_relative './classes/book'
require_relative './classes/person'
require_relative './classes/student'
require_relative './classes/teacher'
require_relative './classes/rental'
require 'json'

class App
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
  end

  # Load books from JSON file
  def load_books
    if File.exist?('books.json')
      books = JSON.parse(File.read('books.json'))
      @books = books.map { |book| Book.new(book['title'], book['author']) }
    else
      @books = []
    end
  end

  # Load people from JSON file
  def load_people
    if File.exist?('people.json')
      persons = JSON.parse(File.read('people.json'))
      @people = persons.map { |person| Person.new(person['age'], person['name']) }
    else
      @people = []
    end
  end

  def list_books
    load_books

    return puts 'No books found' if @books.empty?

    @books.each do |book|
      title = book.title
      author = book.author
      puts "Title: \"#{title}\", Author: #{author}"
    end
  end

  def list_people
    load_people

    return puts 'No people found' if @people.empty?

    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    if person_type != '1' && person_type != '2'
      puts 'Invalid option'
      return
    end

    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    if person_type == '1'
      create_student(age, name)
    else
      create_teacher(age, name)
    end

    puts 'Person created successfully'
  end

  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    @people << Student.new(age, nil, name, parent_permission: parent_permission)

    # convert @people elements into hashes
    people_array = @people.map(&:to_h)
    File.write('people.json', JSON.generate(people_array))
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp

    @people << Teacher.new(age, specialization, name)

    # convert @people elements into hashes
    people_array = @people.map(&:to_h)
    File.write('people.json', JSON.generate(people_array))
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)

    # convert @books elements into hashes
    book_array = @books.map(&:to_h)
    # converts the book_array into a JSON string
    File.write('books.json', JSON.generate(book_array))

    puts 'Book created successfully'
  end

  def create_rental
    load_books
    load_people

    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end

    book_index = gets.chomp.to_i

    puts

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i

    puts

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])

    puts 'Rental created successfully'
  end

  def list_rentals_by_person_id
    
    print 'ID of person: '
    id = gets.chomp

    selected_rentals = @rentals.select { |rental| rental.person.id == id.to_i }

    return puts "No rentals found for ID(#{id})" if selected_rentals.empty?

    puts 'Rentals:'
    selected_rentals.each do |rental|
      puts "#{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
