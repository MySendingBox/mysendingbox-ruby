require "mysendingbox/resources/resource_base"

module Mysendingbox
  module Resources
    class Postcard < Mysendingbox::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "postcards"
      end

    end
  end
end
