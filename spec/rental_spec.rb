require_relative '../classes/book'
require_relative '../classes/rental'
require_relative '../classes/person'

describe Rental do
  context 'Create instance of Rental class' do
    book = Book.new('Ruby', 'Shayan')
    person = Person.new('Student', 22, 'Iqbal')
    date = '2019'
    rental = Rental.new(date, book, person)

    it 'should return instance of Rental class' do
      expect(rental).to be_instance_of(Rental)
    end
    it 'returns the correct rental date' do
      expect(rental.date).to eql('2019')
    end
  end
end
