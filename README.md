# Qenumerable

Allows you to query against collections using [Izzy's matches_all?](https://github.com/baweaver/izzy)

## Usage

Let's get ourselves a collection to use:
```ruby
class Object; include QEnumerable end

brandon = Person.new('brandon', 23, 'm')
john    = Person.new('john',    42, 'm')
jill    = Person.new('jill',    31, 'f')
alice   = Person.new('alice',   50, 'f')
zeke    = Person.new('zeke',    18, 'm')

people = [brandon, john, jill, alice, zeke]
```

### Select Where

Select all objects where params match:
```ruby
people.select_where name: /^j/
# => [john, jill]

people.select_where(
  age: [
    (20..35),
    -> a { a.odd? }
  ]
)
# => [brandon]
```

### Reject Where

Reject all objects where params match:
```ruby
people.reject_where name: /^j/
# => [brandon, alice, zeke]

people.reject_where(
  age: [
    (20..35),
    -> a { a.odd? }
  ]
)
# => [john, jill, alice, zeke]
```

### Find Where

Finds the first object where params match:
```ruby
people.find_where name: /^j/, gender: 'm'
# => john
```

## Installation

Add this line to your application's Gemfile:

    gem 'qenumerable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qenumerable

## Contributing

1. Fork it ( http://github.com/baweaver/qenumerable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
