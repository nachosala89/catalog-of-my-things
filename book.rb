require './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, archived, publisher, cover_state, id = Random.rand(1..1000))
    super(publish_date, archived, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super.can_be_archived? || @cover_state == 'bad'
  end
end
