require_relative './item_behavior'

module Vault
  # "Conjured" items degrade in Quality twice as fast as normal items
  class Conjured < ItemBehavior
    def initialize(item)
      super(item)
    end

    def update_quality
      quality = item.sell_in < 0 ? 4 : 2
      decrease_quality(quality)
    end
  end
end
