require './book'

describe Book.new('2021-07-04', false, 'Santillan', 'bad') do
  it { is_expected.to have_attributes(publish_date: '2021-07-04') }
  it { is_expected.to have_attributes(archived: false) }
  it { is_expected.to have_attributes(publisher: 'Santillan') }
  it { is_expected.to have_attributes(cover_state: 'bad') }

  context 'Books is older than 10 years' do
    it 'should return true' do
      book = Book.new('2001-07-04', false, 'Santillan', 'good')
      book.move_to_archive
      expect(book.archived).to be true
    end
  end

  context "Books cover_state is bad" do
    it 'should return true' do
      book = Book.new('2021-07-04', false, 'Santillan', 'bad')
      book.move_to_archive
      expect(book.archived).to be true
    end
  end

  context "Books isn't older than 10 years and cover_state isn't bad" do
    it 'should return false' do
      book = Book.new('2021-07-04', false, 'Santillan', 'good')
      book.move_to_archive
      expect(book.archived).to be false
    end
  end
end