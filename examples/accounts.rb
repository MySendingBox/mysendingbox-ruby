$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'mysendingbox'

# initialize Mysendingbox object
mysendingbox = Mysendingbox::Client.new(api_key: '<PUT_YOU_API_KEY_HERE>')

begin
    # create a new company account
    create_response = mysendingbox.accounts.create(
      email: "msb.partner@example.com",
      name: "Erlich Bachman",
      phone: "+33104050607",
      company_name: "MSB Partner from Ruby Wrapper",
      address_line1: '30 rue de rivoli',
      address_line2: '',
      address_city: 'Paris',
      address_country: 'France',
      address_postalcode: '75004'
    )
    puts "The Mysendingbox API Account responded : #{create_response}"

    # update email of a company account
    mysendingbox.accounts.updateEmail(create_response['company']['_id'], "msb.partner.new@example.com")

rescue Mysendingbox::MysendingboxError => ex
    puts "Error from API : #{ex}"
end
