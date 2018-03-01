require_relative '../../../gilded_rose'
require_relative '../../../lib/vault/backstage_pass'

describe Vault::BackstagePass do
  subject { described_class.new(item) }

  describe '#update_quality' do
    before(:each) do
      subject.update_quality
    end

    context 'when there are more than 10 days' do
      let(:item) { Item.new('Backstage passes to a TAFKAL80ETC concert', 20, 0) }
      it 'quality is increased by 1' do
        expect(item.quality).to eq 1
      end
    end

    context 'when there are 10 days or less' do
      let(:item) { Item.new('Backstage passes to a TAFKAL80ETC concert', 9, 0) }
      it 'quality is increased by 2' do
        expect(item.quality).to eq 2
      end
    end

    context 'when there are 5 days or less' do
      let(:item) { Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 0) }
      it 'quality is increased by 3' do
        expect(item.quality).to eq 3
      end
    end

    context 'after the concert ' do
      let(:item) { Item.new('Backstage passes to a TAFKAL80ETC concert', -1, 99) }
      it 'quality drops to 0' do
        expect(item.quality).to eq 0
      end
    end
  end
end
