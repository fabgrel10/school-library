require 'date'
require_relative '../app/people/person'

describe Person do
  before(:each) do
    @person = Person.new(18, name: 'John Doe')
  end

  context 'when testing the Person class' do
    it 'should be an instance of the Person class' do
      expect(@person).to be_an_instance_of Person
    end

    it 'should have an age of 18' do
      expect(@person.age).to eq 18
    end

    it 'should have a name called "John Doe"' do
      expect(@person.name).to eq 'John Doe'
    end

    it 'should have a method called "can_use_services?"' do
      expect(@person.methods.include?(:can_use_services?)).to eq true
    end

    it 'should have a method called "correct_name"' do
      expect(@person.methods.include?(:correct_name)).to eq true
    end

    it 'create a Rentals array' do
      expect(@person.rentals).to be_an_instance_of Array
    end

    it 'should throw an error if not arguments given' do
      expect { Person.new }.to raise_error(ArgumentError)
    end

    it 'should throw an error if more than two arguments given' do
      expect { Person.new('John Doe', 33, 'The Hobbit') }.to raise_error(ArgumentError)
    end
  end
end
