require_relative './item_behavior'

module Vault
  # Legendary item Sulfuras, Hand of Ragnaros
  class Sulfuras < ItemBehavior
    MAX_QUALITY = 80

    def initialize(item)
      @item = item
      @item.quality = MAX_QUALITY if item.quality != MAX_QUALITY
    end

    def decrease_quality; end

    def decrease_sell_in; end
  end
end
