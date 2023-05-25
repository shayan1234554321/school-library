require_relative '../classes/person'
require_relative '../classes/student'

describe Person do
  context 'Create instance of person class' do
    person = Person.new('student', 22, 'John')

    it 'should return instance of person class' do
      expect(person).to be_instance_of(Person)
    end
    it 'returns the correct age' do
      person.age.should eql 22
    end
    it 'returns the correct name' do
      person.name.should eql 'John'
    end
    it 'returns the rentals' do
      expect(person.rentals.length).to eql(0)
    end
    it 'should check if person can use the service' do
      expect(person.can_use_services?).to eq(true)
    end
    it 'should return the name' do
      expect(person.correct_name).to eq('John')
    end
  end
end
