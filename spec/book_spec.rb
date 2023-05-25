require_relative '../classes/book'
require_relative '../classes/rental'
require_relative '../classes/person'

describe Book do
  context 'Create instance of Book class' do
    book = Book.new('Ruby', 'Shayan')
    person = Person.new('Student', 22)
    date = '2019'
    it 'should return instance of Book class' do
      expect(book).to be_instance_of(Book)
    end
    it 'returns the correct title' do
      book.title.should eql 'Ruby'
    end
    it 'returns the correct author' do
      book.author.should eql 'Shayan'
    end
    # it "Adding rentals" do
    # print person.type
    # book.add_rentals(person , date)
    # expect(book.rentals).to include(person)
    # end
  end
end
