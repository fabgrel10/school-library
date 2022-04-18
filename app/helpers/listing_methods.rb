module ListingMethods
  def list_books
    puts 'No books registered yet' if @books.empty?
    puts
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    puts
  end

  def list_people
    puts 'No people registered yet' if @people.empty?
    puts
    @people.each_with_index do |person, index|
      print "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}\n"
    end
    puts
  end

  def list_rentals
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
