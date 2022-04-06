require_relative 'app/person'
require_relative 'app/teacher'
require_relative 'app/student'

person1 = Person.new(18, name: 'John')
person2 = Person.new(15, name: 'Jane', parent_permission: false)
student = Student.new(18, '1A', name: 'Mike')
teacher = Teacher.new(30, 'Math', name: 'Alexa', parent_permission: true)

puts person1.can_use_services?
puts person2.can_use_services?
puts student.can_use_services?
puts student.play_hooky
puts teacher.specialization
puts teacher.can_use_services?
