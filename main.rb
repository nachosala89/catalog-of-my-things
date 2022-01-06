#!/usr/bin/env ruby

require_relative './music_album_options'
require_relative './genre_options'
require_relative './book_options'
require_relative './label_options'

class Main
  def initialize
    @music_album_options = MusicAlbumOptions.new
    @genre_options = GenreOptions.new
    @book_options = BookOptions.new
    @label_options = LabelOptions.new
  end

  def present_options
    puts "\n\nPlease enter a number to select one of the following options:"
    puts '1 - List all books'
    puts '2 - List all labels'
    puts '3 - Add a book'
    puts '4 - List all music albums'
    puts '5 - List all genres'
    puts '6 - Add a music album'
    puts '7 - Exit'
    gets.chomp.to_i
  end

  def router(option)
    case option
    when 1
      @book_options.list_books
    when 2
      @label_options.list_labels
    when 3
      @book_options.add_book
      @book_options.save_json
    when 4
      @music_album_options.list_all_music_albums
    when 5
      @genre_options.list_all_genres
    when 6
      @music_album_options.add_music_album
      @music_album_options.save_json
    end
  end
end

def main
  main_ui = Main.new
  puts 'Welcome to Catalog of my Things!'
  puts ''
  loop do
    option = main_ui.present_options
    break if option == 7

    main_ui.router(option)
  end
end

main
