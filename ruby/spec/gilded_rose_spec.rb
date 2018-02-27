require_relative '../gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end

    context 'Once the sell by date has passed, Quality degrades twice as fast' do
      it 'quality is degraded by 2' do
        items = [Item.new('foo', 0, 2)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end
    end

    context 'The Quality of an item is never negative' do
      it 'quality is still 0' do
        items = [Item.new('foo', 0, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end
    end

    context ' "Aged Brie" actually increases in Quality the older it gets' do
      it 'quality is 1' do
        items = [Item.new('Aged Brie', 1, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].name).to eq 'Aged Brie'
        expect(items[0].quality).to eq 1
      end

      context 'after the sell_in date the quality increases by 2' do
        it 'quality is 2' do
          items = [Item.new('Aged Brie', 0, 0)]
          GildedRose.new(items).update_quality
          expect(items[0].name).to eq 'Aged Brie'
          expect(items[0].quality).to eq 2
        end
      end
    end

    context 'The Quality of an item is never more than 50' do
      it 'quality is still 50' do
        items = [Item.new('Aged Brie', 1, 50)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 50
      end
    end

    context '"Sulfuras", being a legendary item, never has to be sold or decreases in Quality' do
      it 'does not change quality' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 1, 80)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 80
      end

      it 'does not change sell_in' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 1, 80)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq 1
      end
    end

    context '"Backstage passes", increases in Quality as its sell_in value approaches' do
      context 'Quality increases by 2 when there are 10 days or less' do
        it 'quality is 42' do
          items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 40)]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 42
        end
      end

      context 'Quality increases by 3 when there are 5 days or less' do
        it 'quality is 45' do
          items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 42)]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 45
        end
      end

      context 'Quality drops to 0 after the concert' do
        it 'quality is 0' do
          items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 42)]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 0
        end
      end
    end
  end
end
