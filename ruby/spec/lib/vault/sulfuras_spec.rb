require_relative '../../../gilded_rose'
require_relative '../../../lib/vault/sulfuras'

describe Vault::Sulfuras do
  subject { described_class.new(item) }
  let(:item) { Item.new('Sulfuras, Hand of Ragnaros', 0, 80) }

  describe '#perform' do
    before(:each) { subject.perform }

    it 'quality never changes' do
      expect(item.quality).to eq 80
    end

    it 'sell_in never changes' do
      expect(item.sell_in).to eq 0
    end
  end
end
