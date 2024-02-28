require "mysendingbox/resources/resource_base"

module Mysendingbox
  module Resources
    class Account < Mysendingbox::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "accounts"
      end

      def updateEmail(resource_id, email, headers={})
          submit :put, resource_url(resource_id), {"email" => email}, headers
      end

      def list(options={})
        raise MysendingboxError.new("Invalid REST operation : GET /accounts", "404", nil)
      end

      def find(resource_id)
        raise MysendingboxError.new("Invalid REST operation : GET /accounts/:account_id", "404", nil)
      end

      def destroy(resource_id)
        raise MysendingboxError.new("Invalid REST operation : DELETE /accounts/:account_id", "404", nil)
      end

    end
  end
end
