# Estratto

[![Gem Version](https://badge.fury.io/rb/estratto.svg)](https://badge.fury.io/rb/estratto)
[![Build Status](https://travis-ci.com/Rynaro/estratto.svg?branch=master)](https://travis-ci.com/Rynaro/estratto)
[![Coverage Status](https://coveralls.io/repos/github/Rynaro/estratto/badge.svg?branch=master)](https://coveralls.io/github/Rynaro/estratto?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/46532b90e850401fce72/maintainability)](https://codeclimate.com/github/Rynaro/estratto/maintainability)

> Estratto is a easy to handle parser based on YAML templating engine. Creating a easy interface for developers, and non developers to extract data from fixed width files

## Motivation

In various scenarios the data processment is a crucial step of a integration with partner systems, or data storage. But the task to create parsing and import data from these text format is boring, and causing code duplication in every code project.
This project borns to help developers to reduce the time spent in this task, or creating a total delegation scenario to other team responsabilities.

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

Fixed width files is sometimes ~always~ painful for human reading, and the layout manual comes in a very useful pdf or spreasheet format.

Here, we'll try to made things fun again, or less painful. :joy:

The base layout for YAML file is:

```yaml
layout:
  name: 'jojo stand users'
  multi-register: true
  prefix: 0..1
  registers:
    - register: '01'
      fields:
        - name: name
          range: 2..45
          type: String
        - name: stand
          range: 46..75
          type: String
```

And the output will be a array of hashes reflection of your columns:

```ruby
[
    {
        name: 'Jotaro Kujo',
        stand: 'Star Platinum'
    },
    {
        name: 'Giorno Giovanna',
        stand: 'Golden Experience Requiem'
    },
    {
        name: 'Jobin Higashikata',
        stand: 'Speed King'
    }
]
```

The structure follows the strict directive
```yaml
layout:
    (base configuration)
    registers:
        (layouts)
```

Actually **Estratto** supports these types of fixed width  layouts:

- Batch prefix based registers
- Mono layout based registers _(development)_


### UTF-8 Conversion

Estratto makes use of [CharlockHolmes](https://github.com/brianmario/charlock_holmes) gem to detect the file content encoding and convert it to UTF-8.
This approach prevents invalid characters from being present in the output.

CharlockHolmes uses [ICU](http://site.icu-project.org) for charset detection. And you need libicu in your environment.

#### Linux

RedHat, CentOS, Fedora:

`yum install libicu-devel`

Debian based:

`apt-get install libicu-dev`

#### Homebrew

`brew install icu4c`

### Type Coercion

**Estratto** supports type coercion, with some perks called _formats_, on layout file.

Data type supported to handle in **Estratto**

- String
- Integer
- Float
- DateTime
- Date

Default data type in fields is `String`, if no one type is setted in field list register.

Registers fields list always respect this base structure:

```yaml
  fields:
    - name: name
      range: 2..12
      type: String
      formats:
        strip: true
```

`name` is your field identification of field, this value will be your symbol in hashed parsed data

`range` is where data is inside the file. (First index is 0)

`type` data type to be coerced

`formats` receives a specific configuration for data type. Here we can format Strings, and adjust precision for unformatted Float data.

### Formats

Formats is the resource for deal with some "surprises" that this type of file can provide to us. Like, super large string fields that has a huge blank space, DateTime with suspicious formatting, or Float without any decimal point, but the manual description shows _"Decimal(15, 2)"_

#### String

##### strip

Works like common ruby String strip method

```yaml
strip: true
```

Output example:

```ruby
#raw_data
'Hierophant Green         '
# with strip clause
'Hierophant Green'
```

#### Integer

Simple integer values converter. Useful in cases that you need to deal with ids.

Actually we don't have any formats for Integer. :)

```ruby
#raw_data
'000123'
# coerced
123
#raw_data
'123'
# coerced
123
#raw_data
'a'
# coerced
0
```

#### Float

Float is one of most important types here. The fixed width files always respect the _non logical_ format to deliver information.

##### precision

```yaml
precision: <integer>
```

Examples:

```yaml
precision: 2
```

```ruby
#raw data
'12345'
# with precision
123.45
```

```yaml
precision: 3
```

```ruby
#raw data
'12345'
# with precision
12.345
```

##### comma_format

```yaml
comma_format: <boolean>
```

Examples:

```yaml
comma_format: true
```

```ruby
#raw data
'123,45'
# with comma formats
123.45
```


#### DateTime and Date

The `DateTime` and `Date` has the same formats attributes. But the difference, one shows DateTime format, and other always respect Date output


##### format

```yaml
format: <ruby strptime format pattern>
```

Examples

```yaml
format: '%Y%m%d'
```

```ruby
#raw data
'20180101'
# with comma formats
#<DateTime: 2018-01-01T00:00:00+00:00 ...>
```

```yaml
format: '%d/%m/%Y'
```

```ruby
#raw data
'01/01/2018'
# with comma formats
#<DateTime: 2018-01-01T00:00:00+00:00 ...>
```

## General Formats Properties

Sometimes we need to deal with some general patterns on third-party files. Like lacks of informations, or some unexpected exported data pattern.

#### Allow Empty

The `allow_empty?` property was designed to deal with randomic unexpected data exported from third-party. Like `DateTime` field that has ``%Y%m%d` format, but in third-party file, some lines cames with `        `, or `00000000`.

The common return when `allow_empty?` was marked on field, is `nil`.

##### Example

```yaml
  fields:
    - name: birthdate
      range: 2..10
      type: DateTime
      formats:
        allow_empty?: true
        format: '%d/%m/%Y'
```

## Tests

Simple `rake spec`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Rynaro/estratto.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
