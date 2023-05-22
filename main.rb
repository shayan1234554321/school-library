require_relative './classes/menu'

def main
  puts 'Welcome to School Library App!'
  menu = Menu.new
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
