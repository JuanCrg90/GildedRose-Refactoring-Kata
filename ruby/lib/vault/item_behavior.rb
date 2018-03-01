module Vault
  # General Item Update Rules
  class ItemBehavior
    MAX_QUALITY = 50
    MIN_QUALITY = 0

    def initialize(item)
      @item = item
      verify_max_quality
      verify_min_quality
    end

    def perform
      update_quality
      decrease_sell_in
    end

    def update_quality
      decrease_quality
    end

    def decrease_sell_in
      @item.sell_in -= 1
    end

    protected

    attr_reader :item

    def verify_max_quality
      item.quality = MAX_QUALITY if item.quality > MAX_QUALITY
    end

    def verify_min_quality
      item.quality = MIN_QUALITY if item.quality < MIN_QUALITY
    end

    def decrease_quality
      @item.quality -= 1 unless @item.quality.zero?
      @item.quality
    end

    def increase_quality
      @item.quality += 1 if @item.quality < MAX_QUALITY
      @item.quality
    end
  end
end
