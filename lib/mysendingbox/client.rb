# frozen_string_literal: true

require 'mysendingbox/resources/letter'
require 'mysendingbox/resources/letter_price'
require 'mysendingbox/resources/postcard'
require "mysendingbox/resources/user"
require "mysendingbox/resources/account"
require "mysendingbox/resources/invoice"

module Mysendingbox
  class Client
    attr_reader :config

    def initialize(config = nil)
      if config.nil? || config[:api_key].nil?
        raise ArgumentError, ':api_key is a required argument to initialize Mysendingbox'
      end

      @config = config
    end

    def letters
      Mysendingbox::Resources::Letter.new(config)
    end

    def letter_price
      Mysendingbox::Resources::LetterPrice.new(config)
    end

    def postcards
      Mysendingbox::Resources::Postcard.new(config)
    end

    def users
      Mysendingbox::Resources::User.new(config)
    end

    def accounts
      Mysendingbox::Resources::Account.new(config)
    end

    def invoices
      Mysendingbox::Resources::Invoice.new(config)
    end
  end
end
