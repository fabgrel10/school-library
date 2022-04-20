require_relative '../app/lib/book'

describe Book do
  before(:each) do
    @book = Book.new('The Hobbit', 'J.R.R. Tolkien')
  end

  context 'when testing the Book class' do
    it 'should be an instance of the Book class' do
      expect(@book).to be_an_instance_of Book
    end

    it 'should have a title called "The Hobbit"' do
      expect(@book.title).to eq 'The Hobbit'
    end

    it 'should have a title called "J.R.R. Tolkien"' do
      expect(@book.author).to eq 'J.R.R. Tolkien'
    end

    it 'should have a method called "add_rental"' do
      expect(@book.methods.include?(:add_rental)).to eq true
    end

    it 'should have a method called "to_json"' do
      expect(@book.methods.include?(:to_json)).to eq true
    end

    it 'should throw an error if not arguments given' do
      expect { Book.new }.to raise_error(ArgumentError)
    end

    it 'should throw an error if more than two arguments given' do
      expect { Book.new('The Hobbit', 'J.R.R. Tolkien', 'The Lord of the Rings') }.to raise_error(ArgumentError)
    end
  end
end
