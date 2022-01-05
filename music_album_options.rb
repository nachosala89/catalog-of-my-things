require_relative './music_album'

class MusicAlbumOptions
  def initialize
    @music_albums = []
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
