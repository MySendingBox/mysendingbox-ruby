$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'mysendingbox'

mysendingbox = Mysendingbox::Client.new(api_key: '<PUT_YOU_API_KEY_HERE>')

puts mysendingbox.users.create_from_api(email: 'email@example.com', name: 'Example')
