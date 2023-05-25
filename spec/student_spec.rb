require_relative '../classes/student'
require_relative '../classes/classroom'

describe Student do
  context 'Create instance of student class' do
    student = Student.new(22, 'John')
    classroom = Classroom.new('C1')

    it 'should return instance of student class' do
      expect(student).to be_instance_of(Student)
    end
    it 'should return the play hooky emoji' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
    it 'should return add stuedent to classroom' do
      classroom.students << student
      student.classroom = classroom
      expect(classroom.students.count(student)).to eq(1)
    end
  end
end
