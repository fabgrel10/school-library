require 'date'

module Validations
  def validates_age
    print 'Person Age: '
    begin
      person_age = gets.chomp
      person_age = Integer(person_age)
    rescue ArgumentError
      print 'Please enter an integer number:'
      retry
    end
    person_age
  end

  def validates_date
    print 'Date: '
    begin
      date = gets.chomp
      date = Date.parse(date)
    rescue ArgumentError
      print 'Please enter date in the format YYYY/MM/DD: '
      retry
    end
    date
  end
end
