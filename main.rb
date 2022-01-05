#!/usr/bin/env ruby

require_relative './music_album'
require_relative './genre'

class MusicAlbumOptions
  def initialize
    @music_albums = [MusicAlbum.new('2020-12-12', true, true)]
  end

  def add_music_album
    puts 'Publish date: '
    publish_date = gets.chomp
    puts 'Is archived? true[1] false[any other key]'
    archived = gets.chomp == '1'
    puts 'Is on Spotify? true[1] false[any other key]'
    on_spotify = gets.chomp == '1'

    music_album = MusicAlbum.new(publish_date, archived, on_spotify)
    @music_albums.push(music_album)
  end

  def list_all_music_albums
    @music_albums.each do |music_album|
      print "\n Publish: #{music_album.publish_date}"
      print " Archived: #{music_album.archived}"
      print " On Spotify: #{music_album.on_spotify}"
    end
  end
end

class GenreOptions
  def initialize
    @genres = [Genre.new('Rock'), Genre.new('Hip-hop')]
  end

  def list_all_genres
    @genres.each { |genre| print "\n#{genre.name}" }
  end
end

class Main
  def present_options
    music_album_options = MusicAlbumOptions.new
    genre = GenreOptions.new
    loop do
      puts "\n\nPlease enter a number to select one of the following options:"
      puts '4 - List all music albums'
      puts '5 - List all genres'
      puts '6 - Add a music album'
      puts 'Any other key - Exit'

      case gets.chomp.to_i
      when 4
        music_album_options.list_all_music_albums
      when 5
        genre.list_all_genres
      when 6
        music_album_options.add_music_album
      else
        puts 'Goodbye'
        break
      end
    end
  end
end

def main
  main_ui = Main.new
  puts 'Welcome to Catalog of my Things!'
  puts ''
  main_ui.present_options
end

main
