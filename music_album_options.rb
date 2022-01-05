require_relative './music_album'
require 'json'

class MusicAlbumOptions
  def initialize
    @music_albums = read_json
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

  def serialize
    serialize_data = []
    @music_albums.each do |music_album|
      serialize_data.push({ 'publish_date' => music_album.publish_date, 'archived' => music_album.archived,
                            'on_spotify' => music_album.on_spotify }.to_json)
    end
    serialize_data
  end

  def read_json
    music_albums = []

    file = File.read('./music_album.json')
    return [] if file.empty?

    JSON.parse(file).each do |data|
      music_album = JSON.parse(data)
      music_albums.push(MusicAlbum.new(music_album['publish_date'], music_album['archived'], music_album['on_spotify']))
    end
    music_albums
  end

  def save_json
    File.write('./music_album.json', serialize)
  end
end

# test[:publish_date]
