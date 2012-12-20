Romaniac
========

* Repository: [https://github.com/kyrylo/romaniac/][repo]

Description
-----------

Romaniac turns you into a Roman numerals maniac. Blimey, not really… But! At
at least you will be able to operate on some numbers.

Installation
------------

    gem install romaniac --pre

Synopsis
--------

Basic example.

```ruby
require 'romaniac'

ten = Roman(10) #=> X
twelve = Roman(12) #=> XII
puts ten.to_i #=> 10
```

Arthmetic operations.

```ruby
# Addition.
twenty = Roman(20) #=> XX
five = Roman(5) #=> V
puts twenty + five #=> XXV

# Subtraction.
twenty = Roman(20)
five = Roman(5)
puts twenty - five #=> XV

# Division.
twenty = Roman(20)
five = Roman(5)
puts twenty / five #=> IV

# Multiplication.
twenty = Roman(20)
five = Roman(5)
puts twenty * five #=> C
```

If you are brave enough, you can use monkey-patches.

```ruby
require 'romaniac/ext/all'

10.to_roman #=> X

(1..3).each.with_roman_index { |i| puts i }
#=> I
#=> II
#=> III
```

If you really want some fun, use Ruby constants as Roman numerals.

```ruby
require 'romaniac/const'

# Use strings or arabic numbers as an argument.
Roman.from_str('II') #=> 2
puts II #=> 2
Roman.from_str('3') #=> 3
puts III #=> 3
Roman.from_str('wqdwqd') #=> TypeError: can't convert gibberish into Roman

Roman.from_int(100) #=> C
puts C #=> 1
Roman.from_int(9994000) #=> RangeError: integer is too big to convert into Roman
Roman.from_int(0) #=> RangeError: zero can't be converted into Roman
Roman.from_int(-124) #=> RangeError: integer is too small to convert into Roman
Roman.from_int('V') #=> TypeError: can't convert String into Roman

# If you don't care about the type of an argument, use `init` method. It's much
# more loose than `from_*` ones.
Roman.init('I') #=> 1
Roman.init(12) #=> XII
Roman.init('100') #=> C
puts I, XII, C #=> 1, 12, 100

Roman.init('9912333') #=> ArgumentError: invalid argument `9912333'
Roman.init(-123) #=> ArgumentError: invalid argument `-123'
```

Unicode support. Note, if you plan to use it, you must also use a Unicode
compatible font.

```ruby
# coding: utf-8
require 'romaniac/unicode'
```

Extended numbers.

```ruby
require 'romaniac/extended'
```

Pseudo real world example.

```ruby
# my_school_schedule.rb
require 'romaniac/ext'

puts 'TUESDAY', '-------'
{
  '08:30' => '09:15',
  '09:20' => '10:05',
  '10:15' => '11:00',
  '11:10' => '12:55',
  '13:15' => '14:00',
  '14:10' => '14:55',
  '15:10' => '15:55'
}.each.with_roman_index do |t_begin, t_end, index|
  printf("%4s %5s - %5s\n", index, t_begin, t_end)
end

# Will print out:

TUESDAY
-------
   I 08:30 - 09:15
  II 09:20 - 10:05
 III 10:15 - 11:00
  IV 11:10 - 12:55
   V 13:15 - 14:00
  VI 14:10 - 14:55
 VII 15:10 - 15:55
```

Limitations
-----------

* You can use only positive numbers.
* The maximum number is 3999.

### Ruby implementations support

* MRI 1.8.7
* MRI 1.9.3
* REE 1.8.7-2012.02
* JRuby 1.7.0
* Rubinius 1.2.4

Licence
-------

The project uses Zlib License. See LICENCE file for more information.
