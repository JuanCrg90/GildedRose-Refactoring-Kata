require_relative './item_behavior'

module Vault
  # "Backstage passes", increases in Quality as its SellIn value approaches;
  # Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
  # Quality drops to 0 after the concert
  class BackstagePass < ItemBehavior
    def initialize(item)
      super(item)
    end

    def update_quality
      increase_quality if item.sell_in <= 10
      increase_quality if item.sell_in <= 5
      increase_quality
      item.quality = 0 if item.sell_in < 0
    end
  end
end
