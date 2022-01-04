require_relative '../item'
require_relative '../genre'

describe Genre do
  context 'Test if genre is an instace of the correct class' do
    genre = Genre.new('Test')
    it 'check if genre is an instace of Genre' do
      expect(genre).to be_a Genre
    end
  end

  context 'Test add_item method from Genre' do
    genre = Genre.new('Test')
    it 'items should be empty' do
      expect(genre.items).to be_empty
    end
    item = Item.new('1990-03-03', false)
    it "items shouldn't be empty" do
      genre.add_item(item)
      expect(genre.items).to_not be_empty
    end
    it 'items should have a genre attribute' do
      genre.add_item(item)
      expect(item.genre).to eq genre
    end
  end
end
