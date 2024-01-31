require "mysendingbox/resources/resource_base"

module Mysendingbox
  module Resources
    class Letter < Mysendingbox::Resources::ResourceBase

        def initialize(config)
            super(config)
            @endpoint = "letters"
        end

        def createElectronic(options={}, headers={})
            submit :post, resource_url("electronic"), options, headers
        end
    end
  end
end
