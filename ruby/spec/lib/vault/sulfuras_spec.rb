require_relative '../../../gilded_rose'
require_relative '../../../lib/vault/sulfuras'

describe Vault::Sulfuras do
  subject { described_class.new(item) }
  let(:item) { Item.new('Sulfuras, Hand of Ragnaros', 0, 80) }

  describe '#perform' do
    it 'quality and sell_in never changes' do
      subject.perform
      expect(item.sell_in).to eq 0
      expect(item.quality).to eq 80
    end
  end

  describe '#decrease_quality' do
    it 'quality never changes' do
      subject.decrease_quality
      expect(item.quality).to eq 80
    end
  end

  describe '#decrease_sell_in' do
    it 'sell_in never changes' do
      expect(item.sell_in).to eq 0
    end
  end
end
