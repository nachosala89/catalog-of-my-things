require 'date'

class Item
  attr_accessor :publish_date
  attr_reader :label, :archived

  def initialize(publish_date, archived, id = Random.rand(1..1000))
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    @archived = can_be_archived? if can_be_archived?
  end

  def label=(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end
end
