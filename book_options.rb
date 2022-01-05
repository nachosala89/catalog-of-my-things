require_relative './book'

class BookOptions
  attr_accessor :books

  def initialize
    @books = read_json
  end

  def list_books
    puts 'There is no registered book.' if @books.empty?
    @books.each do |book|
      puts "ID: #{book.id}, publish date: #{book.publish_date}, publisher: #{book.publisher},
      cover state: #{book.cover_state} "
    end
  end

  def add_book
    puts 'To add a book, enter the following data:'
    puts 'Publish date: '
    publish_date = gets.chomp
    puts 'Is archived? [1] Yes, [2] No'
    archived = gets.chomp
    puts 'Publisher: '
    publisher = gets.chomp
    puts 'Cover state: '
    cover_state = gets.chomp

    book = Book.new(publish_date, archived, publisher, cover_state)
    @books.push(book)
  end

  def serialize
    serialize_data = []
    @books.each do |book|
      serialize_data.push({ 'publish_date' => book.publish_date, 'archived' => book.archived,
                            'publisher' => book.publisher, 'cover_state' => book.cover_state }.to_json)
    end
    serialize_data
  end

  def read_json
    books = []

    file = File.read('./books.json')
    return [] if file.empty?

    JSON.parse(file).each do |data|
      book = JSON.parse(data)
      books.push(Book.new(book['publish_date'], book['archived'], book['publisher'], book['cover_state']))
    end
    books
  end

  def save_json
    File.write('./books.json', serialize)
  end
end
