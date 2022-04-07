require_relative './nameable'

class Person < Nameable
  attr_accessor :name, :age

  attr_reader :id, :parent_permission

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end

# test_person = Person.new(19, name: 'John')
# p test_person.correct_name
