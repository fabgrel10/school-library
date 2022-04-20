require_relative './app/app'
require 'json'

def main
  system 'clear'
  puts '     ********************************'
  puts '     * Welcome to School Lybrary App *'
  puts '     *********************************'
  puts

  app = App.new
  app.load_files
  loop do
    puts "Please choose an option by entering a number:
        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rentals for a given person id
        7 - Exit"
    choice = gets.chomp.to_i
    if choice == 7
      app.save_files
      break
    end
    app.run(choice)
  end
  puts "Come back soon!\n\n"
end
main
