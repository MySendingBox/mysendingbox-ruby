require "mysendingbox/resources/resource_base"

module Mysendingbox
  module Resources
    class Invoice < Mysendingbox::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "invoices"
      end

      def create(options={}, headers={})
        raise MysendingboxError.new("Invalid REST operation : POST /invoices", "404", nil)
      end

      def destroy(resource_id)
        raise MysendingboxError.new("Invalid REST operation : DELETE /accounts/:invoice_id", "404", nil)
      end

    end
  end
end
