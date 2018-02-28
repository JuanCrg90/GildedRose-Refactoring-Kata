require_relative '../../../gilded_rose'
require_relative '../../../lib/vault/item_behavior'

describe Vault::ItemBehavior do
  subject { described_class.new(item) }

  describe '#decrease_quality' do
    context 'when the day end' do
      let(:item) { Item.new('new item', 10, 10) }

      it 'decrease by 1' do
        expect(subject.decrease_quality).to eq 9
      end

      context 'and quality is already 0' do
        let(:item) { Item.new('new item', 10, 0) }

        it 'returns 0' do
          expect(subject.decrease_quality).to eq 0
        end
      end

      context 'initial quality exceeds MAX_QUALITY' do
        let(:item) { Item.new('new item', 10, 99) }

        it 'returns MAX_QUALITY - 1' do
          expect(subject.decrease_quality).to eq 49
        end
      end
    end
  end

  describe '#decrease_sell_in' do
    let(:item) { Item.new('new item', 10, 10) }
    it 'decrease by 1' do
      expect(subject.decrease_sell_in).to eq 9
    end
  end

  describe '#perform' do
    let(:item) { Item.new('new item', 5, 10) }
    it 'updates quality and sell_in attributes' do
      subject.perform
      expect(item.sell_in).to eq 4
      expect(item.quality).to eq 9
    end
  end
end
