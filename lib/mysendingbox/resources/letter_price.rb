require "mysendingbox/resources/resource_base"

module Mysendingbox
  module Resources
    class LetterPrice < Mysendingbox::Resources::ResourceBase
      def initialize(config)
        super(config)
        @endpoint = "price/letter"
      end

      alias get list
    end
  end
end
