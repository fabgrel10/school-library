require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name: 'Unknown', parent_permission: true, classroom: nil)
    super(age, name: name, parent_permission: parent_permission)
    classroom.add_student(self) unless classroom.student.include?(self)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
