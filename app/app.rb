require_relative './lib/book'
require_relative './lib/rental'
require_relative './people/person'
require_relative './people/student'
require_relative './people/teacher'
require_relative './helpers/listing_methods'
require_relative './helpers/validations'
require_relative './helpers/create_methods'
require_relative './helpers/select_methods'
require 'json'

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

  def load_books
    if File.exist?('books.json')
      data = JSON.parse(File.read('books.json'), create_additions: true)
      data.each do |book|
        @books.push(Book.new(book['title'], book['author']))
      end
    else
      []
    end
  end

  def load_people
    if File.exist?('people.json')
      data = JSON.parse(File.read('people.json'), create_additions: true)
      data.each do |person|
        case person['json_class']
        when 'Student'
          student = Student.new(nil, person['age'], name: person['name'],
                                                    parent_permission: person['parent_permission'])

          student.id = person['id']
          @people.push(student)
        when 'Teacher'
          teacher = Teacher.new(person['specialization'], person['age'], name: person['name'])
          teacher.id = person['id']
          @people.push(teacher)
        end
      end
    else
      []
    end
  end

  def load_rentals
    if File.exist?('rentals.json')
      data = JSON.parse(File.read('rentals.json'), create_additions: true)
      data.map do |rentals|
        person = @people.find { |people| people.id == rentals['id_people'] }
        book = @books.find { |books| books.title == rentals['book_title'] }
        @rents.push(Rental.new(rentals['date'], book, person))
      end
    else
      []
    end
  end

end
