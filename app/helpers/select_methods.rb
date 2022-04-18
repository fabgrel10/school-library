module SelectMethods
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
