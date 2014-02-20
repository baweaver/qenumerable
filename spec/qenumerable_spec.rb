require 'spec_helper'

class Object; include QEnumerable end

# As we're only querying against things, there's absolutely no sense in making
# objects in a let as they'll never mutate.

Person  = Struct.new(:name, :age, :gender)

brandon = Person.new('brandon', 23, 'm')
john    = Person.new('john',    42, 'm')
jill    = Person.new('jill',    31, 'f')
alice   = Person.new('alice',   50, 'f')
zeke    = Person.new('zeke',    18, 'm')

people = [brandon, john, jill, alice, zeke]

describe 'QEnumerable' do
  describe '#select_where' do 
    it 'returns people whose names start with j' do
      expect(people.select_where(name: /^j/)).to eq([john, jill])
    end

    it 'returns people whose ages are above 30' do
      expect(people.select_where(age: -> a { a > 30 })).to eq([john, jill, alice])
    end

    it 'returns people who are male' do
      expect(people.select_where(gender: 'm')).to eq([brandon, john, zeke])
    end
  end

  describe '#reject_where' do
    it 'returns people whose names do not start with j' do
      expect(people.reject_where(name: /^j/)).not_to eq([john, jill])
    end

    it 'returns people whose ages are not above 30' do
      expect(people.reject_where(age: -> a { a > 30 })).not_to eq([john, jill, alice])
    end

    it 'returns people who are not male' do
      expect(people.reject_where(gender: 'm')).not_to eq([brandon, john, zeke])
    end
  end

  describe '#find_where' do
    it 'returns the first person whose name starts with j' do
      expect(people.find_where(name: /^j/)).to eq(john)
    end

    it 'returns the first person whose age is above 30' do
      expect(people.find_where(age: -> a { a > 30 })).to eq(john)
    end

    it 'returns the first person who is male' do
      expect(people.find_where(gender: 'm')).to eq(brandon)
    end
  end
end