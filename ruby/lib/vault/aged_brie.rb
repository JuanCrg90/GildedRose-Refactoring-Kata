require_relative './item_behavior'

module Vault
  #  "Aged Brie" actually increases in Quality the older it gets
  class AgedBrie < ItemBehavior
    def initialize(item)
      super(item)
    end

    def update_quality
      increase_quality if item.sell_in < 0
      increase_quality
    end
  end
end
