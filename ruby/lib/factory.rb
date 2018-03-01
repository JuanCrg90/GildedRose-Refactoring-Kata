require_relative './vault/item_behavior'
require_relative './vault/sulfuras'
require_relative './vault/aged_brie'
require_relative './vault/backstage_pass'
require_relative './vault/conjured'

# Module to instanciate the itemBehavior of each item
module Factory
  ITEMS = {
    'Aged Brie' => Vault::AgedBrie,
    'Sulfuras, Hand of Ragnaros' => Vault::Sulfuras,
    'Backstage passes to a TAFKAL80ETC concert' => Vault::BackstagePass,
    'Conjured Mana Cake' => Vault::Conjured
  }

  ITEMS.default = Vault::ItemBehavior

  def self.instance(item)
    ITEMS[item.name].new(item)
  end
end
