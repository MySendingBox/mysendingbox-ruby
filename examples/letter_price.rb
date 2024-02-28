$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'mysendingbox'

mysendingbox = Mysendingbox::Client.new(api_key: '<PUT_YOU_API_KEY_HERE>')

puts mysendingbox.letter_price.get(color: 'bw', postage_type: 'prioritaire', postage_speed: 'D1', page_count: 1)