require_relative '../app/people/student'
require_relative '../app/people/person'

describe Student do
  before(:each) do
    @student = Student.new('A1', 18, name: 'Jane Doe', parent_permission: true)
  end

  context 'when testing the Student class' do
    it 'should be an instance of the Student class' do
      expect(@student).to be_an_instance_of Student
    end

    it 'should inherit behavior from Person' do
      expect(Student.superclass).to eq(Person)
    end

    it 'should have a classroom called "A1"' do
      expect(@student.classroom).to eq 'A1'
    end

    it 'should have an age of 18' do
      expect(@student.age).to eq 18
    end

    it 'should have a name called "Jane Doe"' do
      expect(@student.name).to eq 'Jane Doe'
    end

    it 'returns "¯\\(ツ)/¯" when using the play_hooky method' do
      expect(@student.play_hooky).to eq '¯\\(ツ)/¯'
    end
  end
end
