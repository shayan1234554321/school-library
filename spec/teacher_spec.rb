require_relative '../classes/teacher'
require_relative '../classes/classroom'

describe Teacher do
  context 'Create instance of teacher class' do
    teacher = Teacher.new(22, 'John')

    it 'should return instance of teacher class' do
      expect(teacher).to be_instance_of(Teacher)
    end
    it 'should return the teacher can use the service to true' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
