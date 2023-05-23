require_relative './classes/menu'
require 'json'

def main
  books = []
  people = []
  rentals = []

  people = JSON.parse(File.read('people.json')) if File.exist?('people.json')
  rentals = JSON.parse(File.read('rentals.json')) if File.exist?('rentals.json')

  menu = Menu.new(books, people, rentals)

  puts 'Welcome to School Library App!'
  loop do
    menu.print_menu
    user_choice = gets.chomp.to_i
    if user_choice == 7
      puts 'Thank you for using this app'
      break
    end
    menu.result(user_choice)
  end
end

main
