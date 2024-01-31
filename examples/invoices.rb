$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'mysendingbox'

# initialize Mysendingbox object
mysendingbox = Mysendingbox::Client.new(api_key: '<PUT_YOU_API_KEY_HERE>')

begin
    # get list of invoices
    list_response = mysendingbox.invoices.list(
        status: "paid",
        date_start: "2020-01-01"
    )
    puts "The Mysendingbox API Invoices responded : #{list_response}"

    # get single invoice by API
    find_response = mysendingbox.invoices.find(list_response['invoices'][0]['_id'])
    puts "The Mysendingbox API Invoice responded : #{find_response}"

rescue Mysendingbox::MysendingboxError => ex
    puts "Error from API : #{ex}"
end
