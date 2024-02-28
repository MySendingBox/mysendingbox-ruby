# mysendingbox-ruby

[![Gem Version](https://badge.fury.io/rb/mysendingbox.svg)](https://badge.fury.io/rb/mysendingbox)
[![Dependency Status](https://gemnasium.com/badges/github.com/mysendingbox/mysendingbox-ruby.svg)](https://gemnasium.com/github.com/mysendingbox/mysendingbox-ruby)

Ruby wrapper for the [Mysendingbox.fr](https://www.mysendingbox.fr) API. See the full Mysendingbox.fr [API Documentation](https://docs.mysendingbox.fr/?ruby#). For best results, be sure that you're using the latest version of the Mysendingbox API and the latest version of the ruby wrapper. This gem gives you an ActiveRecord-style syntax to use the Mysendingbox.fr API.

Supports Ruby 2.0.0 and greater.

## Table of Contents

- [Getting Started](#getting-started)
  - [Registration](#registration)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Letters](#letters)
  - [Accounts](#accounts)
  - [Invoices](#invoices)
- [Examples](#examples)

## Getting Started

Here's a general overview of the Mysendingbox services available, click through to read more.

Please read through the official [API Documentation](https://docs.mysendingbox.fr/?ruby#) to get a complete sense of what to expect from each endpoint.

### Registration

First, you will need to first create an account at [Mysendingbox.fr](https://www.mysendingbox.fr/signup) and obtain your Test and Live API Keys.

Once you have created an account, you can access your API Keys from the [API Keys Panel](https://www.mysendingbox.fr/app/dashboard/keys).

### Installation

Add this line to your application's `Gemfile`:

    gem 'mysendingbox'

And then execute:

    $ bundle

Or manually install it yourself:

    $ gem install mysendingbox

### Usage

The library uses an ActiveRecord-style interface.

For optional parameters and other details, refer to the docs [here](https://docs.mysendingbox.fr/?ruby#).

#### Initialization and Configuration

```ruby
# To initialize a Mysendingbox object
mysendingbox = Mysendingbox::Client.new(api_key: "your-api-key")
```

### Letters

#### Create a new letter

```ruby
# send the letter
require 'mysendingbox'

# initialize Mysendingbox object
mysendingbox = Mysendingbox::Client.new(api_key: '<PUT_YOU_API_KEY_HERE>')

puts mysendingbox.letters.create(
  description: "Test letter from the Ruby Wrapper",
  to: {
    name: 'Erlich',
    address_line1: '30 rue de rivoli',
    address_line2: '',
    address_city: 'Paris',
    address_country: 'France',
    address_postalcode: '75004'
  },
  source_file: '<html>Hello {{name}}</html>',
  source_file_type: 'html',
  postage_type: 'prioritaire',
  variables: { name: 'Erlich'},
  color: 'color'
)
```

#### Create a new electronic letter

```ruby
# send the letter
require 'mysendingbox'

# initialize Mysendingbox object
mysendingbox = Mysendingbox::Client.new(api_key: '<PUT_YOU_API_KEY_HERE>')

puts mysendingbox.letters.createElectronic(
    description: "Test electronic letter from the Ruby Wrapper",
    to: {
        email: 'erlich.dumas@example.com',
        first_name: 'Erlich',
        last_name: 'Dumas',
        status: 'individual'
    },
    source_file: '<html>Hello {{name}}</html>',
    source_file_type: 'html',
    postage_type: 'lre',
    variables: {
    	name: 'Erlich'
    }
)
```

#### List all letters

```ruby
require 'mysendingbox'

mysendingbox = Mysendingbox::Client.new(api_key: 'test_12345678901234567890')

puts mysendingbox.letters.list()
```

#### Get a specific letter

```ruby
require 'mysendingbox'

mysendingbox = Mysendingbox::Client.new(api_key: 'test_12345678901234567890')

puts mysendingbox.letters.find('LETTER_ID')
```

#### Get the price of a letter

```ruby
require 'mysendingbox'

mysendingbox = Mysendingbox::Client.new(api_key: 'test_12345678901234567890')

puts mysendingbox.letter_price.get(color: 'bw', postage_type: 'prioritaire', postage_speed: 'D1', page_count: 1)
```

### Accounts

#### Create a new account for the company

```ruby
require 'mysendingbox'

# initialize Mysendingbox object
mysendingbox = Mysendingbox::Client.new(api_key: 'test_12345678901234567890')

puts mysendingbox.accounts.create(
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
```

### Update the account company email

```ruby
require 'mysendingbox'

# initialize Mysendingbox object
mysendingbox = Mysendingbox::Client.new(api_key: 'test_12345678901234567890')

mysendingbox.accounts.updateEmail('ACCOUNT_COMPANY_ID', "msb.partner.new@example.com")
```

### Invoices

#### List all invoices for a company

```ruby
require 'mysendingbox'

mysendingbox = Mysendingbox::Client.new(api_key: 'test_12345678901234567890')

puts mysendingbox.invoices.list()
```

#### Get a specific invoice

```ruby
require 'mysendingbox'

mysendingbox = Mysendingbox::Client.new(api_key: 'test_12345678901234567890')

puts mysendingbox.invoices.find('INVOICE_ID')
```

#### Caution: Pass zero-prefixed postal codes as strings

When using postal codes with zero-prefixes, always quote them. For example when specifying `02125`, pass it as a string `"02125"`, instead of an integer.

The Ruby interpreter assumes it's not of base-10 and tries to convert it to base-10 number. So that might result in an entirely different postal code than intended.

#### Accessing Response Headers

You can access response headers via a hidden `headers` method on the response hash.

```ruby
addresses = mysendingbox.addresses.list

addresses._response.headers[:content_type]
# => "application/json"
```

## Examples

We've provided various examples for you to try out [here](https://github.com/mysendingbox/mysendingbox-ruby/tree/master/examples).

There are simple scripts to demonstrate how to create all letters with the Mysendingbox API Ruby wrapper.

=======================

Copyright &copy; 2017 Mysendingbox.fr

Released under the MIT License, which can be found in the repository in `LICENSE.txt`.
