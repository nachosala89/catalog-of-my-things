require_relative './label'

class LabelOptions
  attr_accessor :labels

  def initialize
    @labels = read_json
  end

  def list_labels
    puts 'There is no registered label.' if @labels.empty?
    @labels.each do |label|
      puts "ID: #{label.id}, title: #{label.title}, color: #{label.color}"
    end
  end

  def serialize
    serialize_data = []
    @labels.each do |label|
      serialize_data.push({ 'title' => label.title, 'color' => label.color }.to_json)
    end
    serialize_data
  end

  def read_json
    labels = []

    file = File.read('./labels.json')
    return [] if file.empty?

    JSON.parse(file).each do |data|
      label = JSON.parse(data)
      labels.push(Label.new(label['title'], label['color']))
    end
    labels
  end

  def save_json
    File.write('./labels.json', serialize)
  end
end
