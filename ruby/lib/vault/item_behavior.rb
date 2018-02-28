module Vault
  # General Item Update Rules
  class ItemBehavior
    MAX_QUALITY = 50

    def initialize(item)
      @item = item
      @item.quality = MAX_QUALITY if item.quality > MAX_QUALITY
    end

    def perform
      decrease_quality
      decrease_sell_in
    end

    def decrease_quality
      @item.quality -= 1 unless @item.quality.zero?
      @item.quality
    end

    def decrease_sell_in
      @item.sell_in -= 1
    end
  end
end
