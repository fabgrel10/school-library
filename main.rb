require_relative './app/app'

def main
  system 'clear'
  puts '         ***********************'
  puts '         * School Library v1.0 *'
  puts '         ***********************'
  puts

  app = App.new
  loop do
    puts "Select an option:
    1 - List available books
    2 - List registered people
    3 - Add a person
    4 - Add a book
    5 - Add a rental
    6 - Show rentals
    7 - Exit"
    choice = gets.chomp.to_i
    break if choice == 7

    app.run(choice)
  end
  puts "Come back soon!\n\n"
end
main
