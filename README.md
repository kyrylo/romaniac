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

ten = Roman(10) #=> (Roman: X)
twelve = Roman(12) #=> (Roman: XII)
puts ten.to_i #=> 10

# Also, you can use strings as arguments.
Roman('53') #=> (Roman: LIII)
Roman('4444') #=> ArgumentError: invalid value for Roman(): "4444"/

puts <<yummy
Hi!
My name is Kyrylo #{ Roman(1) }.
I have #{ Roman(3) } chocolate bars.
I just ate #{ Roman(2) } of them!
yummy

# Prints out:
Hi!
My name is Kyrylo I.
I have III chocolate bars.
I just ate II of them!
```

Arthmetic operations.

```ruby
# Addition.
puts Roman(20) + Roman(5) #=> (Roman: XV)

# Subtraction.
Roman(20) - Roman(5) #=> (Roman: XV)

# Division.
puts Roman(20) / Roman(5) #=> (Roman: IV)

# Multiplication.
puts Roman(20) * Roman(5) #=> (Roman: C)
```

Comparison methods.

```ruby
Roman(20) > Roman(5) #=> true
Roman(20) < Roman(5) #=> false
Roman(20) == Roman(20) #=> true
```

If you feel brave enough, you can use monkey-patches.

```ruby
require 'romaniac/ext'

10.to_roman #=> X

# Enumerable goodness.
(:a..:c).each_with_roman_index.to_a
#=> [[:a, (Roman: I)], [:b, (Roman: II)], [:c, (Roman: III)]]
(:a..:c).map.with_roman_index(10).to_a
#=> [[:a, (Roman: X)], [:b, (Roman: XI)], [:c, (Roman: XII)]
```

If that is not enough for you, use Ruby constants as Roman numerals.

```ruby
require 'romaniac/const'

# Hrhr!
puts III + C #=> (Roman: CIII)
puts C / L #=> (Roman: II)
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
}.each.with_roman_index do |(t_begin, t_end), index|
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
* MRI 1.9.2
* MRI 1.9.3
* Latest REE
* JRuby 1.7.0
* Rubinius 1.2.4

Well, maybe in future (but screw it for now)
--------------------------------------------

Basically, these two features are intertwined.

* unicode support (so you can use Ⅷ or ⅷ instead of VIII);
* extended number limit (current limit is 3999, but can be extended up to
  399999 with help of unicode).

Licence
-------

The project uses Zlib License. See LICENCE file for more information.

[repo]: https://github.com/kyrylo/romaniac/
