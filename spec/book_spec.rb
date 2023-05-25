require_relative '../classes/book'

describe "Book" do
    context "Create instance of Book class" do
        book = Book.new('Ruby', 'Shayan')
        it "should return instance of Book class" do
            expect(book).to be_instance_of(Book)
        end
        it "returns the correct title" do
            book.title.should eql "Ruby"
        end
        it "returns the correct author" do
            book.author.should eql "Shayan"
        end
    end
end
