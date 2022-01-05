require_relative './book'

class BookOptions
  attr_accessor :books

  def initialize
    @books = []
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
end
