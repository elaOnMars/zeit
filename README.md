# Zeit

This gem is a ruby 1.9+ client for the Zeit.de API (http://developer.zeit.de/).

The german newspaper "Die Zeit" recently announced a so called "content
API" to access their large collection of printed and online articles of
the past years. To access their API you'll have to create an api-key which allows you to
make 10.000 requests per day, free of charge for non-commercial usage.

See http://developer.zeit.de/quickstart/

## Continous Integration / Tests

[![Build Status](https://secure.travis-ci.org/rmoriz/zeit.png?branch=master)](https://travis-ci.org/rmoriz/zeit)

## Installation

Add this line to your application's Gemfile:

    gem 'zeit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zeit

## Usage


    require 'zeit'
    require 'json'
    
    zeit = Zeit::API.new :api_key => 'aaabbccccdddeeeeeeffgggg'
    
    # author
    result = zeit.author.find '*Schmidt*'
    result.body['matches'].inspect

    # content
    result = zeit.content.find '*Software*', :limit => 200, :offset => 100
    result.body['matches'].inspect
    
    # department
    result = zeit.department.find '*internet*'
    ...

    # keyword
    result = zeit.keyword.find '*internet*'
    ...

    # product
    result = zeit.product.find '*ZEIT*'

    # series
    result = zeit.series.find 'Die*'
   
    # client
    result = zeit.client.get
    
    result.body
    # => {"reset"=>1353785293,
    #  "name"=>"my name",
    #  "quota"=>10000,
    #  "tier"=>"free",
    #  "requests"=>192,
    #  "api_key"=>"aaaaaaaabbbbbbbbbbcccc",
    #  "email"=>"email@example.com"}


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License (MIT)

see LICENSE.txt

## Copyright

2012 Roland Moriz, https://roland.io/
