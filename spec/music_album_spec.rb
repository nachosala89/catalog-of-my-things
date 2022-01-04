require_relative '../item'
require_relative '../music_album'

describe MusicAlbum do
  context 'Test if music_album is an instace of the correct classes' do
    music_album = MusicAlbum.new('1990-03-03', false, true)
    it 'check if music_album is an instace of MusicAlbum' do
      expect(music_album).to be_a MusicAlbum
    end
    it 'check if music_album is an instace of Item' do
      expect(music_album).to be_a Item
    end
  end

  context 'Tests for when music_album has 10 years or more and on_spotify is true' do
    music_album = MusicAlbum.new('1990-03-03', false, true)
    it 'test can_be_archived? method' do
      expect(music_album.can_be_archived?).to be true
    end
    it 'test move_to_archive method' do
      music_album.move_to_archive
      expect(music_album.archived).to be true
    end
  end

  context 'Tests for when music_album has 10 years or more and on_spotify is false' do
    music_album = MusicAlbum.new('1990-03-03', false, false)
    it 'test can_be_archived? method' do
      expect(music_album.can_be_archived?).to be false
    end
    it 'test move_to_archive method' do
      music_album.move_to_archive
      expect(music_album.archived).to be false
    end
  end

  context 'Tests for when music_album has less than 10 years' do
    music_album = MusicAlbum.new('2020-03-03', false, true)
    it 'test can_be_archived? method' do
      expect(music_album.can_be_archived?).to be false
    end
    it 'test move_to_archive method' do
      music_album.move_to_archive
      expect(music_album.archived).to be false
    end
  end
end
