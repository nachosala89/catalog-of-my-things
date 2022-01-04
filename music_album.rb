require_relative './item'

class MusicAlbum < Item 
  attr_accessor :on_spotify
  
  def initialize(publish_date, archived, on_spotify, id = Random.rand(1..1000))
    super(publish_date, archived, id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super.can_be_archived? && @on_spotify
  end
end