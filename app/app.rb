require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './person'
require_relative './helpers/listing_methods'
require_relative './validations'
require_relative './helpers/create_methods'

class App
  include Validations
  include ListingMethods
  include CreateMethods
  attr_accessor :books, :people

  def initialize
    @people = []
    @books = []
    @book = nil
    @person = nil
    @rentals = []
  end

  def run(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    end
  end

  def select_book
    return unless @books.length.positive?

    loop do
      print "\nSelect a book from the following list by number:\n"
      list_books
      number = gets.chomp
      @book = @books[number.to_i]
      break if number.to_i < @books.length and number.to_i >= 0 and number.length.positive?
    end
  end

  def select_person
    return unless @books.length.positive?

    loop do
      puts 'Select a person from the following list by number (not id)'
      list_people
      number = gets.chomp
      @person = @people[number.to_i]
      break if number.to_i < @people.length and number.to_i >= 0 and number.length.positive?
    end
  end
end
