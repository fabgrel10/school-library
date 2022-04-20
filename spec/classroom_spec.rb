require_relative '../app/people/student.rb'
require_relative '../app/lib/classroom.rb'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('OOP')
    @student = Student.new(@classroom, '15', name: 'Gaby', parent_permission: true)
    @classroom.add_student(@student)
  end

  context 'When creating a classroom' do
    it 'is an instance of Classroom' do
      expect(@classroom).to be_an_instance_of Classroom
    end

    it 'adds the classrom to Student' do
      expect(@student.classroom).to eq(@classroom)
    end

    it 'adds to students array' do
      expect(@classroom.students).to eq([@student])
    end
  end
end
