require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './person'
require_relative './validations'

class App
  include Validations
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
      book_list
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      rentals_list
    end
  end

  def book_list
    puts 'No books registered yet' if @books.empty?
    puts
    @books.each_with_index do |book, index|
      print "[ #{index} ] #{book.title} by #{book.author}\n"
    end
    puts
  end

  def list_people
    puts 'No people registered yet' if @people.empty?
    puts
    @people.each_with_index do |person, index|
      print "INDEX: #{index} belongs to #{person.name}, age #{person.age} is #{person.class}, with ID #{person.id}\n"
    end
    puts
  end

  def create_person
    loop do
      print "\nSelect a person type:\n1 - Student\n2 - Teacher\n"
      person = gets.chomp
      case person
      when '1'
        create_student
      when '2'
        create_teacher
      end

      break if %w[1 2].include?(person)
    end
    print "Person created successfully!\n\n"
    sleep 2 and system 'clear'
  end

  def create_student
    age = validates_age
    print "Person's Name: "
    name = gets.chomp
    loop do
      print 'Has parent permission [Y/N]?: '
      permission = gets.chomp
      if %w[y Y].include?(permission)
        student = Student.new(nil, age, name: name, parent_permission: true)
        @people << student unless @people.include?(student)
        break
      elsif %w[n N].include?(permission)
        student = Student.new(nil, age, name: name, parent_permission: false)
        @people << student unless @people.include?(student)
        break
      end
    end
  end

  def create_teacher
    age = validates_age
    print 'Specialization: '
    specialization = gets.chomp
    print "Person's Name: "
    name = gets.chomp
    teacher = Teacher.new(age, specialization, name: name)
    @people << teacher unless @people.include?(teacher)
  end

  def create_book
    print('Book Title: ')
    title = gets.chomp
    print('Author: ')
    author = gets.chomp
    puts "Book created successfully \n\n"
    book = Book.new(title, author)
    @books << book unless @books.include?(book)
    sleep 2 and system 'clear'
  end

  def create_rental
    if @people.empty? || @books.empty?
      puts 'You need to add a person and a book before adding a rental'
      sleep 2 and system 'clear'
      return
    end
    select_book
    select_person
    date = validates_date
    rent = Rental.new(date, @book, @person)
    @rentals << rent unless @rentals.include?(rent)
    puts "Rental created successfully\n\n"
  end

  def select_book
    return unless @books.length.positive?

    loop do
      print "\nSelect a book:\n"
      book_list
      number = gets.chomp
      @book = @books[number.to_i]
      break if number.to_i < @books.length and number.to_i >= 0 and number.length.positive?
    end
  end

  def select_person
    return unless @books.length.positive?

    loop do
      print "\nSelect person's INDEX []:\n"
      list_people
      number = gets.chomp
      @person = @people[number.to_i]
      break if number.to_i < @people.length and number.to_i >= 0 and number.length.positive?
    end
  end

  def rentals_list
    if @rentals.empty?
      puts 'No rentals to show'
      sleep 2 and system 'clear'
      return
    end
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals'
    @rentals.map do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}\n\n" if id == rental.person.id
    end
  end
end
