module CreateMethods
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
end
