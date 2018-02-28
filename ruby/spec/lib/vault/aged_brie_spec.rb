require_relative '../../../gilded_rose'
require_relative '../../../lib/vault/aged_brie'

describe Vault::AgedBrie do
  subject { described_class.new(item) }

  describe '#update_quality' do
    before(:each) do
      subject.update_quality
    end

    context 'Aged Brie" actually increases in Quality the older it gets' do
      let(:item) { Item.new('Aged Brie', 5, 0) }
      it 'quality is increased by 1' do
        expect(item.quality).to eq 1
      end

      context 'after the sell in date the quality is increased by 2' do
        let(:item) { Item.new('Aged Brie', -1, 1) }

        it 'quality is increased by 1' do
          expect(item.quality).to eq 3
        end
      end
    end
  end
end
