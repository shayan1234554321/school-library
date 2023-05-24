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

  def list_books
    @books = JSON.parse(File.read('books.json')) if File.exist?('books.json')
    return puts 'No books found' if @books.empty?

    @books.each do |book|
      title = book['title']
      author = book['author']
      puts "Title: \"#{title}\", Author: #{author}"
    end
  end

  def list_people
    @people = JSON.parse(File.read('people.json')) if File.exist?('people.json')
    return puts 'No people found' if @people.empty?

    @people.each do |person|
      puts "[#{person['type']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
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

    # Writing on the file
    people_array = @people.map(&:to_h)
    File.write('people.json', JSON.generate(people_array))

    puts 'Student created successfully'
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp

    @people << Teacher.new(age, specialization, name)

    # Writing on the file
    people_array = @people.map(&:to_h)
    File.write('people.json', JSON.generate(people_array))

    puts 'Teacher created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)

    # Writing on the file
    book_array = @books.map(&:to_h)
    File.write('books.json', JSON.generate(book_array))

    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book['title']}\", Author: #{book['author']}"
    end

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person['type']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end

    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])

    # Writing on the file
    rental_array = @rentals.map(&:to_h)
    File.write('rentals.json', JSON.generate(rental_array))

    puts 'Rental created successfully'
  end

  def list_rentals_by_person_id
    @rentals = JSON.parse(File.read('rentals.json')) if File.exist?('rentals.json')
    print 'ID of person: '
    id = gets.chomp

    puts @rentals

    selected_rentals = @rentals.select { |rental| rental['person']['id'] == id.to_i }

    return puts "No rentals found for ID(#{id})" if selected_rentals.empty?

    puts 'Rentals:'
    selected_rentals.each do |rental|
      date = rental['date']
      book_title = rental['book']['title']
      book_author = rental['book']['author']
      puts "Date : #{date}, Book Title : \"#{book_title}\", Author \" #{book_author}\""
    end
  end
end
