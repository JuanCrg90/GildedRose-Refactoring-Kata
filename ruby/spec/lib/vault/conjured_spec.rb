require_relative '../../../gilded_rose'
require_relative '../../../lib/vault/conjured'

describe Vault::Conjured do
  subject { described_class.new(item) }

  describe '#update_quality' do
    before(:each) do
      subject.update_quality
    end

    context '"Conjured" items degrade in Quality twice as fast as normal items' do
      let(:item) { Item.new('Conjured Mana Cake', 3, 6) }
      it 'quality is is decreased by 2' do
        expect(item.quality).to eq 4
      end

      context 'after the sell limit day' do
        let(:item) { Item.new('Conjured Mana Cake', -1, 6) }
        it 'quality is is decreased by 4' do
          expect(item.quality).to eq 2
        end
      end
    end
  end
end
