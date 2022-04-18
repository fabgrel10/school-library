require_relative './lib/book'
require_relative './lib/rental'
require_relative './people/person'
require_relative './people/student'
require_relative './people/teacher'
require_relative './helpers/listing_methods'
require_relative './helpers/validations'
require_relative './helpers/create_methods'
require_relative './helpers/select_methods'

class App
  include Validations
  include ListingMethods
  include CreateMethods
  include SelectMethods
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
end
