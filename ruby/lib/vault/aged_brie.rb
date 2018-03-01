require_relative './item_behavior'

module Vault
  #  "Aged Brie" actually increases in Quality the older it gets
  class AgedBrie < ItemBehavior
    def initialize(item)
      super(item)
    end

    def update_quality
      quality = item.sell_in < 0 ? 2 : 1
      increase_quality(quality)
    end
  end
end
