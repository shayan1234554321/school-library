require_relative './classes/menu'
require 'json'

def main

  books = []
  people = []
  rentals = []

  if File.exist?("books.json")
    books = JSON.parse(File.open("books.json").read)
  end
  if File.exist?("people.json")
    people = JSON.parse(File.open("people.json").read)
  end
  if File.exist?("rentals.json")
    rentals = JSON.parse(File.open("rentals.json").read)
  end

  menu = Menu.new(books , people , rentals)

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
