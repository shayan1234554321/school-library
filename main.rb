require_relative './classes/menu'

menu = Menu.new

puts 'Welcome to School Library App!'

loop do
  menu.print_menu
  user_choice = gets.chomp.to_i
  menu.result(user_choice)
end
