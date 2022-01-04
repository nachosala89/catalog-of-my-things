require './label'
require './item'

describe Label.new('New Item', 'red') do
  it { is_expected.to have_attributes(title: 'New Item') }
  it { is_expected.to have_attributes(color: 'red') }

  context 'Add an item to label' do
    label = Label.new('New Item', 'red')
    item = Item.new('2001-07-04', false)
    label.add_item(item)
    it 'label should include item' do
      expect(label.items.include?(item)).to be true
    end
    it 'item should have label as atribute' do
      expect(item.label).to eq label
    end
  end
end