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
      return  drop_value if after_concert

      quality = quality_increase
      increase_quality(quality)
    end

    private

    def quality_increase
      case item.sell_in
      when 0..5
        3
      when 6..10
        2
      else
        1
      end
    end

    def drop_value
      item.quality = 0
    end

    def after_concert
      item.sell_in < 0
    end
  end
end
