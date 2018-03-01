require_relative '../../gilded_rose'
require_relative '../../lib/factory'

describe Factory do
  describe '.instance' do
    subject { described_class.instance(item) }

    context 'when item is Aged Brie' do
      let(:item) { Item.new('Aged Brie', 5, 0) }
      it 'instance a AgedBrie Class' do
        expect(subject).to be_a Vault::AgedBrie
      end
    end

    context 'when item is Sulfuras, Hand of Ragnaros' do
      let(:item) { Item.new('Sulfuras, Hand of Ragnaros', 5, 80) }
      it 'instance a Sulfuras Class' do
        expect(subject).to be_a Vault::Sulfuras
      end
    end

    context 'when item is Backstage passes to a TAFKAL80ETC concert' do
      let(:item) { Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 10) }
      it 'instance a BackstagePass Class' do
        expect(subject).to be_a Vault::BackstagePass
      end
    end

    context 'when item is Conjured Mana Cake' do
      let(:item) { Item.new('Conjured Mana Cake', 5, 10) }
      it 'instance a Conjured Class' do
        expect(subject).to be_a Vault::Conjured
      end
    end

    context 'when item is Any Other' do
      let(:item) { Item.new('New Item', 5, 10) }
      it 'instance a ItemBehavior Class' do
        expect(subject).to be_a Vault::ItemBehavior
      end
    end
  end
end
