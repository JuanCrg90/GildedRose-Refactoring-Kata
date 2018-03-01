require_relative './item_behavior'

module Vault
  # "Conjured" items degrade in Quality twice as fast as normal items
  class Conjured < ItemBehavior
    def initialize(item)
      super(item)
    end

    def update_quality
      decrease_quality(2)
    end
  end
end
