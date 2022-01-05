require_relative './label'

class LabelOptions
  attr_accessor :books

  def initialize
    @labels = [Label.new('New', 'blue')]
  end

  def list_labels
    puts 'There is no registered label.' if @labels.empty?
    @labels.each do |label|
      puts "ID: #{label.id}, title: #{label.title}, color: #{label.color}"
    end
  end
end