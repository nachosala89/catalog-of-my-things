require_relative './genre'

class GenreOptions
  def initialize
    @genres = [Genre.new('Rock'), Genre.new('Hip-hop')]
  end

  def list_all_genres
    @genres.each { |genre| print "\n#{genre.name}" }
  end
end