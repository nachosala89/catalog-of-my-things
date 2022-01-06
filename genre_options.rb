require_relative './genre'

class GenreOptions
  def initialize
    @genres = read_json
  end

  def list_all_genres
    puts 'There is no registered genres.' if @genres.empty?
    @genres.each { |genre| print "\n#{genre.name}" }
  end

  def read_json
    genres = []

    file = File.read('./genre.json')
    return [] if file.empty?

    JSON.parse(file).each do |data|
      genre = JSON.parse(data)
      genres.push(Genre.new(genre['name']))
    end
    genres
  end
end
