require_relative './item_behavior'

module Vault
  # Legendary item Sulfuras, Hand of Ragnaros
  class Sulfuras < ItemBehavior
    MAX_QUALITY = 80

    def initialize(item)
      super(item)
      verify_max_quality
    end

    def perform; end

    private

    def verify_max_quality
      item.quality = MAX_QUALITY if item.quality != MAX_QUALITY
    end
  end
end
