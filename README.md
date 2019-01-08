# Estratto

[![Gem Version](https://badge.fury.io/rb/estratto.svg)](https://badge.fury.io/rb/estratto)
[![Build Status](https://travis-ci.com/Rynaro/estratto.svg?branch=master)](https://travis-ci.com/Rynaro/estratto)
[![Coverage Status](https://coveralls.io/repos/github/Rynaro/estratto/badge.svg?branch=master)](https://coveralls.io/github/Rynaro/estratto?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/46532b90e850401fce72/maintainability)](https://codeclimate.com/github/Rynaro/estratto/maintainability)

> Estratto is a easy to handle parser based on YAML templating engine. Creating a easy interface for developers, and non developers to extract data from fixed width files

## Motivation

In various scenarios the data processment is a crucial step of a integration with partner systems, or data storage. But the task to create parsing and import data from these text format is boring, and causing code duplication in every code project.
This project borns to help developers to reduce their time spent in this task, or creating a total delegation scenario to other team responsabilities.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'estratto'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install estratto

## Usage

**Estratto** works with simple input of _data to parse file_ and a _yaml layout equivalent_.

Example of a default call for parsing:

```ruby
Estratto::Document.process(file: 'path/to/data.txt', layout: 'path/to/layout.yml')
```

### Layout specifications

TODO: Comming soon

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Rynaro/estratto.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
